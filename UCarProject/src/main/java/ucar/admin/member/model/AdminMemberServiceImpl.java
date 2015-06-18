package ucar.admin.member.model;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ucar.member.model.MemberDAO;
import ucar.member.model.MemberVO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	@Resource(name = "adminMemberDAOImpl")
	AdminMemberDAO adminMemberDAO;
	@Resource(name = "memberDAOImpl")
	MemberDAO memberDAO;

	public List<MemberVO> getAllMemberList() {
		return adminMemberDAO.getAllMemberList();
	}

	@Override
	public List<MemberVO> findDetailMemberInfoByMemberId(String memberId) {
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO vo = memberDAO.findMemberInfoByMemberId(memberId);
		if (memberDAO.findLicenseInfoByMemberId(memberId) != null) {
			vo.setDrivingLicenseVO(memberDAO
					.findLicenseInfoByMemberId(memberId).getDrivingLicenseVO());
		} else {
			vo.setDrivingLicenseVO(null);
		}

		if (memberDAO.findCardInfoByMemberId(memberId).size() != 0) {
			vo.setCardVO(memberDAO.findCardInfoByMemberId(memberId).get(0)
					.getCardVO());
		} else {
			vo.setCardVO(null);
		}

		if (vo.getDrivingLicenseVO() == null) {
			if (vo.getCardVO() == null) {
				// System.out.println("카드, 면허 둘다 없음");
				vo = memberDAO.findMemberInfoByMemberId(memberId);
				list.add(vo);
			} else {
				// System.out.println("카드만있음");
				list = adminMemberDAO
						.findDetailMemberInfoAndCardByMemberId(memberId);

			}
		} else {
			if (vo.getCardVO() == null) {
				// System.out.println("면허만있음");
				vo = adminMemberDAO
						.findDetailMemberInfoAndLicenseByMemberId(memberId);
				list.add(vo);
			} else {
				// System.out.println("둘다있음");
				list = adminMemberDAO.findDetailMemberInfoByMemberId(memberId);
			}
		}
		return list;
	}

	@Transactional
	@Override
	public void adminDeleteMember(String memberId) {
		memberDAO.deleteCardByMemberId(memberId);
		memberDAO.deleteLicenseByMemberId(memberId);
		adminMemberDAO.adminDeleteMember(memberId);
	}

}
