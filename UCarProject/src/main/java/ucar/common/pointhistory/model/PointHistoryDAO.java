package ucar.common.pointhistory.model;


public interface PointHistoryDAO {

	public void insertPointHistory(PointHistoryVO pointHistoryVO);

	public void memberPointSubtraction(PointHistoryVO pointHistoryVO);

	public void memberPointAddition(PointHistoryVO pointHistoryVO);
}
