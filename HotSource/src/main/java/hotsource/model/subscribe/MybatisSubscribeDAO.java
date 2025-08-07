package hotsource.model.subscribe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Seller;
import hotsource.domain.Subscribe;
import hotsource.domain.User;

@Repository
public class MybatisSubscribeDAO implements SubscribeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Subscribe.selectAll");
	}

	@Override
	public List selectBySellerId(long seller_id) {
		return sqlSessionTemplate.selectList("Subscribe.selectBySellerId", seller_id);
	}

	@Override
	public List selectByUserId(long user_id) {
		return sqlSessionTemplate.selectList("Subscribe.selectByUserId", user_id);
	}

	@Override
	public int selectSubCount(long seller_id) {
		return sqlSessionTemplate.selectOne("Subscribe.selectSubCount", seller_id);
	}

	@Override
	public void subscribe(long user_id, long seller_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("seller_id", seller_id);
		Subscribe existing = sqlSessionTemplate.selectOne("Subscribe.selectByUserAndSeller", map);

		if (existing == null) {
			// 신규 구독
			User user = new User(); user.setUser_id(user_id);
			Seller seller = new Seller(); seller.setSeller_id(seller_id);
			Subscribe sub = new Subscribe();
			sub.setUser(user); sub.setSeller(seller);
			sqlSessionTemplate.insert("Subscribe.insert", sub);
		} else if (existing.getCancel_date() != null) {
			// 기존 구독을 다시 활성화
			sqlSessionTemplate.update("Subscribe.reactivate", map);
		}
	}

	@Override
	public void unsubscribe(long user_id, long seller_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("seller_id", seller_id);
		sqlSessionTemplate.update("Subscribe.cancel", map);
	}

	@Override
	public boolean isSubscribed(long user_id, long seller_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("seller_id", seller_id);
		Subscribe existing = sqlSessionTemplate.selectOne("Subscribe.selectByUserAndSeller", map);
		return existing != null && existing.getCancel_date() == null;
	}
}
