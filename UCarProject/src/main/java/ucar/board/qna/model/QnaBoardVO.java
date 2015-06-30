package ucar.board.qna.model;

public class QnaBoardVO {
	private int qnaNo;
	private String qnaCategory;
	private String qnaMemberId;
	private String qnaTitle;
	private String qnaContent;
	private String qnaTimePosted;
	private int qnaRef;   //답변글 묶음 번호(원 게시글 번호)
	private int qnaRestep; //답변글 묶음내 순서
	private int qnaRelevel; //답변의 단계
	private boolean checkReply=false;
	
	public QnaBoardVO(int qnaNo, String qnaCategory, String qnaMemberId,
			String qnaTitle, String qnaContent, String qnaTimePosted,
			int qnaRef, int qnaRestep, int qnaRelevel, boolean checkReply) {
		super();
		this.qnaNo = qnaNo;
		this.qnaCategory = qnaCategory;
		this.qnaMemberId = qnaMemberId;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaTimePosted = qnaTimePosted;
		this.qnaRef = qnaRef;
		this.qnaRestep = qnaRestep;
		this.qnaRelevel = qnaRelevel;
		this.checkReply = checkReply;
	}

	public boolean isCheckReply() {
		return checkReply;
	}

	public void setCheckReply(boolean checkReply) {
		this.checkReply = checkReply;
	}

	public QnaBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QnaBoardVO(int qnaNo, String qnaCategory, String qnaMemberId,
			String qnaTitle, String qnaContent, String qnaTimePosted) {
		super();
		this.qnaNo = qnaNo;
		this.qnaCategory = qnaCategory;
		this.qnaMemberId = qnaMemberId;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaTimePosted = qnaTimePosted;
	}

	public QnaBoardVO(int qnaNo, String qnaCategory, String qnaMemberId,
			String qnaTitle, String qnaContent, String qnaTimePosted,
			int qnaRef, int qnaRestep, int qnaRelevel) {
		super();
		this.qnaNo = qnaNo;
		this.qnaCategory = qnaCategory;
		this.qnaMemberId = qnaMemberId;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaTimePosted = qnaTimePosted;
		this.qnaRef = qnaRef;
		this.qnaRestep = qnaRestep;
		this.qnaRelevel = qnaRelevel;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaCategory() {
		return qnaCategory;
	}

	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}

	public String getQnaMemberId() {
		return qnaMemberId;
	}

	public void setQnaMemberId(String qnaMemberId) {
		this.qnaMemberId = qnaMemberId;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaTimePosted() {
		return qnaTimePosted;
	}

	public void setQnaTimePosted(String qnaTimePosted) {
		this.qnaTimePosted = qnaTimePosted;
	}

	public int getQnaRef() {
		return qnaRef;
	}

	public void setQnaRef(int qnaRef) {
		this.qnaRef = qnaRef;
	}

	public int getQnaRestep() {
		return qnaRestep;
	}

	public void setQnaRestep(int qnaRestep) {
		this.qnaRestep = qnaRestep;
	}

	public int getQnaRelevel() {
		return qnaRelevel;
	}

	public void setQnaRelevel(int qnaRelevel) {
		this.qnaRelevel = qnaRelevel;
	}

	@Override
	public String toString() {
		return "QnaBoardVO [qnaNo=" + qnaNo + ", qnaCategory=" + qnaCategory
				+ ", qnaMemberId=" + qnaMemberId + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", qnaTimePosted="
				+ qnaTimePosted + ", qnaRef=" + qnaRef + ", qnaRestep="
				+ qnaRestep + ", qnaRelevel=" + qnaRelevel + ", checkReply="
				+ checkReply + "]";
	}

	
		

	


}
