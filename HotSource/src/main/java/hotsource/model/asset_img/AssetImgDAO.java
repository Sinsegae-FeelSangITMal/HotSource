package hotsource.model.asset_img;

import java.util.List;

import hotsource.domain.AssetImg;

public interface AssetImgDAO {
	
	public AssetImg select(long asset_img_id);
	public List<AssetImg> selectByAssetId(long asset_img_id);
	public AssetImg selectThumbnailByAssetId(long asset_id);
	
	public void insert(List<AssetImg> assetImgs);
	public void update(AssetImg assetImg);
	public void delete(long asset_img_id);
	public void deleteByAssetId(long asset_id);

}
