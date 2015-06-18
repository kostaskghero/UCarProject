package ucar.sharing.reservation.model;

import java.util.List;

public class ReservationListVO {
	private List<ReservationVO> list;
	private ReservationPagingBean pagingBean;
	public ReservationListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationListVO(List<ReservationVO> list, ReservationPagingBean pagingBean) {
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
	public ReservationPagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(ReservationPagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
}
