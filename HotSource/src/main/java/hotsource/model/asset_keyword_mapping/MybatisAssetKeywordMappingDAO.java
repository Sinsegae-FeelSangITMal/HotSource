package hotsource.model.asset_keyword_mapping;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.AssetKeywordMapping;
import hotsource.exception.AssetKeywordMappingException;

@Repository
public class MybatisAssetKeywordMappingDAO implements AssetKeywordMappingDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectByAssetId(long asset_id) {
		return sqlSessionTemplate.selectList("AssetKeywordMapping.selectByAssetId", asset_id);
	}

	@Override
	public void insert(List<AssetKeywordMapping> assetKeywordMappingList) throws AssetKeywordMappingException{
		int result = sqlSessionTemplate.insert("AssetKeywordMapping.insert", assetKeywordMappingList);
		if(result< 1) {
			throw new AssetKeywordMappingException("에셋 키워드 매핑 실패 ");
		}
		
	}

	@Override
	public void deleteByAssetId(long asset_id) {
		int result = sqlSessionTemplate.insert("AssetKeywordMapping.deleteByAssetId", asset_id);
		if(result< 1) {
			throw new AssetKeywordMappingException("에셋 키워드 매핑 실패 ");
		}
	}
}
