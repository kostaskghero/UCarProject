package ucar.admin.sharing.model;

import java.util.List;

import ucar.sharing.reservation.model.ReservationVO;

public interface AdminSharingService {
	public List<ReservationVO> getAllReservationList();
	public List<ReservationVO> searchSharingByCondiction(ReservationVO rvo);
}
