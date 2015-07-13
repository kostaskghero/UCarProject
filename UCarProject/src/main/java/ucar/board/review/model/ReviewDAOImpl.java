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

	public void updateReview(ReviewVO vo) {
		sqlSessionTemplate.update("review.updateReview", vo);
	}

	public void deleteReview(int reviewNo) {
		sqlSessionTemplate.delete("review.deleteReview", reviewNo);
	}

	public List<ReviewVO> getReviewList(String pageNo) {
		return sqlSessionTemplate.selectList("review.getReviewList", pageNo);
	}

	public ReviewVO showContent(int reviewNo) {
		return sqlSessionTemplate.selectOne("review.showContent", reviewNo);
	}

	@Override
	public int totalContent() {
		return sqlSessionTemplate.selectOne("review.totalContent");
	}

	@Override
	public void updateCount(int reviewNo) {
		sqlSessionTemplate.update("review.updateCount", reviewNo);

	}

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

	@Override
	public int countReviewCommentByReviewNo(int reviewNo) {
		return sqlSessionTemplate.selectOne("review.countReviewCommentByReviewNo", reviewNo);
	}

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
	public List<Integer> getBestReviewNo(){
		return sqlSessionTemplate.selectList("review.getBestReviewNo");
	}

	@Override
	public ReviewVO getBestReviewByReviewNo(int reviewNo) {
		return sqlSessionTemplate.selectOne("review.getBestReviewByReviewNo", reviewNo);
	}
}
