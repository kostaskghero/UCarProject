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
	/**
	 * 모든 예약내역을 받아온다.
	 */
	public List<ReservationVO> getAllReservationList(){
		return adminSharingDAO.getAllReservationList();
	}
	/**
	 * 예약상태, 차량닉네임, 회원아이디 3가지 조건의 8가지 조합으로
	 * 예약내역을 검색한다.
	 * 
	 */
	@Override
	public List<ReservationVO> searchSharingByCondiction(ReservationVO rvo) {
		String status=rvo.getSharingStatus();
		String carNickName=rvo.getCarVO().getCarNickName();
		String memberId=rvo.getMemberVO().getMemberId();
		List<ReservationVO> list = new ArrayList<ReservationVO>();
		if ((status == null || status.equals(""))
				&& (carNickName == null || carNickName.equals(""))
				&& (memberId == null || memberId.equals(""))) {
		//	조건없이검색
			list=adminSharingDAO.getAllReservationList();
		}else if ((status != null || !status.equals(""))
				&& (carNickName == null || carNickName.equals(""))
				&& (memberId == null || memberId.equals(""))) {
		//	상태만
			list=adminSharingDAO.searchSharingByStatus(rvo);
		}else if ((status == null || status.equals(""))
				&& (carNickName != null || !carNickName.equals(""))
				&& (memberId == null || memberId.equals(""))) {
		//	닉네임만
			list=adminSharingDAO.searchSharingByCarNickName(rvo);
		}else if ((status == null || status.equals(""))
				&& (carNickName == null || carNickName.equals(""))
				&& (memberId != null ||! memberId.equals(""))) {
		//	아이디만
			list=adminSharingDAO.searchSharingByMemberId(rvo);
		}else if ((status != null ||! status.equals(""))
				&& (carNickName == null || carNickName.equals(""))
				&& (memberId != null || !memberId.equals(""))) {
		//	아이디,상태
			list=adminSharingDAO.searchSharingBySatausAndMemberId(rvo);
		}else if ((status != null ||! status.equals(""))
				&& (carNickName != null || !carNickName.equals(""))
				&& (memberId == null || memberId.equals(""))) {
		//	닉네임,상태
			list=adminSharingDAO.searchSharingBySatausAndCarNickName(rvo);
		}else if ((status == null || status.equals(""))
				&& (carNickName != null || !carNickName.equals(""))
				&& (memberId != null ||! memberId.equals(""))) {
		//	닉네임,아이디
			list=adminSharingDAO.searchSharingByCarNickNameAndMemberId(rvo);
		}
		else if ((status != null || !status.equals(""))
				&& (carNickName != null || !carNickName.equals(""))
				&& (memberId != null ||! memberId.equals(""))) {
		//	닉네임,아이디,상태
			list=adminSharingDAO.searchSharingByCarNickNameAndMemberIdAndStataus(rvo);
		}
		return list;
	}
}
