package ucar.board.review.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import ucar.board.reviewcomment.model.ReviewCommentVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * review Table 에 입력된 내용을 삽입한다.
	 */
	public void writeReview(ReviewVO vo) {
		sqlSessionTemplate.insert("review.writeReview", vo);
	}
	/**
	 * 이용후기 수정
	 */
	public void updateReview(ReviewVO vo) {
		sqlSessionTemplate.update("review.updateReview", vo);
	}
	/**
	 * 이용후기 삭제
	 */
	public void deleteReview(int reviewNo) {
		sqlSessionTemplate.delete("review.deleteReview", reviewNo);
	}
	/**
	 * 선택한 페이지에 해당하는 
	 */
	public List<ReviewVO> getReviewList(String pageNo) {
		return sqlSessionTemplate.selectList("review.getReviewList", pageNo);
	}
	/**
	 * 이용후기 상세보기 
	 */
	public ReviewVO showContent(int reviewNo) {
		return sqlSessionTemplate.selectOne("review.showContent", reviewNo);
	}
	/**
	 * 페이징 처리를 위해 전체 글 개수를 반환
	 */
	@Override
	public int totalContent() {
		return sqlSessionTemplate.selectOne("review.totalContent");
	}
	/**
	 * 조회수증가
	 */
	@Override
	public void updateCount(int reviewNo) {
		sqlSessionTemplate.update("review.updateCount", reviewNo);
	}
	/**
	 * 해당글의 댓글목록 가져오기
	 */
	@Override
	public List<ReviewCommentVO> getCommentListByReviewNo(int reviewNo) {
		return sqlSessionTemplate.selectList("review.getCommentListByReviewNo", reviewNo);
	}
	
	/**
	 * review_like Table 에서 reviewNo 를 참조하면서 
	 * review_like_member_id 와 memberId 가 일치하는 정보를 조회한다.
	 */
	@Override
	public String findReviewLikeMemberByMemberId(ReviewVO reviewVO) {
		return sqlSessionTemplate.selectOne("review.findReviewLikeMemberByMemberId", reviewVO);
	}
	
	/**
	 * review_like Table 에 reviewNo 를 외래키로 참조하는 memberId 를 삽입한다.
	 */
	@Override
	public void insertReviewLike(ReviewVO reviewVO) {
		sqlSessionTemplate.insert("review.insertReviewLike", reviewVO);
	}
	
	/**
	 * review_like Table 에서 reviewNo 를 참조하는 정보의 갯수를 조회한다.
	 */
	@Override
	public String findReviewLikeCountByReviewNo(int reviewNo) {
		return sqlSessionTemplate.selectOne("review.findReviewLikeCountByReviewNo", reviewNo);
	}
	
	/**
	 * review_like Table 에서 reviewNo 를 참조하면서
	 * review_like_member_id 와 memberId 가 일치하는 정보를 삭제한다.
	 */
	@Override
	public void deleteReviewLike(ReviewVO reviewVO) {
		sqlSessionTemplate.delete("review.deleteReviewLike", reviewVO);
	}
	
	/**
	 * review_file Table 에 reviewNo 를 외래키로 참조하는 파일 정보 삽입한다.
	 */
	@Override
	public void registerFile(ReviewFileVO rfvo){
		sqlSessionTemplate.insert("reviewFile.registerFile",rfvo);
	}
	/**
	 * 해당글에 달린 댓글의 개수를 반환
	 */
	@Override
	public int countReviewCommentByReviewNo(int reviewNo) {
		return sqlSessionTemplate.selectOne("review.countReviewCommentByReviewNo", reviewNo);
	}
	/**
	 * 해당글의 추천수를 반환
	 */
	@Override
	public int countReviewLikeByReviewNo(int reviewNo) {
		return sqlSessionTemplate.selectOne("review.countReviewLikeByReviewNo", reviewNo);
	}
	
	/**
	 * review_file Table 에서 reviewNo 를 참조하는 파일 정보를 삭제한다.
	 */
	@Override
	public void deleteFileByReviewNo(int reviewNo) {
		sqlSessionTemplate.delete("reviewFile.deleteFileByReviewNo", reviewNo);
	}
	/**
	 * 베스트 이용
	 */
	public List<Integer> getBestReviewNo(){
		return sqlSessionTemplate.selectList("review.getBestReviewNo");
	}

	@Override
	public ReviewVO getBestReviewByReviewNo(int reviewNo) {
		return sqlSessionTemplate.selectOne("review.getBestReviewByReviewNo", reviewNo);
	}
}
