package ucar.admin.member.model;

import java.util.List;

import ucar.common.model.PointListVO;
import ucar.common.pointhistory.model.PointHistoryVO;
import ucar.member.model.MemberVO;

public interface AdminMemberService {
	public List<MemberVO> getAllMemberList();
	public List<MemberVO> findDetailMemberInfoByMemberId(String memberId);
	public void adminDeleteMember(String memberId);
	public PointListVO getAllPointHistory(String pageNo) ;
	public PointListVO getAllPointHistoryById(String memberId,String pageNo);
	public void givePoint(MemberVO mvo) ;
}
