package ucar.common.model;

import java.util.List;

import ucar.common.pointhistory.model.PointHistoryVO;

public class PointListVO {
	private List<PointHistoryVO> list;
	private PagingBean pagingBean;
	public PointListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PointListVO(List<PointHistoryVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public List<PointHistoryVO> getList() {
		return list;
	}
	public void setList(List<PointHistoryVO> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "PointListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
}
