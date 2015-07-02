package ucar.board.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ucar.board.reviewcomment.model.ReviewCommentService;
import ucar.board.reviewcomment.model.ReviewCommentVO;

@Controller
public class ReviewCommentController {
	@Resource
	private ReviewCommentService reviewCommentService;
	/**
	 * 댓글작성
	 * @param reviewCommentVO
	 * @return
	 */
	@RequestMapping("auth_reviewComment_writeComment.do")
	@ResponseBody
	public HashMap<String, Object> writeComment(ReviewCommentVO reviewCommentVO){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("flag", "ok");
		map.put("commentList", reviewCommentService.writeComment(reviewCommentVO));
		return map;
	}
	/**
	 * 댓글수정
	 * @param reviewCommentVO
	 * @return
	 */
	@RequestMapping("auth_reviewComment_editComment.do")
	@ResponseBody
	public HashMap<String, Object> editComment(ReviewCommentVO reviewCommentVO){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("flag", "ok");
		map.put("commentList", reviewCommentService.editComment(reviewCommentVO));
		return map;
	}
	/**
	 * 댓글삭제
	 * @param reviewCommentVO
	 * @return
	 */
	@RequestMapping("auth_reviewComment_deleteComment.do")
	@ResponseBody
	public HashMap<String, Object> deleteComment(ReviewCommentVO reviewCommentVO){
		HashMap<String, Object> map=new HashMap<String, Object>();		
		List<ReviewCommentVO> list=reviewCommentService.deleteComment(reviewCommentVO);
		if(list.size()!=0){
			map.put("commentList", list);
			map.put("flag", "ok");
		} else{
			map.put("flag", "empty");
		}		
		return map;
	}
	@RequestMapping("reviewComment_editCommentForm.do")
	@ResponseBody
	public List<ReviewCommentVO> editCommentForm(int reviewNo){
		return reviewCommentService.getAllCommentListByReviewNo(reviewNo);
	}
}
