package ucar.board.review.model;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ucar.board.reviewcomment.model.ReviewCommentVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Resource
	private ReviewDAO reviewDAO;

	@Override
	public void writeReview(ReviewVO vo) {
		reviewDAO.writeReview(vo);

	}

	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);
	}

	@Override
	public void deleteReview(int reviewNo) {
		reviewDAO.deleteReview(reviewNo);
	}

	@Override
	public ListVO getReviewList(String pageNo) {
		if (pageNo == null || pageNo == "")
			pageNo = "1";
		List<ReviewVO> list = reviewDAO.getReviewList(pageNo);
		int total = reviewDAO.totalContent();
		PagingBean paging = new PagingBean(total, Integer.parseInt(pageNo));
		ListVO lvo = new ListVO(list, paging);
		System.out.println(lvo+"service test");
		return lvo;
	}

	@Override
	public ReviewVO showContent(int no) {
		reviewDAO.updateCount(no);
		return reviewDAO.showContent(no);
	}

	@Override
	public ReviewVO showContentNoHit(int no) {
		return reviewDAO.showContent(no);
	}

	@Override
	public List<ReviewCommentVO> getCommentListByReviewNo(int reviewNo) {
		return reviewDAO.getCommentListByReviewNo(reviewNo);
	}

	@Override
	public HashMap<String, String> likeReview(ReviewVO reviewVO) {
		HashMap<String, String> map=new HashMap<String, String>();
		if(reviewDAO.findReviewLikeMemberByMemberId(reviewVO)!=null){
			map.put("flag", "fail");
		} else{
			reviewDAO.insertReviewLike(reviewVO);
			map.put("flag", "ok");
			map.put("likeCount", reviewDAO.findReviewLikeCountByReviewNo(reviewVO.getReviewNo()));
		}
		return map;
	}

	@Override
	public HashMap<String, String> likeReviewCancel(ReviewVO reviewVO) {
		HashMap<String, String> map=new HashMap<String, String>();
		reviewDAO.deleteReviewLike(reviewVO);
		map.put("flag", "ok");
		map.put("likeCount", reviewDAO.findReviewLikeCountByReviewNo(reviewVO.getReviewNo()));
		return map;
	}
	@Override
	public void registerFile(ReviewFileVO rfvo) {
		reviewDAO.registerFile(rfvo);

	}

	@Override
	public List<ReviewFileVO> getFileByReviewNo(int reviewNo) {
		return reviewDAO.getFileByReviewNo(reviewNo);
	}
}
