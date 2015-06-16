package ucar.board.qna.model;


public interface QnaBoardService {
	public  void write(QnaBoardVO bvo);
	public  boolean checkPass(String no, String pass);			
	public  QnaListVO getBoardList(String pageNo, String sessionId);
	public  QnaBoardVO showContent(int qnaNo);	
	public QnaBoardVO showContentNoHit(int no);
	public  void deleteBoard(String no);
	public  void updateBoard(QnaBoardVO bvo);
	public void insertRef(QnaBoardVO vo);
}