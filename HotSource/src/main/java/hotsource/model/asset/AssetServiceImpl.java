package hotsource.model.asset;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import hotsource.domain.Asset;
import hotsource.domain.AssetFile;
import hotsource.util.FileManager;
import lombok.extern.slf4j.Slf4j;
import hotsource.domain.AssetImg;
import hotsource.domain.AssetKeywordMapping;
import hotsource.domain.Keyword;
import hotsource.domain.Sale;
import hotsource.model.asset_file.AssetFileDAO;
import hotsource.exception.AssetException;
import hotsource.model.asset_img.AssetImgDAO;
import hotsource.model.asset_keyword_mapping.AssetKeywordMappingDAO;
import hotsource.model.keyword.KeywordDAO;
import hotsource.model.sale.SaleDAO;
import hotsource.model.sale.SaleService;

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
	public void saveAssetFiles(Long assetId, MultipartFile[] imgFiles, MultipartFile[] assetFiles, HttpServletRequest request) {
		log.debug("imgFiles length = {}", imgFiles.length);
	    
	    String savePath = request.getServletContext().getRealPath("/data");

	    // 1. 에셋 이미지 저장
	    String screenshotDir = savePath + "/asset_img/" + assetId;
	    List<String> imgFilenames = fileManager.imgUpload(imgFiles, screenshotDir);

	    List<AssetImg> assetImgs = new ArrayList<>();
	    for (int i = 0; i < imgFilenames.size(); i++) {
	        AssetImg assetImg = new AssetImg();
	        assetImg.setAsset_img_url(imgFilenames.get(i));
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
	        assetFile.setFile_url(filename);
	        Asset asset = new Asset();
	        asset.setAsset_id(assetId);
	        assetFile.setAsset(asset);
	        assetFilesList.add(assetFile);
	    }
	    assetFileDAO.insert(assetFilesList);
	}
	
	@Transactional
	public void updateAssetFiles(Long assetId, MultipartFile[] imgFiles, MultipartFile[] assetFiles, HttpServletRequest request) {
	    String savePath = request.getServletContext().getRealPath("/data");

	    // 1. 기존 에셋 이미지 삭제 처리 (DB 및 저장소)
	    List<AssetImg> existingImgs = assetImgDAO.selectByAssetId(assetId);
	    for (AssetImg img : existingImgs) {
	        // 파일 삭제 (fileManager에서 구현 필요)
	    	log.debug("img.getAsset_img_url() :" + img.getAsset_img_url());
	    	fileManager.deleteFile(savePath + "/asset_img/"+ assetId +"/"+ img.getAsset_img_url());
	    }
	    assetImgDAO.deleteByAssetId(assetId);

	    // 2. 새로운 에셋 이미지 저장
	    String screenshotDir = savePath + "/asset_img/" + assetId;
	    List<String> imgFilenames = fileManager.imgUpload(imgFiles, screenshotDir);

	    List<AssetImg> newAssetImgs = new ArrayList<>();
	    for (int i = 0; i < imgFilenames.size(); i++) {
	        AssetImg assetImg = new AssetImg();
	        assetImg.setAsset_img_url(imgFilenames.get(i));
	        assetImg.set_thumb(i == 0); // 썸네일 지정
	        Asset asset = new Asset();
	        asset.setAsset_id(assetId);
	        assetImg.setAsset(asset);
	        newAssetImgs.add(assetImg);
	    }
	    log.debug("newAsset ID: {}", assetId);
	    log.debug("new assetImgs: {}", newAssetImgs);
	    for (AssetImg img : newAssetImgs) {
	        log.debug("new imgUrl={}, isThumb={}, assetId={}", img.getAsset_img_url(), img.is_thumb(), img.getAsset().getAsset_id());
	    }
	    assetImgDAO.insert(newAssetImgs);

	    // 3. 기존 프로젝트 파일 삭제 처리
	    List<AssetFile> existingFiles = assetFileDAO.selectByAssetId(assetId);
	    for (AssetFile file : existingFiles) {
	    	log.debug("file.getFile_url() :" + file.getFile_url());
	        fileManager.deleteFile(savePath + "/asset/"+ assetId +"/"+ file.getFile_url());
	    }
	    assetFileDAO.deleteByAssetId(assetId);

	    // 4. 새로운 프로젝트 파일 저장
	    String projectDir = savePath + "/asset/" + assetId;
	    List<String> assetFilenames = fileManager.imgUpload(assetFiles, projectDir);

	    List<AssetFile> newAssetFiles = new ArrayList<>();
	    for (String filename : assetFilenames) {
	        AssetFile assetFile = new AssetFile();
	        assetFile.setFile_url(filename);
	        Asset asset = new Asset();
	        asset.setAsset_id(assetId);
	        assetFile.setAsset(asset);
	        newAssetFiles.add(assetFile);
	    }
	    assetFileDAO.insert(newAssetFiles);
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
	@Transactional
	public void regist(Asset asset) throws AssetException{
		// DB에 데이터 등록 (+PK값 자동 추출)
		assetDAO.insert(asset);
		for (AssetKeywordMapping keywordMapping : asset.getKeywordList()) {
			String keywordName = keywordMapping.getKeyword().getKeyword_name();
			
		    Keyword keyword = keywordDAO.selectByName(keywordName);
		    if (keyword == null) {
			    keyword = new Keyword();
			    keyword.setKeyword_name(keywordName);
			    keywordDAO.insert(keyword); // keyword_id 생성됨
			} 

		    // 3. 매핑 저장
		    AssetKeywordMapping mapping = new AssetKeywordMapping();
		    mapping.setAsset(asset);
		    mapping.setKeyword(keyword);
		    assetKeywordMappingDAO.insert(mapping);
		}
		
		  // Sale 정보가 있다면 저장
	    if (asset.getSale() != null && asset.getSale().getSale_value() != 0) {
	        Sale sale = asset.getSale();
	        sale.setAsset_id(asset.getAsset_id()); // FK 설정
	        saleDAO.insert(sale); // Sale 테이블에 insert
	    }
	}

	@Override
	@Transactional
	public void update(Asset asset) throws AssetException {
	    // 1. 기본 Asset 정보 수정
	    assetDAO.update(asset);

	    // 2. 기존 키워드 매핑 삭제
	    assetKeywordMappingDAO.deleteByAssetId(asset.getAsset_id());

	    // 3. 새 키워드 매핑 등록
	    for (AssetKeywordMapping keywordMapping : asset.getKeywordList()) {
	        String keywordName = keywordMapping.getKeyword().getKeyword_name();

	        Keyword keyword = keywordDAO.selectByName(keywordName);
	        if (keyword == null) {
	            keyword = new Keyword();
	            keyword.setKeyword_name(keywordName);
	            keywordDAO.insert(keyword); // 새 키워드 insert
	        }

	        AssetKeywordMapping mapping = new AssetKeywordMapping();
	        mapping.setAsset(asset);
	        mapping.setKeyword(keyword);
	        assetKeywordMappingDAO.insert(mapping);
	    }

	    // 4. Sale 정보 업데이트
	    Sale newSale = asset.getSale();
	    Sale existingSale = saleDAO.selectByAssetId(asset.getAsset_id());

	    if (existingSale != null) {
	        // 기존 Sale이 있었고 새 값이 있다면 수정 or 삭제
	        if (newSale != null && newSale.getSale_value() != 0) {
	            newSale.setAsset_id(asset.getAsset_id());
	            saleDAO.update(newSale);
	        } else {
	            saleDAO.deleteByAssetId(asset.getAsset_id());
	        }
	    } else {
	        // 기존 Sale이 없었고 새 값이 있다면 insert
	        if (newSale != null && newSale.getSale_value() != 0) {
	            newSale.setAsset_id(asset.getAsset_id());
	            saleDAO.insert(newSale);
	        }
	    }

	    // 기타 파일 및 이미지 업데이트는 별도 처리 (파일 삭제 후 다시 insert 등)
	}


	@Override
	public void delete(long asset_id) {

	}

	@Override
	public int getDiscountPrice(Asset asset) {
		Sale sale = saleService.selectByAssetId(asset.getAsset_id());
		
		if(sale == null) {
			return 0;
		}else {
			return asset.getPrice() -(asset.getPrice() * sale.getSale_value() / 100); 
		}
	}
}
