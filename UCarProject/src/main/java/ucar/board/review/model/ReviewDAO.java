package ucar.board.review.model;

import java.util.List;

import ucar.board.reviewcomment.model.ReviewCommentVO;

public interface ReviewDAO {
	public void writeReview(ReviewVO vo);
	public void updateReview(ReviewVO vo);
	public void deleteReview(int reviewNo);
	public List<ReviewVO> getReviewList(String pageNo);
	public ReviewVO showContent(int reviewNo);
	public int totalContent();
	public void updateCount(int reviewNo);
	public List<ReviewCommentVO> getCommentListByReviewNo(int reviewNo);
	public String findReviewLikeMemberByMemberId(ReviewVO reviewVO);
	public void insertReviewLike(ReviewVO reviewVO);
	public String findReviewLikeCountByReviewNo(int reviewNo);
	public void deleteReviewLike(ReviewVO reviewVO);
	public void registerFile(ReviewFileVO rfvo);
	public int countReviewCommentByReviewNo(int reviewNo);
	public int countReviewLikeByReviewNo(int reviewNo);
	public void deleteFileByReviewNo(int reviewNo);
	public List<Integer> getBestReviewNo();
}
