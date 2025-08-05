package hotsource.model.notice_comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.NoticeComment;
import hotsource.exception.NoticeCommentException;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MybatisNoticeCommentDAO implements NoticeCommentDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List selectAll() {
        return sqlSessionTemplate.selectList("NoticeComment.selectAll");
    }

    @Override
    public NoticeComment select(long notice_comment_id) {
        return sqlSessionTemplate.selectOne("NoticeComment.select", notice_comment_id);
    }

    @Override
    public List selectByNoticeId(long notice_comment_id) {
        return sqlSessionTemplate.selectList("NoticeComment.selectByNoticeId", notice_comment_id);
    }

    @Override
    public void regist(NoticeComment noticeComment) throws NoticeCommentException {
        long result = sqlSessionTemplate.insert("NoticeComment.insert", noticeComment);
        if (result < 1) {
            log.error("댓글 등록 실패");
            throw new NoticeCommentException("댓글 등록 실패");
        }
    }

    @Override
    public void update(NoticeComment noticeComment) {
        // 구현 예정
    }

    @Override
    public void delete(long notice_comment_id) throws NoticeCommentException {
        long result = sqlSessionTemplate.delete("NoticeComment.delete", notice_comment_id);
        if (result < 1) {
            log.error("댓글 삭제 실패");
            throw new NoticeCommentException("댓글 삭제 실패");
        }
    }
}
