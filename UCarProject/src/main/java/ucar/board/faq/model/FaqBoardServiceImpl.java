package ucar.board.faq.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class FaqBoardServiceImpl implements FaqBoardService {
	@Resource
	private FaqBoardDAO faqBoardDAO;
	/**
	 * 자주 묻는 질문 작성
	 */
	public void writeFaq(FaqBoardVO fvo) {
		faqBoardDAO.writeFaq(fvo);
	}
	/**
	 * 선택된 카테고리에 해당하는 글 목록 검색
	 */
	@Override
	public List<FaqBoardVO> getFaqListByCategory(String category) {

		return faqBoardDAO.getFaqListByCategory(category);
	}
	/**
	 * 글 번호로 faq찾기
	 */
	@Override
	public FaqBoardVO findFaqByNo(String no) {
		return faqBoardDAO.findFaqByNo(no);
	}
	/**
	 * faq 수정
	 */
	@Override
	public void updateFaq(FaqBoardVO fvo) {
		faqBoardDAO.updateFaq(fvo);
	}
	/**
	 * faq삭제
	 */
	@Override
	public void deleteFaq(String no) {
		faqBoardDAO.deleteFaq(no);
	}
	/**
	 * 글과 내용에 검색 단어가 포함된 글 목록을 검색 
	 */
	@Override
	public List<FaqBoardVO> searchFaqByKeyWord(String word) {
		return faqBoardDAO.searchFaqByKeyWord(word);
	}
}
