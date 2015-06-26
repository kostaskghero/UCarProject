package ucar.board.controller;

import java.util.HashMap;

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
		map.put("commentList", reviewCommentService.writeCommentSavingPoint(reviewCommentVO));
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
		map.put("flag", "ok");
		map.put("commentList", reviewCommentService.deleteComment(reviewCommentVO));
		return map;
	}
}
