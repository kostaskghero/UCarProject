package ucar.board.faq.model;

import java.util.List;

public interface FaqBoardDAO {
	public void writeFaq(FaqBoardVO fvo);
	public List<FaqBoardVO> getFaqListByCategory(String category);
	public FaqBoardVO findFaqByNo(String no);
	public void updateFaq(FaqBoardVO fvo);
	public void deleteFaq(String no );
}
