package hotsource.model.ordered_asset;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.OrderedAsset;

@Repository
public class MybatisOrderedAssetDAO implements OrderedAssetDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("OrderedAsset.selectAll");
	}

	@Override
	public OrderedAsset select(int order_asset_id) {
		return sqlSessionTemplate.selectOne("OrderedAsset.select", order_asset_id);
	}

	@Override
	public List selectByOrderId(int order_id) {
		return sqlSessionTemplate.selectList("OrderedAsset.selectByOrderId", order_id);
	}
}
