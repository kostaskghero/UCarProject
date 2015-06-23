package ucar.board.review.model;

import java.util.List;

import ucar.board.reviewcomment.model.ReviewCommentVO;

public class ReviewVO {
   private int reviewNo;
   private String reviewTitle;
   private String memberId;
   private String reviewContent;
   private String reviewTimePosted;
   private int reviewHit;
   private int reviewLikeCount;
   private int reviewCommentCount;
   private List<ReviewCommentVO> ReviewCommentList;
   public ReviewVO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public ReviewVO(int reviewNo, String reviewTitle, String memberId,
         String reviewContent, String reviewTimePosted, int reviewHit,
         int reviewLikeCount, int reviewCommentCount,
         List<ReviewCommentVO> reviewCommentList) {
      super();
      this.reviewNo = reviewNo;
      this.reviewTitle = reviewTitle;
      this.memberId = memberId;
      this.reviewContent = reviewContent;
      this.reviewTimePosted = reviewTimePosted;
      this.reviewHit = reviewHit;
      this.reviewLikeCount = reviewLikeCount;
      this.reviewCommentCount = reviewCommentCount;
      ReviewCommentList = reviewCommentList;
   }
   public int getReviewNo() {
      return reviewNo;
   }
   public void setReviewNo(int reviewNo) {
      this.reviewNo = reviewNo;
   }
   public String getReviewTitle() {
      return reviewTitle;
   }
   public void setReviewTitle(String reviewTitle) {
      this.reviewTitle = reviewTitle;
   }
   public String getMemberId() {
      return memberId;
   }
   public void setMemberId(String memberId) {
      this.memberId = memberId;
   }
   public String getReviewContent() {
      return reviewContent;
   }
   public void setReviewContent(String reviewContent) {
      this.reviewContent = reviewContent;
   }
   public String getReviewTimePosted() {
      return reviewTimePosted;
   }
   public void setReviewTimePosted(String reviewTimePosted) {
      this.reviewTimePosted = reviewTimePosted;
   }
   public int getReviewHit() {
      return reviewHit;
   }
   public void setReviewHit(int reviewHit) {
      this.reviewHit = reviewHit;
   }
   public int getReviewLikeCount() {
      return reviewLikeCount;
   }
   public void setReviewLikeCount(int reviewLikeCount) {
      this.reviewLikeCount = reviewLikeCount;
   }
   public int getReviewCommentCount() {
      return reviewCommentCount;
   }
   public void setReviewCommentCount(int reviewCommentCount) {
      this.reviewCommentCount = reviewCommentCount;
   }
   public List<ReviewCommentVO> getReviewCommentList() {
      return ReviewCommentList;
   }
   public void setReviewCommentList(List<ReviewCommentVO> reviewCommentList) {
      ReviewCommentList = reviewCommentList;
   }
   @Override
   public String toString() {
      return "ReviewVO [reviewNo=" + reviewNo + ", reviewTitle="
            + reviewTitle + ", memberId=" + memberId + ", reviewContent="
            + reviewContent + ", reviewTimePosted=" + reviewTimePosted
            + ", reviewHit=" + reviewHit + ", reviewLikeCount="
            + reviewLikeCount + ", reviewCommentCount="
            + reviewCommentCount + ", ReviewCommentList="
            + ReviewCommentList + "]";
   }
public ReviewVO(String reviewTitle, String memberId, String reviewContent) {
	super();
	this.reviewTitle = reviewTitle;
	this.memberId = memberId;
	this.reviewContent = reviewContent;
}

}