package ucar.board.notice.model;



public interface BoardService {
	public  void write(BoardVO bvo);
	public  ListVO getBoardList(String pageNo);
	public  BoardVO showContent(int no);	
	public  void deleteBoard(int noticeNo);
	public  void updateBoard(BoardVO bvo);
}