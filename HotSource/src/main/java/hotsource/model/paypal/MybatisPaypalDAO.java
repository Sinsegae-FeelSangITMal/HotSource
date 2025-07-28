package hotsource.model.paypal;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Paypal;

@Repository
public class MybatisPaypalDAO implements PaypalDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Paypal.selectAll");
	}

	@Override
	public Paypal select(int paypal_id) {
		return sqlSessionTemplate.selectOne("Paypal.select", paypal_id);
	}

	@Override
	public Paypal selectBySellerId(int seller_id) {
		return sqlSessionTemplate.selectOne("Paypal.selectBySellerId", seller_id);
	}
}
