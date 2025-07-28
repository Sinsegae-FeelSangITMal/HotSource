package hotsource.model.sale;

import java.util.List;

import hotsource.domain.Sale;

public interface SaleDAO {
	public List selectAll();
	public Sale select(int sale_id);
	public Sale selectByAssetId(int asset_id);
}
