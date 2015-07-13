package ucar.board.reviewcomment.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewCommentDAOImpl implements ReviewCommentDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * review_comment Table 에 reviewNo 를 참조하는 댓글 정보를 삽입한다.
	 */
	@Override
	public void writeComment(ReviewCommentVO reviewCommentVO) {
		sqlSessionTemplate.insert("reviewComment.writeComment", reviewCommentVO);
	}
	
	/**
	 * review_comment Table 에 reviewNo 를 참조하는 댓글 정보를 조회한다.
	 */
	@Override
	public List<ReviewCommentVO> getAllCommentListByReviewNo(int reviewNo) {
		return sqlSessionTemplate.selectList("reviewComment.getAllCommentListByReviewNo", reviewNo);
	}

	/**
	 * review_comment Table 에 reviewNo 를 참조하는 댓글 정보를 변경한다.
	 */
	@Override
	public void editComment(ReviewCommentVO reviewCommentVO) {
		sqlSessionTemplate.update("reviewComment.editComment", reviewCommentVO);
	}

	/**
	 * review_comment Table 에 reviewNo 를 참조하는 댓글 정보를 삭제한다.
	 */
	@Override
	public void deleteComment(int reviewCommentNo) {
		sqlSessionTemplate.delete("reviewComment.deleteComment", reviewCommentNo);
	}
}
