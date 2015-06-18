package ucar.board.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ucar.board.qna.model.QnaBoardService;
import ucar.board.qna.model.QnaBoardVO;
import ucar.board.qna.model.QnaListVO;
import ucar.member.model.MemberVO;
@Controller
public class QnaController {
	@Resource(name= "qnaBoardServiceImpl")
	private QnaBoardService qnaBoardService;
	/**
	 *   상단 메뉴 고객센터 누르고 1:1 문의 누르면 
	 *   1:1문의글 쓰는 페이지로 이동
	 * @return
	 */
	@RequestMapping("auth_customercenter_home_qna.do")
	public ModelAndView serviceinfoQna(){
		return new ModelAndView("customercenter_qna_form");
	}
	
	/**
	 * 최근 게시물 5개를 보여주는 메서드
	 * @return
	 * @
	 */
	@RequestMapping("auth_customercenter_home_qna_boardList.do")
	public ModelAndView list(String pageNo, HttpServletRequest request) {	
		MemberVO mvo=null;
		HttpSession session=request.getSession(false);
		if(session.getAttribute("loginInfo")!=null){
			mvo=(MemberVO)session.getAttribute("loginInfo");
		} else if(session.getAttribute("admin")!=null){
			mvo=(MemberVO)session.getAttribute("admin");
		}		
		QnaListVO qvo = qnaBoardService.getBoardList(pageNo, mvo.getMemberId());
		return new ModelAndView("qna_qna_list_form","lvo",qvo);
	}	
	/**
	 *   1:1문의 글 등록
	 *   등록후 1:1문의 게시판으로 이동
	 * @param qvo
	 * @param qnamemberId
	 * @param request
	 * @return
	 */
	@RequestMapping(value="qna_register.do",method=RequestMethod.POST)	
	public ModelAndView QnaRegister(QnaBoardVO qvo, String qnamemberId, HttpServletRequest request) {	
		qvo.setQnaMemberId(qnamemberId);
		qnaBoardService.write(qvo);
		return new ModelAndView("redirect:customercenter_home_qna_boardList.do");
	}	
	/**
	 * 관리자가 1:1게시판의 글을 클릭하면 
	 * 해당글 상세 페이지 폼으로 이동
	 * @param qnaNo
	 * @return
	 */
	@RequestMapping("qna_showContent.do")
	public ModelAndView showContent(int qnaNo) {		
		QnaBoardVO qvo= new QnaBoardVO();
		qvo=qnaBoardService.showContent(qnaNo);
		return new ModelAndView("qna_qna_list_showcontent","qvo",qvo);
	}
	/**
	 *  상세 페이지 내에서 관리자의 경우에만 답글을 달 수있게 됨
	 *  답글 페이지로 이동
	 * @param qnaNo
	 * @return
	 */
	@RequestMapping("qna_reply_form.do")
	public ModelAndView replyView(int qnaNo) {		
		QnaBoardVO qvo= new QnaBoardVO();
		qvo=qnaBoardService.showContent(qnaNo);
	return new ModelAndView("qna_qna_reply_form", "qvo", qvo);
	}
	/**
	 *   답글하기 페이지에서 답글 버튼 클릭시 답글이 입력되고 
	 *   1:1문의 게시판 폼으로 이동
	 * @param qvo
	 * @param sessionId
	 * @return
	 */
	@RequestMapping("admin_qna_reply_register.do")
	public ModelAndView replyRegister(QnaBoardVO qvo, String sessionId) {	
		 qnaBoardService.insertRef(qvo);
		return new ModelAndView("redirect:customercenter_home_qna_boardList.do?sessionId="+sessionId);
	}
}
