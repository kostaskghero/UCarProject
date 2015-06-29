package ucar.board.reviewcomment.model;

import java.util.List;

public interface ReviewCommentService {

	public List<ReviewCommentVO> writeComment(ReviewCommentVO reviewCommentVO);

	public List<ReviewCommentVO> editComment(ReviewCommentVO reviewCommentVO);

	public List<ReviewCommentVO> deleteComment(ReviewCommentVO reviewCommentVO);

}
