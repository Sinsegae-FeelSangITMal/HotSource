package hotsource.controller.notice;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hotsource.domain.Notice;
import hotsource.domain.NoticeComment;
import hotsource.domain.User;
import hotsource.model.notice.NoticeService;
import hotsource.model.notice_comment.NoticeCommentService;

@Controller
public class NoticeCommentController {

    @Autowired
    private NoticeCommentService noticeCommentService;
    
    @Autowired
    private NoticeService noticeService;

    @PostMapping("/noticeComment/insert")
    public String insert(@RequestParam("notice_id") long noticeId,
                         @RequestParam("user_id") long userId,
                         @RequestParam("content") String content,
                         HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null || user.getUser_id() != userId) {
            return "redirect:/main/user/login";  // 로그인 안 돼 있거나 위조 시도
        }

        NoticeComment comment = new NoticeComment();
        Notice notice = new Notice();
        notice.setNotice_id(noticeId);
        comment.setNotice(notice);
        comment.setUser(user);
        comment.setContent(content);

        noticeCommentService.regist(comment);

        // 해당 작가 상세 페이지로 다시 리다이렉트 (seller_id를 넘겨야 할 수도 있음)
        return "redirect:/seller/detail?seller_id=" + notice.getSeller().getSeller_id(); // 이 부분은 상황에 맞게 수정
    }
    
    @PostMapping("/main/noticeComment/insert")
    @ResponseBody
    public NoticeComment insertComment(@RequestParam("notice_id") int noticeId,
                                       @RequestParam("user_id") int userId,
                                       @RequestParam("content") String content) {
        NoticeComment comment = new NoticeComment();
        comment.setNotice_id(noticeId);
        comment.setUser_id(userId);
        comment.setContent(content);
        comment.setCreate_date(LocalDateTime.now());

        // DB 저장
        noticeCommentService.regist(comment);

        // 작성자 이름도 포함해서 리턴
        User user = noticeService.findById(userId);
        comment.setUser_name(user.getUser_name());

        return comment;
    }
}
