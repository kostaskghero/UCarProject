package ucar.board.notice.model;

import java.util.List;
import java.util.Map;

public interface BoardDAO {

	public  int write(BoardVO bvo);	

	public  Integer checkPass(Map<String,String> map);

	public  List<BoardVO> getBoardList(String pageNo);

	public  BoardVO showContent(int qnaNo);

	public  void updateCount(int no);

	public  void deleteBoard(int noticeNo);

	public  void updateBoard(BoardVO bvo);

	public  int totalContent();

	public void insertRef(BoardVO vo);
	
	public void updateRestep(int ref, int restep);

}