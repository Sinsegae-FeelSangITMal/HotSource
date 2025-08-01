package hotsource.model.asset;

import java.util.List;

import hotsource.domain.Asset;
import hotsource.domain.AssetImg;

public interface AssetService {
	public List selectAll();
	public Asset select(long asset_id);
	public List selectBySellerId(long seller_id);
	public int selectCount(long seller_id);
	
	public void regist(Asset asset, String savePath);
	public void update(Asset asset);
	public void delete(long asset_id);
	
	//할인 적용된 가격 구하기 (10000원에서 20%할인해서 최종 가격 : 8000원 반환)
	public int getDiscountPrice(Asset asset); 
	public AssetImg getThumbnail(long asset_id);
}
