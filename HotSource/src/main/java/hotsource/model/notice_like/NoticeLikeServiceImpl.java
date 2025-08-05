package hotsource.model.notice_like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hotsource.domain.NoticeLike;
import hotsource.exception.NoticeLikeException;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class NoticeLikeServiceImpl implements NoticeLikeService{
	
	@Autowired
	private NoticeLikeDAO noticeLikeDAO;

	@Override
	public List selectAll() {
		return noticeLikeDAO.selectAll();
	}

	@Override
	public NoticeLike select(long notice_like_id) {
		return noticeLikeDAO.select(notice_like_id);
	}

	@Override
	public List selectByNoticeId(long notice_id) {
		return noticeLikeDAO.selectByNoticeId(notice_id);
	}

	@Transactional
	public void insert(long user_id, long notice_id) throws NoticeLikeException{
		noticeLikeDAO.insert(user_id, notice_id);
	}

	@Override
	public void update(long user_id, long notice_id) {
		
	}

	@Override
	public void delete(long user_id, long notice_id) {
		noticeLikeDAO.delete(user_id, notice_id);
	}

	@Override
	public boolean isLiked(long user_id, long notice_id) {
	    return noticeLikeDAO.isLiked(user_id, notice_id);
	}

	@Override
	public NoticeLike selectByUserAndNotice(long user_id, long notice_id) {
		return noticeLikeDAO.selectByUserAndNotice(user_id, notice_id);
	}



}
