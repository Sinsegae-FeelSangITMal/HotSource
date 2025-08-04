package hotsource.model.sale;

import java.util.List;

import hotsource.domain.Sale;

public interface SaleDAO {
	public List selectAll();
	public Sale select(long sale_id);
	public Sale selectByAssetId(long asset_id);
	public Sale selectValidByAssetId(long asset_id);
	public void insert(Sale sale);
	public void update(Sale sale);
	public void deleteByAssetId(long asset_id);
}
