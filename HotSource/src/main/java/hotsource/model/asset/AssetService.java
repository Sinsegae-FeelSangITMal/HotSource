package hotsource.model.asset;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import hotsource.domain.Asset;
import hotsource.model.wishlist.AssetCardDTO;

public interface AssetService {
	public List selectAll();
	public List selectSaleAll();
	public Asset select(long asset_id);
	public List selectBySellerId(long seller_id);
	public int selectCount(long seller_id);
	public List selectHot(int topcategory_id);
	public List selectNew(int topcategory_id);
	public List selectFree(int topcategory_id);
	public List selectSale(int topcategory_id);
	
	public void registFullAsset(Asset asset, MultipartFile[] imgFiles, MultipartFile[] assetFiles, String keywordString, HttpServletRequest request);
	public void updateFullAsset(Asset asset, MultipartFile[] imgFiles, MultipartFile[] assetFiles, String keywordString, HttpServletRequest request);
	
	public void delete(long asset_id);
	
	//할인 적용된 가격 구하기 (10000원에서 20%할인해서 최종 가격 : 8000원 반환)
	public int getDiscountPrice(Asset asset); 
	
	//asset card 정보 가져오기
	public AssetCardDTO buildAssetCardDTO(long asset_id, long user_id);
	
	public AssetDetailDTO getDetail(long asset_id, long user_id);
	
}
