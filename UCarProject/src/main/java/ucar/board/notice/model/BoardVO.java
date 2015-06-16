package ucar.board.notice.model;

public class BoardVO {
	private int noticeNo;
	private String noticeTitle;
	private String noticeMemberId;
	private String noticeContent;
	private String noticeTimePosted;

	
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}


	public String getNoticeTitle() {
		return noticeTitle;
	}


	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}


	public String getNoticeMemberId() {
		return noticeMemberId;
	}


	public void setNoticeMemberId(String noticeMemberId) {
		this.noticeMemberId = noticeMemberId;
	}


	public String getNoticeContent() {
		return noticeContent;
	}


	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}


	public String getNoticeTimePosted() {
		return noticeTimePosted;
	}


	public void setNoticeTimePosted(String noticeTimePosted) {
		this.noticeTimePosted = noticeTimePosted;
	}


	@Override
	public String toString() {
		return "BoardVO [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle
				+ ", noticeMemberId=" + noticeMemberId + ", noticeContent="
				+ noticeContent + ", noticeTimePosted=" + noticeTimePosted
				+ "]";
	}

	
}
