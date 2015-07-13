package ucar.board.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ucar.board.notice.model.BoardService;
import ucar.board.notice.model.BoardVO;

@Controller
public class NoticeController {
	@Resource(name = "boardServiceImpl")
	private BoardService boardService;

	/**
	 * 관리자가 게시글을 insert 새로고침시 재입력을 막기 위해 redirect 시킨다. post 방식일때만 등록가능
	 */
	@RequestMapping(value = "admin_notice_write.do", method = RequestMethod.POST)
	public ModelAndView write(BoardVO bvo) {
		boardService.write(bvo);
		return new ModelAndView("redirect:customercenter_home_notice.do");
	}

	/**
	 * 고객센터 누르면 가장 먼저 뜨는 페이지 최근 게시물 5개를 보여주는 메서드
	 */
	@RequestMapping("customercenter_home_notice.do")
	public ModelAndView list(String pageNo) {
		return new ModelAndView("customercenter_notice_form", "lvo",
				boardService.getBoardList(pageNo));
	}

	/**
	 * 게시글 조회, 게시글 클릭시 세부 내용을 볼 수있는 폼으로 이동
	 * 
	 * @return @
	 */
	@RequestMapping("notice_showContent.do")
	public ModelAndView showContent(int noticeNo) {
		BoardVO bvo = new BoardVO();
		bvo = boardService.showContent(noticeNo);
		return new ModelAndView("customercenter_notice_showcontent_form",
				"bvo", bvo);
	}

	/**
	 * 관리자가 게시글 삭제
	 * 
	 * @param bvo
	 * @return
	 */
	@RequestMapping("admin_notice_delete.do")
	public ModelAndView deleteBoard(BoardVO bvo) {
		boardService.deleteBoard(bvo.getNoticeNo());
		return new ModelAndView("redirect:customercenter_home_notice.do");
	}

	/**
	 * 관리자가 게시글을 업데이트
	 * 
	 * @param bvo
	 * @return
	 */
	@RequestMapping("admin_notice_update.do")
	public ModelAndView updateBoard(BoardVO bvo) {
		boardService.updateBoard(bvo);
		return new ModelAndView("redirect:notice_showContent.do?noticeNo="
				+ bvo.getNoticeNo());
	}
	/**
	 * 관리자가 공지사항을 수정하는 폼으로 이동하는 메서드 
	 * @param noticeNo
	 * @return
	 */
	@RequestMapping("admin_notice_update_form.do")
	public ModelAndView noticeUpdateForm(int noticeNo) {
		BoardVO bvo = boardService.showContent(noticeNo);
		return new ModelAndView("customercenter_notice_update_form","bvo",bvo);
	}

}
