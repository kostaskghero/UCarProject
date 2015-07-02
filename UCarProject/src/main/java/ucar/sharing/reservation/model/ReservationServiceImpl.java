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
		} else if(reservationDAO.findReservationByMemberId(reservationVO.getMemberVO().getMemberId())!=0){
			return "fail";
		}
		return message;
	}

	@Override
	public ReservationVO findReturnInfoByReservationNo(ReservationVO reservationVO) {
		if(reservationVO.getExtensionPrice()>0){
			return reservationDAO.findExtensionInfoByReservationNo(reservationVO.getReservationNo());
		} else{
			return reservationDAO.findReturnInfoByReservationNo(reservationVO.getReservationNo());
		}		
	}

}
