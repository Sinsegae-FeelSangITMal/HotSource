package hotsource.model.asset_file;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.AssetFile;
import hotsource.exception.AssetFileInsertException;

@Repository
public class MybatisAssetFileDAO implements AssetFileDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insert(List<AssetFile> assetFilesList) throws AssetFileInsertException{
		int result = sqlSessionTemplate.insert("AssetFile.insert", assetFilesList);
		if(result < 1) {
			throw new AssetFileInsertException("asset file 업로드 실패");
		}
	}

	@Override
	public List<AssetFile> selectByAssetId(long asset_id) {
		return sqlSessionTemplate.selectList("AssetFile.selectByAssetId",asset_id);
	}

	@Override
	public void deleteByAssetId(long asset_id) {
		sqlSessionTemplate.delete("AssetFile.deleteByAssetId", asset_id);
	}

}
