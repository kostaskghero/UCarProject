package ucar.admin.sharing.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ucar.admin.sharing.model.AdminSharingService;
import ucar.car.model.CarVO;
import ucar.member.model.MemberVO;
import ucar.sharing.reservation.model.ReservationVO;

@Controller
public class AdminSharingController {
	@Resource
	private AdminSharingService adminSharingService;

	/**
	 * 전체 예약목록을 보여주는 페이지로 이동시켜줌.
	 * 이때 검색select에 사용할 상태목록과 전체 예약목록을 map에 넣어
	 * 보내준다. 
	 * @return
	 */
	@RequestMapping("admin_sharing_List.do")
	public ModelAndView sharingList() {
		List<ReservationVO> rvo = adminSharingService.getAllReservationList();
		List<String> statusList = new ArrayList<String>();
		statusList.add("예약");
		statusList.add("이용요금결제");
		statusList.add("이용중");
		statusList.add("반납");
		statusList.add("주행요금결제");
		statusList.add("완료");
		statusList.add("취소");
		statusList.add("연장");
		statusList.add("연체");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reservationList", rvo);
		map.put("statusList", statusList);
		return new ModelAndView("admin_sharing_List", "data", map);
	}

	/**
	 * Ajax로 검색결과를 반환하는 메서드 
	 * 상태, 차량 닉네임, 멤버 아이디 조합으로 검색하여 결과를
	 * 반환한다. 
	 * 
	 * @param reservationVO
	 * @param carVO
	 * @param memberVO
	 * @return
	 */
	@RequestMapping("admin_searchSharing.do")
	@ResponseBody
	public List<ReservationVO> searchSharingByCondiction(
			ReservationVO reservationVO, CarVO carVO, MemberVO memberVO) {
		reservationVO.setCarVO(carVO);
		reservationVO.setMemberVO(memberVO);
		List<ReservationVO> list= adminSharingService.searchSharingByCondiction(reservationVO);
		return list;
	}
}
