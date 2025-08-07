package hotsource.model.asset_img;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.AssetImg;
import hotsource.exception.AssetImgException;

@Repository
public class MybatisAssetImgDAO implements AssetImgDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public AssetImg select(long asset_img_id) {
		return sqlSessionTemplate.selectOne("AssetImg.select", asset_img_id);
	}

	@Override
	public List<AssetImg> selectByAssetId(long asset_id) {
		return sqlSessionTemplate.selectList("AssetImg.selectByAssetId", asset_id);
	}

	@Override
	public AssetImg selectThumbnailByAssetId(long asset_id) {
		return sqlSessionTemplate.selectOne("AssetImg.selectThumbnailByAssetId", asset_id);
	}

	@Override
	public void insert( List<AssetImg> assetImgs ) throws AssetImgException{
		int result = sqlSessionTemplate.insert("AssetImg.insertBatch", assetImgs);
		if(result < 1) {
			throw new AssetImgException("에셋 스크린샷 등록 실패");
		}
	}

	@Override
	public void update(AssetImg assetImg) throws AssetImgException {
		int result = sqlSessionTemplate.update("AssetImg.update", assetImg);
		if(result < 1) {
			throw new AssetImgException("에셋 스크린샷 수정 실패");
		}
	}

	@Override
	public void delete(long asset_img_id) throws AssetImgException {
		int result = sqlSessionTemplate.delete("AssetImg.delete", asset_img_id);
		if(result < 1) {
			throw new AssetImgException("에셋 스크린샷 삭제 실패");
		}
	}

	@Override
	public void deleteByAssetId(long asset_id) {
		int result = sqlSessionTemplate.delete("AssetImg.deleteByAssetId", asset_id);
		if(result < 1) {
			throw new AssetImgException("에셋 스크린샷 다건 삭제 실패");
		}
	}
	
	

}
