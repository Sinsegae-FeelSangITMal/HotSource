package hotsource.model.asset;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hotsource.domain.Asset;
import hotsource.domain.AssetImg;
import hotsource.domain.Sale;
import hotsource.exception.AssetException;
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

	@Transactional
	public void regist(Asset asset, String savePath) throws AssetException{
		// DB에 데이터 등록 (+PK값 자동 추출)
		assetDAO.insert(asset);
		
		// 서버에 이미지 등록
		
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
