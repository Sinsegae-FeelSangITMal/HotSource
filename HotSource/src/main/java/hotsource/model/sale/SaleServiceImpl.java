package hotsource.model.sale;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.Sale;

@Service
public class SaleServiceImpl implements SaleService {

	@Autowired
	private SaleDAO saleDAO;
	
	@Override
	public List selectAll() {
		return saleDAO.selectAll();
	}

	@Override
	public Sale select(long sale_id) {
		return saleDAO.select(sale_id);
	}

	@Override
	public Sale selectByAssetId(long asset_id) {
		return saleDAO.selectByAssetId(asset_id);
	}
}
