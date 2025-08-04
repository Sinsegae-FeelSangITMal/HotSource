package hotsource.model.asset;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import hotsource.domain.Asset;
import hotsource.domain.AssetImg;

public interface AssetService {
	public List selectAll();
	public Asset select(long asset_id);
	public List selectBySellerId(long seller_id);
	public int selectCount(long seller_id);
	public List selectHot(int topcategory_id);
	public List selectNew(int topcategory_id);
	public List selectFree(int topcategory_id);
	public List selectSale(int topcategory_id);
	
	public void saveAssetFiles(Long assetId, MultipartFile[] photoFiles, MultipartFile[] projectFiles, HttpServletRequest request);
	public void updateAssetFiles(Long assetId, MultipartFile[] photoFiles, MultipartFile[] projectFiles, HttpServletRequest request);

	public void regist(Asset asset);
	public void update(Asset asset);
	public void delete(long asset_id);
	
	//할인 적용된 가격 구하기 (10000원에서 20%할인해서 최종 가격 : 8000원 반환)
	public int getDiscountPrice(Asset asset); 
}
