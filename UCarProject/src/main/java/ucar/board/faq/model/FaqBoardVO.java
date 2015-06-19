package ucar.board.faq.model;

public class FaqBoardVO {
	private int no;
	private String title;
	private String writer;
	private String category;
	private String content;

	public FaqBoardVO() {
		super();
	}

	public FaqBoardVO(int no, String title, String writer, String category,
			String content) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.category = category;
		this.content = content;
	}

	public FaqBoardVO(String title, String writer, String category,
			String content) {
		super();
		this.title = title;
		this.writer = writer;
		this.category = category;
		this.content = content;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "FnABoardVO [no=" + no + ", title=" + title + ", writer="
				+ writer + ", category=" + category + ", content=" + content
				+ "]";
	}

}
