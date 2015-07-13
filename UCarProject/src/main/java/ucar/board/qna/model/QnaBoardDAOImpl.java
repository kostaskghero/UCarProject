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
	
	/**
	 * 1:1문의글 작성
	 */
	@Override
	public int write(QnaBoardVO bvo){
		return (Integer)sqlSessionTemplate.insert("qnaboard.write",bvo);
	}	
	/**
	 * 선택한 페이지에 해당하는 1:1문의게시글 10개 반환
	 */
	@Override
	public List<QnaBoardVO> getBoardList(String pageNo){
		return sqlSessionTemplate.selectList("qnaboard.getBoardList", pageNo);
	}
	/**
	 * 1:1문의의 상세보기
	 */
	@Override
	public QnaBoardVO showContent(int no){
		return (QnaBoardVO)sqlSessionTemplate.selectOne("qnaboard.showContent",no);
	}

	/**
	 * 작성한 1:1문의를 삭제하는 메서드 
	 */
	@Override
	public void deleteBoard(String no){
		sqlSessionTemplate.delete("qnaboard.deleteBoard", no);
	}
	/**
	 * 1:1문의를 수정
	 */
	@Override
	public void updateBoard(QnaBoardVO bvo){
		sqlSessionTemplate.update("qnaboard.updateBoard", bvo);
	}
	/**
	 * 페이징 처리를 위해 1:1문의테이블에 존재하는 모든 글의 개수를 반환
	 */
	@Override
	public int totalContent(){
		return sqlSessionTemplate.selectOne("qnaboard.totalContent");
	}
	/**
	 * 답변글작성시 restep을 증가시키는메서드
	 */
	public void updateRestep(int ref, int restep){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("qnaRef", ref);
		map.put("qnaRestep", restep);
		sqlSessionTemplate.update("qnaboard.updateRestep", map);
	}
	/**
	 * 답변을 작성하는 메서드 
	 */
	@Override
	public void insertRef(QnaBoardVO vo) {
		sqlSessionTemplate.insert("qnaboard.insertRef", vo);
	}
	/**
	 * 페이징 처리를 위해현재 로그인한 회원이 작성한 1:1문의글의 개수를 반환
	 */
	@Override
	public int totalContentByMemberId(String sessionId) {
		return sqlSessionTemplate.selectOne("qnaboard.totalContentByMemberId", sessionId);
	}
	/**
	 * 해당 글에 달린 답변을 검색
	 */
	public List<QnaBoardVO> getReplyByQnaNo(int no){
		return sqlSessionTemplate.selectList("qnaboard.getReplyByQnaNo",no);
	}
	/**
	 * 선택한 페이지에 해당하는 현재 로그인한 회원의 1:1문의글 목록을 검색
	 */
	public List<QnaBoardVO> getQnaListById(String memberId, String pageNo){
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("pageNo", pageNo);
		return sqlSessionTemplate.selectList("qnaboard.getQnaListById",map);
	}
	
}














