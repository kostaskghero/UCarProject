package ucar.board.faq.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class FaqBoardServiceImpl implements FaqBoardService {
	@Resource
	private FaqBoardDAO faqBoardDAO;

	public void writeFaq(FaqBoardVO fvo) {
		faqBoardDAO.writeFaq(fvo);
	}

	@Override
	public List<FaqBoardVO> getFaqListByCategory(String category) {

		return faqBoardDAO.getFaqListByCategory(category);
	}

	@Override
	public FaqBoardVO findFaqByNo(String no) {
		return faqBoardDAO.findFaqByNo(no);
	}

	@Override
	public void updateFaq(FaqBoardVO fvo) {
		faqBoardDAO.updateFaq(fvo);
	}

	@Override
	public void deleteFaq(String no) {
		faqBoardDAO.deleteFaq(no);

	}
	@Override
	public List<FaqBoardVO> searchFaqByKeyWord(String word) {
		return faqBoardDAO.searchFaqByKeyWord(word);
	}
}
