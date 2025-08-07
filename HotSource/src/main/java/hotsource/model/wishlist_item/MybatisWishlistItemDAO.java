package hotsource.model.wishlist_item;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.WishlistItem;
import hotsource.exception.WishlistItemException;

@Repository
public class MybatisWishlistItemDAO implements WishlistItemDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insert(WishlistItem wishlistItem) throws WishlistItemException{
		int result = sqlSessionTemplate.insert("WishlistItem.insert", wishlistItem);
		if(result < 1) {
			throw new WishlistItemException("상품 찜하기가 실패하였습니다.");
		}
	}
	
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

	@Override
	public boolean existsByUserIdAndAssetId(Map<String, Object> paramMap) {
		return sqlSessionTemplate.selectOne("WishlistItem.existsByUserIdAndAssetId", paramMap);
	}

	@Override
	public void deleteByWishlistIdAndAssetId(Map<String, Object> paramMap) throws WishlistItemException {
		int result = sqlSessionTemplate.delete("WishlistItem.deleteByWishlistIdAndAssetId", paramMap);
	}

	@Override
	public int countByAssetId(long asset_id) {
		return sqlSessionTemplate.selectOne("WishlistItem.countByAssetId", asset_id);
	}

	@Override
	public boolean existsByWishlistIdAndAssetId(Map<String, Object> paramMap) {
		return sqlSessionTemplate.selectOne("WishlistItem.existsByWishlistIdAndAssetId", paramMap);
	}


}
