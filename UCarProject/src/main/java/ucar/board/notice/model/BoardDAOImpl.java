package ucar.board.notice.model;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class BoardDAOImpl implements BoardDAO {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public int write(BoardVO bvo){
		return (Integer)sqlSessionTemplate.insert("board.write",bvo);
	}	
	
	
	
	@Override
	public Integer checkPass(Map<String,String> map) {		
		return sqlSessionTemplate.selectOne("board.checkPass",map);
	}	
	
	@Override
	public List<BoardVO> getBoardList(String pageNo){
		return sqlSessionTemplate.selectList("board.getBoardList", pageNo);
	}
	
	@Override
	public BoardVO showContent(int noticeNo){
		System.out.println("dao"+noticeNo);
		return (BoardVO)sqlSessionTemplate.selectOne("board.showContent",noticeNo);
	}
	
	@Override
	public void updateCount(int no){
		sqlSessionTemplate.update("board.updateCount",no);
	}
	
	@Override
	public void deleteBoard(int noticeNo){
		System.out.println("DAO:" +noticeNo);
		sqlSessionTemplate.delete("board.deleteBoard", noticeNo);
	}
	
	@Override
	public void updateBoard(BoardVO bvo){
		sqlSessionTemplate.update("board.updateBoard", bvo);
	}
	
	@Override
	public int totalContent(){
		return sqlSessionTemplate.selectOne("board.totalContent");
	}

	public void updateRestep(int ref, int restep){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("ref", ref);
		map.put("restep", restep);
		sqlSessionTemplate.update("board.updateRestep", map);
	}

	@Override
	public void insertRef(BoardVO vo) {
		sqlSessionTemplate.insert("board.insertRef", vo);
	}
	
}














