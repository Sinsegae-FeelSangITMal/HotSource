package hotsource.model.wishlist_item;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisWishlistItemDAO implements WishlistItemDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("WishlistItem.selectAll");
	}

	@Override
	public List selectByWishlistId(long wishlist_id) {
		return sqlSessionTemplate.selectList("WishlistItem.selectByWishlistId", wishlist_id);
	}
}
