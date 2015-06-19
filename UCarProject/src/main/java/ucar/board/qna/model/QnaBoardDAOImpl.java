package ucar.board.qna.model;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public int write(QnaBoardVO bvo){
		return (Integer)sqlSessionTemplate.insert("qnaboard.write",bvo);
	}	
	
	
	
	@Override
	public Integer checkPass(Map<String,String> map) {		
		return sqlSessionTemplate.selectOne("qnaboard.checkPass",map);
	}	
	
	@Override
	public List<QnaBoardVO> getBoardList(String pageNo){
		return sqlSessionTemplate.selectList("qnaboard.getBoardList", pageNo);
	}
	
	@Override
	public QnaBoardVO showContent(int no){
		return (QnaBoardVO)sqlSessionTemplate.selectOne("qnaboard.showContent",no);
	}
	
	@Override
	public void updateCount(int no){
		sqlSessionTemplate.update("qnaboard.updateCount",no);
	}
	
	@Override
	public void deleteBoard(String no){
		sqlSessionTemplate.delete("qnaboard.deleteBoard", no);
	}
	
	@Override
	public void updateBoard(QnaBoardVO bvo){
		sqlSessionTemplate.update("qnaboard.updateBoard", bvo);
	}
	
	@Override
	public int totalContent(){
		return sqlSessionTemplate.selectOne("qnaboard.totalContent");
	}

	public void updateRestep(int ref, int restep){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("qnaRef", ref);
		map.put("qnaRestep", restep);
		sqlSessionTemplate.update("qnaboard.updateRestep", map);
	}

	@Override
	public void insertRef(QnaBoardVO vo) {
		sqlSessionTemplate.insert("qnaboard.insertRef", vo);
	}



	@Override
	public int totalContentByMemberId(String sessionId) {
		return sqlSessionTemplate.selectOne("qnaboard.totalContentByMemberId", sessionId);
	}
	
}














