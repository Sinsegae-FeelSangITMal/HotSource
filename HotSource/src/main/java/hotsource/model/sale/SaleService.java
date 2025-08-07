package hotsource.model.sale;

import java.util.List;

import hotsource.domain.Sale;

public interface SaleService {
	public List selectAll();
	public Sale select(long sale_id);
	public Sale selectByAssetId(long asset_id);
	public Sale selectValidByAssetId(long asset_id);
}
