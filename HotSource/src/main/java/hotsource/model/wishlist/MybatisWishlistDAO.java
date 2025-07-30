package hotsource.model.wishlist;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Wishlist;

@Repository
public class MybatisWishlistDAO implements WishlistDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Wishlist.selectAll");
	}

	@Override
	public Wishlist select(long wishlist_id) {
		return sqlSessionTemplate.selectOne("Wishlist.select", wishlist_id);
	}

	@Override
	public List selectByUserId(long user_id) {
		return sqlSessionTemplate.selectList("Wishlist.selectByUserId", user_id);
	}
}
