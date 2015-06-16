package ucar.board.notice.model;



public interface BoardService {
	public  void write(BoardVO bvo);
	public  boolean checkPass(String no, String pass);			
	public  ListVO getBoardList(String pageNo);
	public  BoardVO showContent(int no);	
	public BoardVO showContentNoHit(int no);
	public  void deleteBoard(int noticeNo);
	public  void updateBoard(BoardVO bvo);
	public void insertRef(BoardVO vo);
}