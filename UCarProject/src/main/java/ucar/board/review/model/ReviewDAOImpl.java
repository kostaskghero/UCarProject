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

	@Override
	public String findReviewLikeMemberByMemberId(ReviewVO reviewVO) {
		return sqlSessionTemplate.selectOne("review.findReviewLikeMemberByMemberId", reviewVO);
	}

	@Override
	public void insertReviewLike(ReviewVO reviewVO) {
		sqlSessionTemplate.insert("review.insertReviewLike", reviewVO);
	}

	@Override
	public String findReviewLikeCountByReviewNo(int reviewNo) {
		return sqlSessionTemplate.selectOne("review.findReviewLikeCountByReviewNo", reviewNo);
	}

	@Override
	public void deleteReviewLike(ReviewVO reviewVO) {
		sqlSessionTemplate.delete("review.deleteReviewLike", reviewVO);
	}
	public void registerFile(ReviewFileVO rfvo){
		sqlSessionTemplate.insert("reviewFile.registerFile",rfvo);
	}
	public List<ReviewFileVO> getFileByReviewNo(int reviewNo){
		return sqlSessionTemplate.selectList("reviewFile.getFileByReviewNo",reviewNo);
	}

	@Override
	public int countReviewCommentByReviewNo(int reviewNo) {
		return sqlSessionTemplate.selectOne("review.countReviewCommentByReviewNo", reviewNo);
	}

	@Override
	public int countReviewLikeByReviewNo(int reviewNo) {
		return sqlSessionTemplate.selectOne("review.countReviewLikeByReviewNo", reviewNo);
	}
}
