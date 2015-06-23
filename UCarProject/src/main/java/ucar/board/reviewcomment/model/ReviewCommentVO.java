package ucar.board.reviewcomment.model;

public class ReviewCommentVO {
	private int reviewCommentNo;
	private int reviewNo;
	private String reviewCommentMemberId;
	private String reviewCommentContent;
	private String reviewCommentTimePosted;
	public ReviewCommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewCommentVO(int reviewCommentNo, int reviewNo,
			String reviewCommentMemberId, String reviewCommentContent,
			String reviewCommentTimePosted) {
		super();
		this.reviewCommentNo = reviewCommentNo;
		this.reviewNo = reviewNo;
		this.reviewCommentMemberId = reviewCommentMemberId;
		this.reviewCommentContent = reviewCommentContent;
		this.reviewCommentTimePosted = reviewCommentTimePosted;
	}
	public int getReviewCommentNo() {
		return reviewCommentNo;
	}
	public void setReviewCommentNo(int reviewCommentNo) {
		this.reviewCommentNo = reviewCommentNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewCommentMemberId() {
		return reviewCommentMemberId;
	}
	public void setReviewCommentMemberId(String reviewCommentMemberId) {
		this.reviewCommentMemberId = reviewCommentMemberId;
	}
	public String getReviewCommentContent() {
		return reviewCommentContent;
	}
	public void setReviewCommentContent(String reviewCommentContent) {
		this.reviewCommentContent = reviewCommentContent;
	}
	public String getReviewCommentTimePosted() {
		return reviewCommentTimePosted;
	}
	public void setReviewCommentTimePosted(String reviewCommentTimePosted) {
		this.reviewCommentTimePosted = reviewCommentTimePosted;
	}
	@Override
	public String toString() {
		return "ReviewCommentVO [reviewCommentNo=" + reviewCommentNo
				+ ", reviewNo=" + reviewNo + ", reviewCommentMemberId="
				+ reviewCommentMemberId + ", reviewCommentContent="
				+ reviewCommentContent + ", reviewCommentTimePosted="
				+ reviewCommentTimePosted + "]";
	}	
}
