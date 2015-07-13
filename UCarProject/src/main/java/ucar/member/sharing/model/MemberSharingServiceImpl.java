package ucar.member.sharing.model;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ucar.common.model.ReservationListVO;
import ucar.common.model.PagingBean;
import ucar.member.model.MemberVO;
import ucar.sharing.reservation.model.ReservationVO;

@Service
public class MemberSharingServiceImpl implements MemberSharingService {
	@Resource
	private MemberSharingDAO memberSharingDAO;
	
	/**
	 * memberId 를 외래키로 갖는 예약 내역을 조회한다.
	 * 예약, 이용요금 결제 상태인 예약을 최근 대여시간 오름차순으로 정렬하여 10 개씩 제공한다.
	 * 전체 예약 내역의 수에 따라 페이징뷰를 제공한다.
	 */
	@Override
	public ReservationListVO getReservationListByMemberId(String memberId, String pageNo) {
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		ReservationVO reservationVO=new ReservationVO();
		MemberVO memberVO=new MemberVO();
		memberVO.setMemberId(memberId);
		reservationVO.setMemberVO(memberVO);
		reservationVO.setHistoryPageNo(pageNo);
		List<ReservationVO> list=memberSharingDAO.getReservationListByMemberId(reservationVO);
		int total=memberSharingDAO.totalReservationByMemberId(memberId);
		PagingBean paging=new PagingBean(total,Integer.parseInt(pageNo));
		ReservationListVO listVO=new ReservationListVO(list,paging);
		return listVO;
	}

	/**
	 * memberId 를 외래키로 갖는 이용 내역을 조회한다.
	 * 이용중, 반납, 연장, 연체, 완료 상태인 예약을 최근 대여시간 오름차순으로 정렬하여 10 개씩 제공한다.
	 * 전체 예약 내역의 수에 따라 페이징뷰를 제공한다.
	 */
	@Override
	public ReservationListVO getUsedListByMemberId(String memberId,	String pageNo) {
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		ReservationVO reservationVO=new ReservationVO();
		MemberVO memberVO=new MemberVO();
		memberVO.setMemberId(memberId);
		reservationVO.setMemberVO(memberVO);
		reservationVO.setHistoryPageNo(pageNo);
		List<ReservationVO> list=memberSharingDAO.getUsedListByMemberId(reservationVO);
		int total=memberSharingDAO.totalUsedByMemberId(memberId);
		PagingBean paging=new PagingBean(total,Integer.parseInt(pageNo));
		ReservationListVO listVO=new ReservationListVO(list,paging);
		return listVO;
	}

	/**
	 * 예약을 취소하면 reservationNo 에 해당하는 예약의 상태가 '취소' 으로 변경한다.
	 */
	@Transactional
	@Override
	public void cancelReservationByReservationNo(ReservationVO reservationVO) {
		reservationVO.setSharingStatus("취소");
		memberSharingDAO.changeSharingStatusByReservationNo(reservationVO);
	}
	
	/**
	 * 서비스를 이용하고 반납하면 반납내역을 기록하고
	 * reservationNo 에 해당하는 예약의 상태가 '반납' 으로 변경한다.
	 */
	@Transactional
	@Override
	public void returnSharingService(ReservationVO reservationVO) {
		memberSharingDAO.returnSharingService(reservationVO);
		reservationVO.setSharingStatus("반납");
		memberSharingDAO.changeSharingStatusByReservationNo(reservationVO);
	}

	/**
	 * 예약 중인 차량 번호의 예약 중 연장을 원하는 시간에 예약이 되어있는지 확인한다.
	 * 예약이 되어있다면 flag 에 fail 을 설정한다.
	 * 예약이 되어있지 않다면 flag 에 ok 를 설정하고 연장요금을 조회해서 extensionPrice 에 설정한다.
	 */
	@Override
	public HashMap<String, Object> checkExtension(ReservationVO resrevationVO) {
		HashMap<String,Object> map=new HashMap<String,Object>();
		List<String> list=memberSharingDAO.checkExtension(resrevationVO);
		if(list.size()!=0){
			map.put("flag", "fail");
		} else{
			map.put("flag", "ok");
			map.put("extensionPrice", memberSharingDAO.calculateExtensionPrice(resrevationVO));
		}
		return map;
	}
	
	/**
	 * 연장시간을 추가하고
	 * reservationNo 에 해당하는 예약의 상태가 '연장' 으로 변경한다.
	 */
	@Transactional
	@Override
	public void extensionReservation(ReservationVO reservationVO) {
		memberSharingDAO.extensionReservation(reservationVO);
		reservationVO.setSharingStatus("연장");
		memberSharingDAO.changeSharingStatusByReservationNo(reservationVO);
	}
}
