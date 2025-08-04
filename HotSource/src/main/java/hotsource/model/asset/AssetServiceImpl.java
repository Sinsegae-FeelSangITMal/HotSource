package hotsource.model.asset;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import hotsource.domain.Asset;
import hotsource.domain.AssetFile;
import hotsource.domain.AssetImg;
import hotsource.domain.Sale;
import hotsource.exception.AssetException;
import hotsource.model.asset_file.AssetFileDAO;
import hotsource.model.asset_img.AssetImgDAO;
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
	
	public void saveAssetFiles(Long assetId, MultipartFile[] imgFiles, MultipartFile[] assetFiles, HttpServletRequest request) {
		log.debug("imgFiles length = {}", imgFiles.length);
	    
	    String savePath = request.getServletContext().getRealPath("/data");

	    // 1. 에셋 이미지 저장
	    String screenshotDir = savePath + "/asset_img/" + assetId;
	    List<String> imgFilenames = fileManager.imgUpload(imgFiles, screenshotDir);

	    List<AssetImg> assetImgs = new ArrayList<>();
	    for (int i = 0; i < imgFilenames.size(); i++) {
	        AssetImg assetImg = new AssetImg();
	        assetImg.setAsset_img_url("data/asset_img/" + assetId + "/" + imgFilenames.get(i));
	        assetImg.set_thumb(i == 0); // 썸네일 지정
	        Asset asset = new Asset();
	        asset.setAsset_id(assetId);
	        assetImg.setAsset(asset);
	        assetImgs.add(assetImg);
	    }
	    log.debug("Asset ID: {}", assetId);
	    log.debug("assetImgs: {}", assetImgs);
	    for (AssetImg img : assetImgs) {
	        log.debug("imgUrl={}, isThumb={}, assetId={}", img.getAsset_img_url(), img.is_thumb(), img.getAsset().getAsset_id());
	    }
	    
	    assetImgDAO.insert(assetImgs);

	    // 2. 프로젝트 파일 저장
	    String projectDir = savePath + "/asset/" + assetId;
	    List<String> assetFilenames = fileManager.imgUpload(assetFiles, projectDir);

	    List<AssetFile> assetFilesList = new ArrayList<>();
	    for (String filename : assetFilenames) {
	        AssetFile assetFile = new AssetFile();
	        assetFile.setFile_url("data/asset/" + assetId + "/" + filename);
	        Asset asset = new Asset();
	        asset.setAsset_id(assetId);
	        assetFile.setAsset(asset);
	        assetFilesList.add(assetFile);
	    }
	    assetFileDAO.insert(assetFilesList);
	}

	public List selectHot(long topcategory_id) {
		return assetDAO.selectHot(topcategory_id);
	}

	@Override
	public List selectNew(long topcategory_id) {
		return assetDAO.selectNew(topcategory_id);
	}

	@Override
	public List selectFree(long topcategory_id) {
		return assetDAO.selectFree(topcategory_id);
	}

	@Override
	public List selectSale(long topcategory_id) {
		return assetDAO.selectSale(topcategory_id);
	}
	
	@Override
	@Transactional
	public void regist(Asset asset) throws AssetException{
		// DB에 데이터 등록 (+PK값 자동 추출)
		assetDAO.insert(asset);
		
		// 서버에 이미지 등록
		
		  // Sale 정보가 있다면 저장
	    if (asset.getSale() != null && asset.getSale().getSale_value() != 0) {
	        Sale sale = asset.getSale();
	        sale.setAsset_id(asset.getAsset_id()); // FK 설정
	        saleDAO.insert(sale); // Sale 테이블에 insert
	    }
	}

	@Override
	public void update(Asset asset) {

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
