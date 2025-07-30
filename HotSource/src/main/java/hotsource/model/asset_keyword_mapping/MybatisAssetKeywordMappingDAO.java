package hotsource.model.asset_keyword_mapping;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisAssetKeywordMappingDAO implements AssetKeywordMappingDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectByAssetId(long asset_id) {
		return sqlSessionTemplate.selectList("AssetKeywordMapping.selectByAssetId", asset_id);
	}
}
