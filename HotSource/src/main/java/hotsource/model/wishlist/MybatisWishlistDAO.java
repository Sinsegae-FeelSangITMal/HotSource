package hotsource.model.wishlist;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Wishlist;
import hotsource.exception.WishlistException;

@Repository
public class MybatisWishlistDAO implements WishlistDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insert(Wishlist wishlist) throws WishlistException {
		int result = sqlSessionTemplate.insert("Wishlist.insert", wishlist);
		if (result < 1) {
			throw new WishlistException("찜 목록 생성 실패");
		}
	}

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

	@Override
	public void update(Wishlist wishlist) throws WishlistException {
		int result = sqlSessionTemplate.update("Wishlist.update", wishlist);
		if (result < 1) {
			throw new WishlistException("찜 목록 정보 수정 실패");
		}
	}

	@Override
	public void delete(long wishlist_id) throws WishlistException{
		int result = sqlSessionTemplate.delete("Wishlist.delete", wishlist_id);
		if (result < 1) {
			throw new WishlistException("찜 목록 삭제 실패");
		}
	}
}
