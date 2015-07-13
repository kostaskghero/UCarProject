package ucar.board.notice.model;

import java.util.List;
import java.util.Map;

public interface BoardDAO {

	public  int write(BoardVO bvo);	

	public  List<BoardVO> getBoardList(String pageNo);

	public  BoardVO showContent(int qnaNo);

	public  void deleteBoard(int noticeNo);

	public  void updateBoard(BoardVO bvo);

	public  int totalContent();


}