package hotsource.model.wishlist_item;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.exception.WishlistItemException;

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

	@Override
	public void deleteByWishlistId(long wishlist_id) throws WishlistItemException{
		// 에셋이 없는 찜 목록이 존재할 수 있으므로 삭제된 레코드가 0인 건 오류가 아님
		sqlSessionTemplate.delete("WishlistItem.deleteByWishlistId", wishlist_id);
	}
}
