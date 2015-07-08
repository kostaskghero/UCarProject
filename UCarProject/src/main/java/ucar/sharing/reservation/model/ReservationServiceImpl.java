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
	
	/**
	 * sharing_reservation Table 과 sharing_status Table 에 예약 정보를 삽입한다.
	 */
	@Transactional
	@Override
	public void reservationCar(ReservationVO reservationVO) {
		reservationDAO.reservationCar(reservationVO);
		reservationDAO.insertSharingStatus(reservationVO.getReservationNo());
	}
	
	/**
	 * 예약번호에 해당하는 예약 정보를 제공한다.
	 */
	@Override
	public ReservationVO findReservationInfoByReservationNo(int reservationNo) {		
		return reservationDAO.findReservationInfoByReservationNo(reservationNo);
	}
	
	/**
	 * 회원의 정보에서 면허정보가 존재하지 않으면 noDrivingLisense 를 반환한다.
	 * 이용을 원하는 시간에 예약한 내역이 있으면 예약 정보를 reservationVO 에 담아 반환한다.
	 * 이용완료 되지 않은 내역이 있으면 fail 을 반환한다.
	 * 모두 해당하지 않으면 ok 를 반환한다.
	 */
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
	
	/**
	 * 예약번호에 해당하는 반납 정보를 제공한다.
	 * 연장요금이 존재할 경우 반납시간을 연장시간으로 설정하고 추가 정보를 제공한다.
	 */
	@Override
	public ReservationVO findReturnInfoByReservationNo(ReservationVO reservationVO) {
		if(reservationVO.getExtensionPrice()>0){
			return reservationDAO.findExtensionInfoByReservationNo(reservationVO.getReservationNo());
		} else{
			return reservationDAO.findReturnInfoByReservationNo(reservationVO.getReservationNo());
		}		
	}

}
