package ucar.board.reviewcomment.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewCommentDAOImpl implements ReviewCommentDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void writeComment(ReviewCommentVO reviewCommentVO) {
		sqlSessionTemplate.insert("reviewComment.writeComment", reviewCommentVO);
	}

	@Override
	public List<ReviewCommentVO> getAllCommentListByReviewNo(int reviewNo) {
		return sqlSessionTemplate.selectList("reviewComment.getAllCommentListByReviewNo", reviewNo);
	}

	@Override
	public void editComment(ReviewCommentVO reviewCommentVO) {
		sqlSessionTemplate.update("reviewComment.editComment", reviewCommentVO);
	}

	@Override
	public void deleteComment(int reviewCommentNo) {
		sqlSessionTemplate.delete("reviewComment.deleteComment", reviewCommentNo);
	}
}
