package ucar.board.reviewcomment.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class ReviewCommentServiceImpl implements ReviewCommentService {
	@Resource
	private ReviewCommentDAO reviewCommentDAO;
	
	/**
	 * 댓글을 등록하고 변경된 댓글 목록을 반환한다.
	 */
	@Override
	public List<ReviewCommentVO> writeComment(ReviewCommentVO reviewCommentVO) {
		reviewCommentDAO.writeComment(reviewCommentVO);
		return getAllCommentListByReviewNo(reviewCommentVO.getReviewNo());
	}
	
	/**
	 * 댓글을 수정하고 변경된 댓글 목록을 반환한다.
	 */
	@Override
	public List<ReviewCommentVO> editComment(ReviewCommentVO reviewCommentVO) {
		reviewCommentDAO.editComment(reviewCommentVO);
		return getAllCommentListByReviewNo(reviewCommentVO.getReviewNo());
	}

	/**
	 * 댓글을 삭제하고 변경된 댓글 목록을 반환한다.
	 */
	@Override
	public List<ReviewCommentVO> deleteComment(ReviewCommentVO reviewCommentVO) {
		reviewCommentDAO.deleteComment(reviewCommentVO.getReviewCommentNo());
		return getAllCommentListByReviewNo(reviewCommentVO.getReviewNo());
	}
	
	/**
	 * reviewNo 를 참조하는 댓글 목록을 반환한다.
	 */
	@Override
	public List<ReviewCommentVO> getAllCommentListByReviewNo(int reviewNo){
		return reviewCommentDAO.getAllCommentListByReviewNo(reviewNo);
	}

}
