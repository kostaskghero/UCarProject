package ucar.admin.member.model;

import java.util.List;

import ucar.common.pointhistory.model.PointHistoryVO;
import ucar.member.model.MemberVO;

public interface AdminMemberDAO {
	public List<MemberVO> getAllMemberList();
	
	public List<MemberVO> findDetailMemberInfoByMemberId(String memberId);
	public MemberVO findDetailMemberInfoAndLicenseByMemberId(String memberId);
	public List<MemberVO> findDetailMemberInfoAndCardByMemberId(String memberId);
	public void adminDeleteMember(String memberId);
	public List<PointHistoryVO> getAllPointHistory(String pageNo);
	public int getTotalPointHistory();
	public  List<PointHistoryVO> getAllPointHistoryById(String memberId,String pageNo);
	public int getTotalPointHistoryById(String memberId);
}
