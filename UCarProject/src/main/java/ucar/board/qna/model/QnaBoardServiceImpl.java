package ucar.board.qna.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ucar.common.model.PagingBean;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	@Resource(name = "qnaBoardDAOImpl")
	private QnaBoardDAO qnaboardDAO;
	
	/**
	 * Qna 작성하는 메서드
	 */
	@Override
	public void write(QnaBoardVO bvo) {
		qnaboardDAO.write(bvo);
	}

	/**
	 * 관리자 모드의 1:1문의 리스트 
	 */
	@Override
	public QnaListVO getBoardList(String pageNo) {
		if (pageNo == null || pageNo == "")
			pageNo = "1";
		List<QnaBoardVO> list = qnaboardDAO.getBoardList(pageNo);
		int total =qnaboardDAO.totalContent();
		PagingBean paging = new PagingBean(total, Integer.parseInt(pageNo));
		QnaListVO lvo = new QnaListVO(list, paging);
		return lvo;
	}
	/**
	 * 로그인한 회원의 아이디로 그 회원이 작성한 1:1문의 목록을 찾는다. 
	 * 검색된 목록 전체를 반복문으로 돌면서 해당 글에 답변이 되었는지 확인하는 메서드를
	 * 수행한 후에 답글이 달렸으면 checkReply를 ture로 바꿔주고 
	 * 목록과 페이징빈을 ListVO에 담아 반환한다. 
	 */
	public QnaListVO getQnaListById(String pageNo, String sessionId) {
		if (pageNo == null || pageNo == "")
			pageNo = "1";
		List<QnaBoardVO> list = qnaboardDAO.getQnaListById(sessionId, pageNo);
		int total =qnaboardDAO.totalContentByMemberId(sessionId);
	
		for(int i =0;i<list.size();i++){
			if(qnaboardDAO.getReplyByQnaNo(list.get(i).getQnaNo()).size()!=0){
				list.get(i).setCheckReply(true);
			}
		}
		PagingBean paging = new PagingBean(total, Integer.parseInt(pageNo));
		QnaListVO lvo = new QnaListVO(list, paging);
		return lvo;
	}
	
	/**
	 * 문의 내용 보기
	 */
	@Override
	public QnaBoardVO showContent(int no) {
		return qnaboardDAO.showContent(no);
	}

	/**
	 * 문의글 삭제 메서드
	 */
	@Override
	public void deleteBoard(String no) {
		qnaboardDAO.deleteBoard(no);
	}
	/**
	 * 1:1문의 수정
	 */
	@Override
	public void updateBoard(QnaBoardVO bvo) {
		qnaboardDAO.updateBoard(bvo);
	}

	/**
	 * 응답 처리 하는 메소드 <br>
	 * 응답 내용을 BoardVO로 받아 처리 한다. <br>
	 * 
	 * work flow : 1. 현재 답변 하려는 글과 같은 ref 이고 대상답변글 restep 보다 큰 답변글들의 restep의 값을
	 * +1 시킨다. 2. bvo 의 restep과 relevel의 값을 하나 증가 시킨다 (bvo의 restep, relevel의 값은
	 * 현재 답변글의 것이 아니라 원본글의 것이므로 값을 증가시킨다.) 3. database에 답변글 insert 작업을 처리한다.
	 */
	/*
	 * public void reply(BoardVO bvo) {
	 * 
	 * }
	 */
	/**
	 * 답변글의 restep과 relevel을 증가시켜주는 메서드 
	 */
	@Override
	public void insertRef(QnaBoardVO vo) {
		int ref = vo.getQnaRef();
		int restep = vo.getQnaRestep();
		int relevel = vo.getQnaRelevel();
		qnaboardDAO.updateRestep(ref, restep);
		// update 처리 후
		// 원본 글의 것보다 restep과 relevel이 1씩 커야 하므로
		// 입력 전에 restep값 과 relevel의 값을 1씩 증가하여 insert시킨다.
		vo.setQnaRestep(restep + 1);
		vo.setQnaRelevel(relevel + 1);
		qnaboardDAO.insertRef(vo);// 답변 글 입력
	}
	/**
	 * 해당글에 답변이 달렸는지 확인하는 메서드 
	 */
	public List<QnaBoardVO> getReplyByQnaNo(int no){
		return qnaboardDAO.getReplyByQnaNo(no);
	}
}
