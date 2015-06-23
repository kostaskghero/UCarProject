package ucar.board.reviewcomment.model;

import java.util.List;

public interface ReviewCommentDAO {

	public void writeComment(ReviewCommentVO reviewCommentVO);

	public List<ReviewCommentVO> getAllCommentListByReviewNo(int reviewNo);

	public void editComment(ReviewCommentVO reviewCommentVO);

	public void deleteComment(int reviewCommentNo);

}
