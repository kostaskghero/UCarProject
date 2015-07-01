package ucar.member.model;

import java.util.HashMap;
import java.util.List;

import ucar.common.model.PointListVO;
import ucar.common.pointhistory.model.PointHistoryVO;


public interface MemberService {

	public MemberVO loginMember(MemberVO mvo);

	public void registerMemberSavingPoint(MemberVO mvo);

	public String memberIdCheck(String memberId) throws Exception;

	public List<String> getAllLicenseLocationList();

	public int deleteMember(MemberVO memberVO);

	public void registerLicense(MemberVO memberVO) throws Exception;

	public void registerCard(MemberVO memberVO) throws Exception;

	public MemberVO updateMember(MemberVO memberVO);

	public HashMap<String,Object> updateMemberPassword(String oriMemberPassword, MemberVO memberVO);

	public MemberVO findLicenseInfoByMemberId(String memberId);

	public List<MemberVO> findCardInfoByMemberId(String memberId);

	public String countCardByMemberId(String memberId) throws Exception;

	public int findPointByMemberId(String memberId);

	public MemberVO findMemberInfoByMemberId(String memberId);

	public PointListVO getPointListByMemberId(PointHistoryVO pointHistoryVO);
	
	public MemberVO findMemberId(MemberVO vo);
	
	public MemberVO findMemberPassword(MemberVO vo);

}
