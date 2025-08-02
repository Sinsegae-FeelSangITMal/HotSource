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
import hotsource.domain.Sale;
import hotsource.model.asset_file.AssetFileDAO;
import hotsource.exception.AssetException;
import hotsource.model.asset_img.AssetImgDAO;
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
		Sale sale = saleService.selectByAssetId(asset.getAsset_id());
		
		if(sale == null) {
			return 0;
		}else {
			return asset.getPrice() -(asset.getPrice() * sale.getSale_value() / 100); 
		}
	}
}
