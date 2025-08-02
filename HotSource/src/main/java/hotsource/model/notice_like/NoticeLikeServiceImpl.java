package hotsource.model.notice_like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hotsource.domain.NoticeLike;
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



}
