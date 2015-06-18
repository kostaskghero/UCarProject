package ucar.sharing.reservation.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ucar.member.model.MemberDAO;
import ucar.member.model.MemberVO;

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

	@Override
	public ReservationListVO getReservationListByMemberId(String memberId, String pageNo) {
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		ReservationVO reservationVO=new ReservationVO();
		MemberVO memberVO=new MemberVO();
		memberVO.setMemberId(memberId);
		reservationVO.setMemberVO(memberVO);
		reservationVO.setHistoryPageNo(pageNo);
		List<ReservationVO> list=reservationDAO.getReservationListByMemberId(reservationVO);
		int total=reservationDAO.totalReservationByMemberId(memberId);
		ReservationPagingBean paging=new ReservationPagingBean(total,Integer.parseInt(pageNo));
		ReservationListVO listVO=new ReservationListVO(list,paging);
		return listVO;
	}

	@Override
	public ReservationListVO getUsedListByMemberId(String memberId,	String pageNo) {
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		ReservationVO reservationVO=new ReservationVO();
		MemberVO memberVO=new MemberVO();
		memberVO.setMemberId(memberId);
		reservationVO.setMemberVO(memberVO);
		reservationVO.setHistoryPageNo(pageNo);
		List<ReservationVO> list=reservationDAO.getUsedListByMemberId(reservationVO);
		int total=reservationDAO.totalUsedByMemberId(memberId);
		ReservationPagingBean paging=new ReservationPagingBean(total,Integer.parseInt(pageNo));
		ReservationListVO listVO=new ReservationListVO(list,paging);
		return listVO;
	}

	@Override
	public void cancelReservationByReservationNo(int reservationNo) {
		reservationDAO.cancelReservationByReservationNo(reservationNo);
	}
}
