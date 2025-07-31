package hotsource.model.asset;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.Asset;
import hotsource.domain.AssetImg;
import hotsource.domain.Sale;
import hotsource.model.asset_img.AssetImgDAO;
import hotsource.model.sale.SaleService;

@Service
public class AssetServiceImpl implements AssetService {
	
	@Autowired
	private AssetDAO assetDAO;
	
	@Autowired
	private AssetImgDAO assetImgDAO;
	
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

	@Override
	public void regist(Asset asset) {
		
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

	@Override
	public AssetImg getThumbnail(long asset_id) {
		return assetImgDAO.selectThumbnailByAssetId(asset_id);
	}
	
	
	
}
