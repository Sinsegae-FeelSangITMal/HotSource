package hotsource.model.asset;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import hotsource.domain.Asset;
import hotsource.domain.AssetFile;
import hotsource.domain.AssetImg;
import hotsource.domain.AssetKeywordMapping;
import hotsource.domain.Keyword;
import hotsource.domain.Sale;
import hotsource.exception.AssetException;
import hotsource.model.asset_file.AssetFileDAO;
import hotsource.model.asset_img.AssetImgDAO;
import hotsource.model.asset_keyword_mapping.AssetKeywordMappingDAO;
import hotsource.model.keyword.KeywordDAO;
import hotsource.model.cart.CartService;
import hotsource.model.ordered.OrderedService;
import hotsource.model.review.ReviewService;
import hotsource.model.sale.SaleDAO;
import hotsource.model.sale.SaleService;
import hotsource.model.wishlist.AssetCardDTO;
import hotsource.model.wishlist_item.WishlistItemService;
import hotsource.util.FileManager;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AssetServiceImpl implements AssetService {

	@Autowired
	private AssetDAO assetDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private AssetImgDAO assetImgDAO;
	
	@Autowired
	private AssetFileDAO assetFileDAO;
	
	@Autowired
	private SaleDAO saleDAO;
	
	@Autowired
	private KeywordDAO keywordDAO;
	
	@Autowired
	private AssetKeywordMappingDAO assetKeywordMappingDAO;
	
	@Autowired 
	private SaleService saleService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private OrderedService orderedService;
	
	@Autowired 
	private WishlistItemService wishlistItemService;
	
	@Autowired
	private CartService cartService;

	@Override
	public List selectAll() {
		return assetDAO.selectAll();
	}

	@Override
	public Asset select(long asset_id) {
		return assetDAO.select(asset_id);
	}

	public List selectBySellerId(long seller_id) {
		return assetDAO.selectBySellerId(seller_id);
	}

	@Override
	public int selectCount(long seller_id) {
		return assetDAO.selectCount(seller_id);
	}
	@Transactional
	public void registFullAsset(Asset asset, MultipartFile[] imgFiles, MultipartFile[] assetFiles, String keywordString, HttpServletRequest request) {
	    // 1. 키워드 파싱
	    String[] keywordArr = keywordString.split(",");
	    Set<String> keywordSet = Arrays.stream(keywordArr)
	        .map(String::trim)
	        .filter(s -> !s.isEmpty())
	        .collect(Collectors.toSet());

	    // 2. asset insert (MyBatis에서 @Options(useGeneratedKeys=true) 설정 필수)
	    assetDAO.insert(asset);
	    
	    // 3. 키워드 매핑 리스트 생성 및 asset 객체 연결
	    List<AssetKeywordMapping> keywordMappingList = new ArrayList<>();
	    for (String keywordName : keywordSet) {
	        Keyword keyword = keywordDAO.selectByName(keywordName);
	        if (keyword == null) {
	            keyword = new Keyword();
	            keyword.setKeyword_name(keywordName);
	            keywordDAO.insert(keyword); // @Options(useGeneratedKeys=true) 설정 필요
	        }

	        AssetKeywordMapping mapping = new AssetKeywordMapping();
	        mapping.setKeyword(keyword);
	        mapping.setAsset(asset);
	        keywordMappingList.add(mapping);
	    }
	    
	    // 4. 키워드 매핑 삽입
	    assetKeywordMappingDAO.insert(keywordMappingList);
	    
	    Long assetId = asset.getAsset_id();
	    String savePath = request.getServletContext().getRealPath("/data");

	    // 5. 에셋 이미지 저장
	    String screenshotDir = savePath + "/asset_img/" + assetId;
	    List<String> imgFilenames = fileManager.imgUpload(imgFiles, screenshotDir);

	    List<AssetImg> assetImgs = new ArrayList<>();
	    for (int i = 0; i < imgFilenames.size(); i++) {
	        AssetImg assetImg = new AssetImg();
	        assetImg.setAsset_img_url(imgFilenames.get(i));
	        assetImg.set_thumb(i == 0);
	        assetImg.setAsset(asset);
	        assetImgs.add(assetImg);
	    }
	    assetImgDAO.insert(assetImgs);

	    // 6. 프로젝트 파일 저장
	    String projectDir = savePath + "/asset/" + assetId;
	    List<String> assetFilenames = fileManager.imgUpload(assetFiles, projectDir);

	    List<AssetFile> assetFilesList = new ArrayList<>();
	    for (String filename : assetFilenames) {
	        AssetFile assetFile = new AssetFile();
	        assetFile.setFile_url(filename);
	        assetFile.setAsset(asset);
	        assetFilesList.add(assetFile);
	    }
	    assetFileDAO.insert(assetFilesList);
	}
	
	@Transactional
	public void updateFullAsset(Asset asset, MultipartFile[] imgFiles, MultipartFile[] assetFiles, String keywordString, HttpServletRequest request) {
	    // 1. 키워드 처리 (기존 키워드를 조회하거나 없으면 삽입 후 ID 확보)
	    String[] keywordArr = keywordString.split(",");
	    Set<String> keywordSet = Arrays.stream(keywordArr)
	        .map(String::trim)
	        .filter(s -> !s.isEmpty())
	        .collect(Collectors.toSet());

	    List<AssetKeywordMapping> keywordMappingList = new ArrayList<>();
	    for (String keywordName : keywordSet) {
	        Keyword keyword = keywordDAO.selectByName(keywordName);
	        if (keyword == null) {
	            keyword = new Keyword();
	            keyword.setKeyword_name(keywordName);
	            keywordDAO.insert(keyword); // @Options(useGeneratedKeys=true) 필수
	        }

	        AssetKeywordMapping mapping = new AssetKeywordMapping();
	        mapping.setKeyword(keyword);
	        mapping.setAsset(asset);
	        keywordMappingList.add(mapping);
	    }

	    // 2. 기존 asset 수정 + 키워드 재설정
	    assetDAO.update(asset);
	    assetKeywordMappingDAO.deleteByAssetId(asset.getAsset_id());
	    assetKeywordMappingDAO.insert(keywordMappingList);

	    String savePath = request.getServletContext().getRealPath("/data");

	    // 3. 기존 이미지 삭제 + 새 이미지 저장
	    long assetId = asset.getAsset_id();
	    
	    // 3.1 파일에서 삭제 
	    List<AssetImg> existingImgs = assetImgDAO.selectByAssetId(assetId);
	    for (AssetImg img : existingImgs) {
	    	fileManager.deleteFile(savePath + "/asset_img/"+ assetId +"/"+ img.getAsset_img_url());
	    	log.debug("file deleteFIle AssetIMg:"+savePath + "/asset_img/"+ assetId +"/"+ img.getAsset_img_url());
	    }
	    // 3.2 db에서 삭제 
	    assetImgDAO.deleteByAssetId(assetId);
	    
	    String screenshotDir = savePath + "/asset_img/" + assetId;
	    List<String> imgFilenames = fileManager.imgUpload(imgFiles, screenshotDir);

	    List<AssetImg> assetImgs = new ArrayList<>();
	    for (int i = 0; i < imgFilenames.size(); i++) {
	        AssetImg assetImg = new AssetImg();
	        assetImg.setAsset_img_url(imgFilenames.get(i));
	        assetImg.set_thumb(i == 0);
	        assetImg.setAsset(asset);
	        log.debug("AssetImg  : "+ assetImg);
	        assetImgs.add(assetImg);
	    }
	    if (assetImgs != null && !assetImgs.isEmpty()) {
	    	assetImgDAO.insert(assetImgs);
	    }

	    // 4. 기존 파일 삭제 + 새 파일 저장

	    List<AssetFile> existingFiles = assetFileDAO.selectByAssetId(assetId);
	    for (AssetFile file : existingFiles) {
	        fileManager.deleteFile(savePath + "/asset/"+ assetId +"/"+ file.getFile_url());
	    	log.debug("file deleteFIle AssetFile:"+savePath + "/asset/"+ assetId +"/"+ file.getFile_url());
	    }
	    assetFileDAO.deleteByAssetId(assetId);
	    
	    String projectDir = savePath + "/asset/" + assetId;
	    List<String> assetFilenames = fileManager.imgUpload(assetFiles, projectDir);

	    List<AssetFile> assetFilesList = new ArrayList<>();
	    for (String filename : assetFilenames) {
	        AssetFile assetFile = new AssetFile();
	        assetFile.setFile_url(filename);
	        assetFile.setAsset(asset);
	        log.debug("AssetFile  : "+ assetFile);
	        assetFilesList.add(assetFile);
	    }
	    if (assetFilesList != null && !assetFilesList.isEmpty()) {
	    	assetFileDAO.insert(assetFilesList);
	    }
	}



	public List selectHot(int topcategory_id) {
		return assetDAO.selectHot(topcategory_id);
	}

	@Override
	public List selectNew(int topcategory_id) {
		return assetDAO.selectNew(topcategory_id);
	}

	@Override
	public List selectFree(int topcategory_id) {
		return assetDAO.selectFree(topcategory_id);
	}

	@Override
	public List selectSale(int topcategory_id) {
		return assetDAO.selectSale(topcategory_id);
	}

	@Override
	public void delete(long asset_id) {

	}

	@Override
	public int getDiscountPrice(Asset asset) {
		if(asset.getSale() == null) {
			return 0;
		}else {
			return asset.getPrice() -(asset.getPrice() * asset.getSale().getSale_value() / 100); 
		}
	}
	
	//출시 일주일 간은 신규 에셋으로 분류
	public boolean isNew(Asset asset) {
	    return asset.getCreate_date().toLocalDateTime().isAfter(LocalDateTime.now().minusDays(7));
	}
	
	//조회수가 1000 이상이면 인기 에셋으로 분류
	public boolean isHot(Asset asset) {
		return asset.getView_count() > 1000;
	}

	@Override
	public AssetCardDTO buildAssetCardDTO(long asset_id, long user_id) {
		AssetCardDTO dto = new AssetCardDTO();
		Asset asset = select(asset_id);
		
		dto.setAsset_id(asset_id);
		dto.setSeller_name(asset.getSeller().getSeller_name());
		dto.setTitle(asset.getTitle());
		dto.setPrice(asset.getPrice());
		dto.setThumbnail_url(asset.getThumbnail().getAsset_img_url());
		if(asset.getSale() != null) {
			dto.setSale_value(asset.getSale().getSale_value());
		}
		dto.setSalePrice(getDiscountPrice(asset));
		dto.setAverage_rate(reviewService.getAverageRateByAssetId(asset_id));
		dto.setReview_count(reviewService.countByAssetId(asset_id));
		dto.setPurchased(orderedService.isPurchased(user_id, asset_id));
		dto.setWished(wishlistItemService.isWished(user_id, asset_id));
		dto.setInCart(cartService.isInCart(user_id, asset_id));
		dto.setNew(isNew(asset));
		dto.setHot(isHot(asset));		
		
		return dto;
	}
	
	public AssetDetailDTO getDetail(long asset_id, long user_id) {
		AssetDetailDTO dto = new AssetDetailDTO();
		
		Asset asset = select(asset_id); 
		
		dto.setAsset(asset);
		dto.setAverage_rate(reviewService.getAverageRateByAssetId(asset_id));
		dto.setReview_count(reviewService.countByAssetId(asset_id));
		dto.setWish_count(wishlistItemService.countByAssetId(asset_id));
		dto.setSale_price(getDiscountPrice(asset));
		dto.setCart(cartService.isInCart(user_id, asset_id));
		dto.setPurchased(orderedService.isPurchased(user_id, asset_id));
		dto.setWished(wishlistItemService.isWished(user_id, asset_id));
		
		dto.printAsset();
		
		return dto;
	}
}
