package ucar.board.notice.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ucar.common.model.PagingBean;

@Service
public class BoardServiceImpl implements BoardService {
	@Resource(name = "boardDAOImpl")
	private BoardDAO boardDAO;

	/**
	 * 공지사항을 작성하는 메서드
	 */
	@Override
	public void write(BoardVO bvo) {
		boardDAO.write(bvo);
	}

	/**
	 * 클릭한 페이지에 해당하는 공지사항 목록10개 반환
	 */
	@Override
	public ListVO getBoardList(String pageNo) {
		if (pageNo == null || pageNo == "")
			pageNo = "1";
		List<BoardVO> list = boardDAO.getBoardList(pageNo);
		int total = boardDAO.totalContent();
		PagingBean paging = new PagingBean(total, Integer.parseInt(pageNo));
		ListVO lvo = new ListVO(list, paging);
		return lvo;
	}

	/**
	 * 공지사항 상세 글보기
	 */
	@Override
	public BoardVO showContent(int qnaNo) {
		return boardDAO.showContent(qnaNo);
	}

	/**
	 * 공지사항 글 삭제하기
	 */
	@Override
	public void deleteBoard(int noticeNo) {
		System.out.println("서비스 no: " + noticeNo);
		boardDAO.deleteBoard(noticeNo);
	}

	/**
	 * 공지사항 글 수정
	 */
	@Override
	public void updateBoard(BoardVO bvo) {
		boardDAO.updateBoard(bvo);
	}

}
