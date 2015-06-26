package ucar.member.sharing.model;

import java.util.HashMap;

import ucar.common.model.ReservationListVO;
import ucar.sharing.reservation.model.ReservationVO;

public interface MemberSharingService {
	public ReservationListVO getUsedListByMemberId(String memberId, String pageNo);

	public ReservationListVO getReservationListByMemberId(String memberId,
			String pageNo);
	
	public void cancelReservationByReservationNo(ReservationVO reservationVO);

	public void returnSharingService(ReservationVO reservationVO);

	public HashMap<String, Object> checkExtension(ReservationVO resrevationVO);

	public void extensionReservation(ReservationVO reservationVO);
}
