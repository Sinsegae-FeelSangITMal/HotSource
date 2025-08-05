package hotsource.model.notice_like;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Notice;
import hotsource.domain.NoticeLike;
import hotsource.domain.User;
import hotsource.exception.NoticeLikeException;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MybatisNoticeLikeDAO implements NoticeLikeDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		log.debug("DAO의 selectAll() 도달");
		return sqlSessionTemplate.selectList("NoticeLike.selectAll");
	}

	@Override
	public NoticeLike select(long notice_like_id) {
		return sqlSessionTemplate.selectOne("NoticeLike.select", notice_like_id);
	}

	@Override
	public List selectByNoticeId(long notice_id) {
		return sqlSessionTemplate.selectList("NoticeLike.selectByNoticeId", notice_id);
	}

	@Override
    public void insert(long user_id, long notice_id) throws NoticeLikeException {
        Map<String, Object> map = new HashMap<>();
        map.put("user_id", user_id);
        map.put("notice_id", notice_id);

        NoticeLike existing = sqlSessionTemplate.selectOne("NoticeLike.selectByUserAndNotice", map);

        if (existing == null) {
            // 좋아요 최초 등록
            User user = new User(); user.setUser_id(user_id);
            Notice notice = new Notice(); notice.setNotice_id(notice_id);

            NoticeLike like = new NoticeLike();
            like.setUser(user);
            like.setNotice(notice);
            like.set_like(true);

            int result = sqlSessionTemplate.insert("NoticeLike.insert", like);
            if (result < 1) {
                log.error("좋아요 등록 실패");
                throw new NoticeLikeException("좋아요 등록 실패");
            }

        } else if (!existing.is_like()) {
            // is_like = false였던 걸 다시 true로 변경
            int result = sqlSessionTemplate.update("NoticeLike.reactivate", map);
            if (result < 1) {
                log.error("좋아요 재활성화 실패");
                throw new NoticeLikeException("좋아요 재활성화 실패");
            }
        }
    }

    @Override
    public void update(long user_id, long notice_id) {
    	Map<String, Object> param = new HashMap<>();
        param.put("user_id", user_id);
        param.put("notice_id", notice_id);

        sqlSessionTemplate.update("NoticeLike.toggleLike", param);
    }

    @Override
    public void delete(long user_id, long notice_id) throws NoticeLikeException {
    	Map<String, Object> param = new HashMap<>();
        param.put("user_id", user_id);
        param.put("notice_id", notice_id);

        int result = sqlSessionTemplate.delete("NoticeLike.delete", param);
        if (result < 1) {
            throw new NoticeLikeException("좋아요 삭제 실패");
        }
    }

    @Override
    public boolean isLiked(long user_id, long notice_id) {
        Map<String, Object> param = new HashMap<>();
        param.put("user_id", user_id);
        param.put("notice_id", notice_id);

        Boolean result = sqlSessionTemplate.selectOne("NoticeLike.isLiked", param);
        return result != null && result; // TRUE일 때만 좋아요 상태
    }

	@Override
	public NoticeLike selectByUserAndNotice(long user_id, long notice_id) {
	    Map<String, Object> param = new HashMap<>();
	    param.put("user_id", user_id);
	    param.put("notice_id", notice_id);

	    return sqlSessionTemplate.selectOne("NoticeLike.selectByUserAndNotice", param);
	}
}
