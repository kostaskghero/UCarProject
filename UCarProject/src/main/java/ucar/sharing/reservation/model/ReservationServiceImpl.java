package ucar.sharing.reservation.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ucar.member.model.MemberDAO;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Resource
	private ReservationDAO reservationDAO;
	@Resource
	private MemberDAO memberDAO;

	@Transactional
	@Override
	public void reservationCar(ReservationVO reservationVO) {
		reservationDAO.reservationCar(reservationVO);
		reservationDAO.insertSharingStatus(reservationVO.getReservationNo());
	}

	@Override
	public ReservationVO findReservationInfoByReservationNo(int reservationNo) {		
		return reservationDAO.findReservationInfoByReservationNo(reservationNo);
	}

	@Override
	public Object checkMemberReservation(ReservationVO reservationVO) {
		String message="ok";
		if(memberDAO.findLicenseInfoByMemberId(reservationVO.getMemberVO().getMemberId())==null){
			return "noDrivingLisence";
		} else if(reservationDAO.findReservationByMemberIdAndDate(reservationVO)!=null){
			return reservationDAO.findReservationByMemberIdAndDate(reservationVO);
		}
		return message;
	}
	
	@Transactional
	@Override
	public void cancelReservationByReservationNo(ReservationVO reservationVO) {
		// sharingStatus 값에 따라 예약취소/예약&결제취소 달라짐
		if(reservationVO.getSharingStatus().equals("이용요금결제")){
			
		}
		reservationVO.setSharingStatus("취소");
		reservationDAO.changeSharingStatusByReservationNo(reservationVO);
	}

	@Override
	public void usingSharingService(ReservationVO reservationVO) {
		reservationVO.setSharingStatus("이용중");
		reservationDAO.changeSharingStatusByReservationNo(reservationVO);
	}
	
	@Transactional
	@Override
	public void returnSharingService(ReservationVO reservationVO) {
		reservationDAO.returnSharingService(reservationVO);
		reservationVO.setSharingStatus("반납");
		reservationDAO.changeSharingStatusByReservationNo(reservationVO);
	}

	@Override
	public ReservationVO findReturnInfoByReservationNo(int reservationNo) {
		return reservationDAO.findReturnInfoByReservationNo(reservationNo);
	}
}
