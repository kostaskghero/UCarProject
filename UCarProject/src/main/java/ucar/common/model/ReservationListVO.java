package ucar.common.model;

import java.util.List;

import ucar.sharing.reservation.model.ReservationVO;

public class ReservationListVO {
	private List<ReservationVO> list;
	private PagingBean pagingBean;
	public ReservationListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationListVO(List<ReservationVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public List<ReservationVO> getList() {
		return list;
	}
	public void setList(List<ReservationVO> list) {
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
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
}
