package hotsource.model.asset;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.Asset;
import hotsource.model.seller.SellerDAO;

@Service
public class AssetServiceImpl implements AssetService{

	@Autowired
	private AssetDAO assetDAO;
	
	@Override
	public List selectAll() {
		return assetDAO.selectAll();
	}

	@Override
	public Asset select(int asset_id) {
		return assetDAO.select(asset_id);
	}

	@Override
	public void regist(Asset asset) {
		
	}

	@Override
	public void update(Asset asset) {
		
	}

	@Override
	public void delete(int asset_id) {
		
	}

}
