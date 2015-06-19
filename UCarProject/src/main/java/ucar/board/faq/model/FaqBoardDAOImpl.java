package ucar.board.faq.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FaqBoardDAOImpl implements FaqBoardDAO {
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public void writeFaq(FaqBoardVO fvo){
		sqlSessionTemplate.insert("faqboard.writeFaq",fvo);
	}
	public List<FaqBoardVO> getFaqListByCategory(String category){
		return sqlSessionTemplate.selectList("faqboard.getFaqListByCategory",category);
	}
	public FaqBoardVO findFaqByNo(String no){
		return sqlSessionTemplate.selectOne("faqboard.findFaqByNo",no);
	}
	public void updateFaq(FaqBoardVO fvo){
		sqlSessionTemplate.update("faqboard.updateFaq",fvo);
	}
	public void deleteFaq(String no ){
		sqlSessionTemplate.delete("faqboard.deleteFaq",no);
	}
}
