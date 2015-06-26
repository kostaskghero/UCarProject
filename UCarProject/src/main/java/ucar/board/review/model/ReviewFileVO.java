package ucar.board.review.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewFileVO {
	private int reviewNo;
	private int reviewFileNo;
	private List<MultipartFile> file;
	private List<String> filePathes;
	private String filePath;

	public ReviewFileVO() {
		super();
	}

	public ReviewFileVO(int reviewNo, int reviewFileNo,
			List<MultipartFile> file, List<String> filePathes, String filePath) {
		super();
		this.reviewNo = reviewNo;
		this.reviewFileNo = reviewFileNo;
		this.file = file;
		this.filePathes = filePathes;
		this.filePath = filePath;
	}

	public ReviewFileVO(int reviewNo, List<MultipartFile> file,
			List<String> filePathes, String filePath) {
		super();
		this.reviewNo = reviewNo;
		this.file = file;
		this.filePathes = filePathes;
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

	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}

	public List<String> getFilePathes() {
		return filePathes;
	}

	public void setFilePathes(List<String> filePathes) {
		this.filePathes = filePathes;
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
				+ reviewFileNo + ", file=" + file + ", filePathes="
				+ filePathes + ", filePath=" + filePath + "]";
	}

}
