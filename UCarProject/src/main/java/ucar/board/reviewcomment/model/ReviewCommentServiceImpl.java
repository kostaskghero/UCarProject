package ucar.board.reviewcomment.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class ReviewCommentServiceImpl implements ReviewCommentService {
	@Resource
	private ReviewCommentDAO reviewCommentDAO;

	@Override
	public List<ReviewCommentVO> writeComment(ReviewCommentVO reviewCommentVO) {
		reviewCommentDAO.writeComment(reviewCommentVO);
		return getAllCommentListByReviewNo(reviewCommentVO.getReviewNo());
	}

	@Override
	public List<ReviewCommentVO> editComment(ReviewCommentVO reviewCommentVO) {
		reviewCommentDAO.editComment(reviewCommentVO);
		return getAllCommentListByReviewNo(reviewCommentVO.getReviewNo());
	}

	@Override
	public List<ReviewCommentVO> deleteComment(ReviewCommentVO reviewCommentVO) {
		reviewCommentDAO.deleteComment(reviewCommentVO.getReviewCommentNo());
		return getAllCommentListByReviewNo(reviewCommentVO.getReviewNo());
	}
	
	@Override
	public List<ReviewCommentVO> getAllCommentListByReviewNo(int reviewNo){
		return reviewCommentDAO.getAllCommentListByReviewNo(reviewNo);
	}

}
