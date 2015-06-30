package ucar.board.review.model;

import java.util.HashMap;
import java.util.List;

import ucar.board.reviewcomment.model.ReviewCommentVO;
import ucar.member.model.MemberVO;

public interface ReviewService {
	public void writeReviewSavingPoint(ReviewVO vo);

	public void updateReview(ReviewVO vo);

	public void deleteReview(int reviewNo);

	public ListVO getReviewList(String pageNo);

	public ReviewVO showContent(int reviewNo);

	public ReviewVO showContentNoHit(int no);

	public List<ReviewCommentVO> getCommentListByReviewNo(int reviewNo);

	public HashMap<String, String> likeReview(ReviewVO reviewVO);

	public HashMap<String, String> likeReviewCancel(ReviewVO reviewVO);

	public HashMap<String, String> fileNameFomat(MemberVO memberVO, String oriName)	throws Exception;
	
	public List<ReviewVO> getBestReview();

}
