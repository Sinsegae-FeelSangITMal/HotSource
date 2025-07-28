package hotsource.model.sale;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Sale;

@Repository
public class MybatisSaleDAO implements SaleDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Sale.selectAll");
	}

	@Override
	public Sale select(long sale_id) {
		return sqlSessionTemplate.selectOne("Sale.select", sale_id);
	}

	@Override
	public Sale selectByAssetId(long asset_id) {
		return sqlSessionTemplate.selectOne("Sale.selectByAssetId", asset_id);
	}
}
