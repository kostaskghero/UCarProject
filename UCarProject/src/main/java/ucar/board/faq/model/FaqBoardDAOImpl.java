package ucar.board.faq.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FaqBoardDAOImpl implements FaqBoardDAO {
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	/**
	 * 자주 묻는 질문 작성 
	 */
	public void writeFaq(FaqBoardVO fvo){
		sqlSessionTemplate.insert("faqboard.writeFaq",fvo);
	}
	/**
	 * 선택한 카테고리에 해당하는 자주 묻는 질문 목록 검색
	 */
	public List<FaqBoardVO> getFaqListByCategory(String category){
		return sqlSessionTemplate.selectList("faqboard.getFaqListByCategory",category);
	}
	/**
	 * 글 번호로 글 검색
	 */
	public FaqBoardVO findFaqByNo(String no){
		return sqlSessionTemplate.selectOne("faqboard.findFaqByNo",no);
	}
	/**
	 * 자주 묻는 질문 수정
	 */
	public void updateFaq(FaqBoardVO fvo){
		sqlSessionTemplate.update("faqboard.updateFaq",fvo);
	}
	/**
	 * 자주 묻는 질문 삭제
	 */
	public void deleteFaq(String no ){
		sqlSessionTemplate.delete("faqboard.deleteFaq",no);
	}
	/**
	 * 검색한 단어가 제목이나 내용에 포함된 자주 묻는 질문
	 * 목록을 검색
	 */
	public List<FaqBoardVO> searchFaqByKeyWord(String word){
		return sqlSessionTemplate.selectList("faqboard.searchFaqByKeyWord",word);
	}
}
