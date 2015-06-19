package ucar.board.qna.model;

import java.util.List;
import java.util.Map;


public interface QnaBoardDAO {

	public  int write(QnaBoardVO bvo);	

	public  Integer checkPass(Map<String,String> map);

	public  List<QnaBoardVO> getBoardList(String pageNo);

	public  QnaBoardVO showContent(int no);

	public  void updateCount(int no);

	public  void deleteBoard(String no);

	public  void updateBoard(QnaBoardVO bvo);

	public  int totalContent();

	public void insertRef(QnaBoardVO vo);
	
	public void updateRestep(int ref, int restep);

	public int totalContentByMemberId(String sessionId);

}