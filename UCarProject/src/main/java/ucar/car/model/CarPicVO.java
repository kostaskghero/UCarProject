package ucar.car.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CarPicVO {
	private String carModel;
	private int carPicNo;
	private MultipartFile file;
	private List<String> filePathes;
	private String filePath;
	private String originalName;
	public CarPicVO() {
		super();
	}
	public CarPicVO(String carModel, int carPicNo, MultipartFile file,
			List<String> filePathes, String filePath, String originalName) {
		super();
		this.carModel = carModel;
		this.carPicNo = carPicNo;
		this.file = file;
		this.filePathes = filePathes;
		this.filePath = filePath;
		this.originalName = originalName;
	}
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	public int getCarPicNo() {
		return carPicNo;
	}
	public void setCarPicNo(int carPicNo) {
		this.carPicNo = carPicNo;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
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
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	@Override
	public String toString() {
		return "CarPicVO [carModel=" + carModel + ", carPicNo=" + carPicNo
				+ ", file=" + file + ", filePathes=" + filePathes
				+ ", filePath=" + filePath + ", originalName=" + originalName
				+ "]";
	}
	
}
