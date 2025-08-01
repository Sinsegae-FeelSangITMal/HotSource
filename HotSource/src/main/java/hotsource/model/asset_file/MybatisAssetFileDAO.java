package hotsource.model.asset_file;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.AssetFile;

@Repository
public class MybatisAssetFileDAO implements AssetFileDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insert(List<AssetFile> assetFilesList) {
		int result = sqlSessionTemplate.insert("AssetFile.insert", assetFilesList);
	}

}
