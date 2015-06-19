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

	@RequestMapping("admin_searchSharing.do")
	@ResponseBody
	public List<ReservationVO> searchSharingByCondiction(
			ReservationVO reservationVO, CarVO carVO, MemberVO memberVO) {
		reservationVO.setCarVO(carVO);
		reservationVO.setMemberVO(memberVO);
	//	System.out.println("controlelr 테스트 : "+reservationVO);
		List<ReservationVO> list=	adminSharingService.searchSharingByCondiction(reservationVO);
		return list;
	}
}
