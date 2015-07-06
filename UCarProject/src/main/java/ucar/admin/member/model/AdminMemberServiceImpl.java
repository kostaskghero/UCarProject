package ucar.admin.member.model;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ucar.common.model.PagingBean;
import ucar.common.model.PointListVO;
import ucar.common.pointhistory.model.PointHistoryVO;
import ucar.member.model.MemberDAO;
import ucar.member.model.MemberVO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	@Resource(name = "adminMemberDAOImpl")
	AdminMemberDAO adminMemberDAO;
	@Resource(name = "memberDAOImpl")
	MemberDAO memberDAO;
	/**
	 * 전체 회원의 목록을 반환한다. 
	 */
	@Override
	public List<MemberVO> getAllMemberList() {
		return adminMemberDAO.getAllMemberList();
	}
	
	/**
	 *  아이디로 해당 회원의 상세정보를 반환하는 메서드
	 *  해당아이디에 면허정보와 카드정보들이 등록되어있는지 확인하여
	 *  MemberVO에 넣어준뒤
	 *  면허와 카드 모두 등록한경우, 카드만 등록한 경우, 
	 *  면허만 등록한경우, 둘다 등록하지 않은 경우의 
	 *  4가지 경우의 수에 맞게 결과 리스트를 반환한다. 
	 */
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
				vo = memberDAO.findMemberInfoByMemberId(memberId);
				list.add(vo);
			} else {
				list = adminMemberDAO
						.findDetailMemberInfoAndCardByMemberId(memberId);

			}
		} else {
			if (vo.getCardVO() == null) {
				vo = adminMemberDAO
						.findDetailMemberInfoAndLicenseByMemberId(memberId);
				list.add(vo);
			} else {
				list = adminMemberDAO.findDetailMemberInfoByMemberId(memberId);
			}
		}
		return list;
	}

	/**
	 * 트랜젝션을 이용하여 회원을 탈퇴시킬때
	 * 해당아이디의 카드정보와 면허정보를 함께 지워준다. 
	 * DB에서 on Delete cascade를 명시한 해당아이디의 참조테이블들이 함께 삭제 된다. 
	 */
	@Transactional
	@Override
	public void adminDeleteMember(String memberId) {
		memberDAO.deleteCardByMemberId(memberId);
		memberDAO.deleteLicenseByMemberId(memberId);
		adminMemberDAO.adminDeleteMember(memberId);
	}
	/**
	 * 전체 포인트 내역을 반환하는 메서드 
	 * 페이징 처리를 위해 해당 
	 */
	public PointListVO getAllPointHistory(String pageNo) {
		if (pageNo == null || pageNo == "")
			pageNo = "1";
		List<PointHistoryVO> list=adminMemberDAO.getAllPointHistory(pageNo);
		int total=adminMemberDAO.getTotalPointHistory();
		PagingBean pagingBean=new PagingBean(total, Integer.parseInt(pageNo));
		PointListVO listVO=new PointListVO(list, pagingBean);
		return listVO;
	}
	public PointListVO getAllPointHistoryById(String memberId,String pageNo) {
		System.out.println(pageNo+"/"+memberId+"controlelr");
		if (pageNo == null || pageNo == "")
			pageNo = "1";
		List<PointHistoryVO> list=adminMemberDAO.getAllPointHistoryById(memberId,pageNo);
		System.out.println(list+"service test");
		int total=adminMemberDAO.getTotalPointHistoryById(memberId);
		PagingBean pagingBean=new PagingBean(total, Integer.parseInt(pageNo));
		PointListVO listVO=new PointListVO(list, pagingBean);
		return listVO;
	}
	@Override
	@Transactional
	public void givePoint(MemberVO mvo) {
	PointHistoryVO phvo=new PointHistoryVO();
	phvo.setMemberId(mvo.getMemberId());
	phvo.setPointValue(mvo.getMemberPoint());
	phvo.setPointContent("운영자지급");
	phvo.setPointType("적립");
		adminMemberDAO.givePointByAdminHistory(phvo);
		adminMemberDAO.givePointByAdminUpdate(mvo);
	}
}
