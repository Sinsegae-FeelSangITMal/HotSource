package hotsource.model.asset;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hotsource.domain.Asset;
import hotsource.util.FileManager;

@Service
public class AssetServiceImpl implements AssetService {
	
	@Autowired
	private AssetDAO assetDAO;
	
	@Autowired
	private FileManager fileManager;
	
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
	@Transactional
	public void regist(Asset asset, String savePath) {
		assetDAO.insert(asset);
	}

	@Override
	public void update(Asset asset) {
		
	}

	@Override
	public void delete(long asset_id) {
		
	}
}
