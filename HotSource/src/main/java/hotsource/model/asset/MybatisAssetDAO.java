package hotsource.model.asset;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Asset;

@Repository
public class MybatisAssetDAO implements AssetDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Asset.selectAll");
	}

	@Override
	public Asset select(long asset_id) {
		return sqlSessionTemplate.selectOne("Asset.select", asset_id);
	}
	
	public List selectBySellerId(long seller_id) {
		return sqlSessionTemplate.selectList("Asset.selectBySellerId", seller_id);
	}

	@Override
	public void regist(Asset asset) {
		
	}

	@Override
	public void update(Asset asset) {
		
	}

	@Override
	public void delete(long asset_id) {
		
	}

}
