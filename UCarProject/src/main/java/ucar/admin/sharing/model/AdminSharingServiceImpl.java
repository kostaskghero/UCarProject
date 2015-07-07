package ucar.admin.sharing.model;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ucar.sharing.reservation.model.ReservationVO;

@Service
public class AdminSharingServiceImpl implements AdminSharingService {
	@Resource(name="adminSharingDAOImpl")
	private AdminSharingDAO adminSharingDAO;
	
	public List<ReservationVO> getAllReservationList(){
		return adminSharingDAO.getAllReservationList();
	}

	@Override
	public List<ReservationVO> searchSharingByCondiction(ReservationVO rvo) {
		String status=rvo.getSharingStatus();
		String carNickName=rvo.getCarVO().getCarNickName();
		String memberId=rvo.getMemberVO().getMemberId();
		List<ReservationVO> list = new ArrayList<ReservationVO>();
		if ((status == null || status.equals(""))
				&& (carNickName == null || carNickName.equals(""))
				&& (memberId == null || memberId.equals(""))) {
		//	System.out.println("셋다x");
			list=adminSharingDAO.getAllReservationList();
		}else if ((status != null || !status.equals(""))
				&& (carNickName == null || carNickName.equals(""))
				&& (memberId == null || memberId.equals(""))) {
		//	System.out.println("상태만");
			list=adminSharingDAO.searchSharingByStatus(rvo);
		}else if ((status == null || status.equals(""))
				&& (carNickName != null || !carNickName.equals(""))
				&& (memberId == null || memberId.equals(""))) {
		//	System.out.println("닉네임만");
			list=adminSharingDAO.searchSharingByCarNickName(rvo);
		}else if ((status == null || status.equals(""))
				&& (carNickName == null || carNickName.equals(""))
				&& (memberId != null ||! memberId.equals(""))) {
		//	System.out.println("아이디만");
			list=adminSharingDAO.searchSharingByMemberId(rvo);
		}else if ((status != null ||! status.equals(""))
				&& (carNickName != null || !carNickName.equals(""))
				&& (memberId == null || memberId.equals(""))) {
		//	System.out.println("닉네임, 상태");
			list=adminSharingDAO.searchSharingBySatausAndCarNickName(rvo);
		}else if ((status != null ||! status.equals(""))
				&& (carNickName == null || carNickName.equals(""))
				&& (memberId != null || !memberId.equals(""))) {
			//System.out.println("아이디, 상태");
			list=adminSharingDAO.searchSharingBySatausAndMemberId(rvo);
		}else if ((status != null ||! status.equals(""))
				&& (carNickName != null || !carNickName.equals(""))
				&& (memberId == null || memberId.equals(""))) {
			//System.out.println("닉네임, 상태");
			list=adminSharingDAO.searchSharingBySatausAndCarNickName(rvo);
		}else if ((status == null || status.equals(""))
				&& (carNickName != null || !carNickName.equals(""))
				&& (memberId != null ||! memberId.equals(""))) {
			//System.out.println("닉네임, 아이디");
			list=adminSharingDAO.searchSharingByCarNickNameAndMemberId(rvo);
		}
		else if ((status != null || !status.equals(""))
				&& (carNickName != null || !carNickName.equals(""))
				&& (memberId != null ||! memberId.equals(""))) {
		//	System.out.println("셋다 조건");
			list=adminSharingDAO.searchSharingByCarNickNameAndMemberIdAndStataus(rvo);
		}
		return list;
	}
}
