package ucar.board.review.model;


public class ReviewFileVO {
	private int reviewNo;
	private int reviewFileNo;
	private String filePath;

	public ReviewFileVO() {
		super();
	}

	public ReviewFileVO(int reviewNo, int reviewFileNo, String filePath) {
		super();
		this.reviewNo = reviewNo;
		this.reviewFileNo = reviewFileNo;
		this.filePath = filePath;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getReviewFileNo() {
		return reviewFileNo;
	}

	public void setReviewFileNo(int reviewFileNo) {
		this.reviewFileNo = reviewFileNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "ReviewFileVO [reviewNo=" + reviewNo + ", reviewFileNo="
				+ reviewFileNo + ", filePath=" + filePath + "]";
	}

}
