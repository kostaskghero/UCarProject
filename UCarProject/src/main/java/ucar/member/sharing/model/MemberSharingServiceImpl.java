package ucar.member.sharing.model;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ucar.common.model.ReservationListVO;
import ucar.common.model.ReservationPagingBean;
import ucar.member.model.MemberVO;
import ucar.sharing.reservation.model.ReservationVO;

@Service
public class MemberSharingServiceImpl implements MemberSharingService {
	@Resource
	private MemberSharingDAO memberSharingDAO;
	
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
		List<ReservationVO> list=memberSharingDAO.getUsedListByMemberId(reservationVO);
		int total=memberSharingDAO.totalUsedByMemberId(memberId);
		ReservationPagingBean paging=new ReservationPagingBean(total,Integer.parseInt(pageNo));
		ReservationListVO listVO=new ReservationListVO(list,paging);
		return listVO;
	}

	@Transactional
	@Override
	public void cancelReservationByReservationNo(ReservationVO reservationVO) {
		reservationVO.setSharingStatus("취소");
		memberSharingDAO.changeSharingStatusByReservationNo(reservationVO);
	}
	
	@Transactional
	@Override
	public void returnSharingService(ReservationVO reservationVO) {
		memberSharingDAO.returnSharingService(reservationVO);
		reservationVO.setSharingStatus("반납");
		memberSharingDAO.changeSharingStatusByReservationNo(reservationVO);
	}


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
	@Transactional
	@Override
	public void extensionReservation(ReservationVO reservationVO) {
		memberSharingDAO.extensionReservation(reservationVO);
		reservationVO.setSharingStatus("연장");
		memberSharingDAO.changeSharingStatusByReservationNo(reservationVO);
	}
}
