package hotsource.model.cart;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Cart;
import hotsource.exception.CartException;

@Repository
public class MybatisCartDAO implements CartDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insert(Cart cart) throws CartException{
		int result = sqlSessionTemplate.insert("Cart.insert", cart); 
		if(result < 1) {
			throw new CartException("장바구니 에셋 담기 실패");
		}
	}

	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Cart.selectAll");
	}

	@Override
	public Cart select(long cart_id) {
		return sqlSessionTemplate.selectOne("Cart.select", cart_id);
	}

	@Override
	public List selectByUserId(long user_id) {
		return sqlSessionTemplate.selectList("Cart.selectByUserId", user_id);
	}

	@Override
	public void delete(long cart_id) throws CartException{
		int result = sqlSessionTemplate.delete("Cart.delete", cart_id);
		if(result < 1) {
			throw new CartException("장바구니 에셋 한 건 삭제 실패");
		}
	}

	@Override
	public void deleteByCartIds(List<Long> cart_ids) {
		int result = sqlSessionTemplate.delete("Cart.deleteByCartIds", cart_ids);
		if(result < cart_ids.size()) {
			throw new CartException("장바구니 에셋 다 건 삭제 실패");
		}
	}

	@Override
	public boolean existsByUserIdAndAssetId(Map<String, Object> paramMap) {
		return sqlSessionTemplate.selectOne("Cart.existsByUserIdAndAssetId", paramMap);
	}

}
