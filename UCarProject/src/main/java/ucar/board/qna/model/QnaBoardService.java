package ucar.board.qna.model;

import java.util.List;


public interface QnaBoardService {
	public  void write(QnaBoardVO bvo);
	public  QnaListVO getBoardList(String pageNo);
	public  QnaBoardVO showContent(int qnaNo);	
	public  void deleteBoard(String no);
	public  void updateBoard(QnaBoardVO bvo);
	public void insertRef(QnaBoardVO vo);
	public List<QnaBoardVO> getReplyByQnaNo(int no);
	public QnaListVO getQnaListById(String pageNo, String sessionId);
}