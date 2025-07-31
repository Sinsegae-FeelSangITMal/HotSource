package hotsource.model.seller;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Seller;
import hotsource.exception.SellerException;

@Repository
public class MybatisSellerDAO implements SellerDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Seller.selectAll");
	}

	@Override
	public Seller select(long seller_id) {
		return sqlSessionTemplate.selectOne("Seller.select", seller_id);
	}

	@Override
	public Seller selectByUserId(long user_id) {
		return sqlSessionTemplate.selectOne("Seller.selectByUserId", user_id);
	}

	@Override
	public void insert(Seller seller) throws SellerException{
		int result = sqlSessionTemplate.insert("Seller.insert", seller);
		if(result < 1) {
			throw new SellerException("판매자 등록 실패");
		}
	}
	
	
}
