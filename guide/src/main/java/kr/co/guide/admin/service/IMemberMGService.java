package kr.co.guide.admin.service;

import java.util.List;

import kr.co.guide.admin.domain.MemberCriteria;
import kr.co.guide.admin.domain.MemberDTO;

public interface IMemberMGService {
	
	public MemberDTO read(String member_id) throws Exception;
	
	//리스트 전체 (탈퇴 x)
	public List<MemberDTO> getListWithdrawNPaging(MemberCriteria cri) throws Exception;
	public int getWithdrawNCnt(MemberCriteria cri) throws Exception;
	
	//회원 탈퇴
	public int modifyWithdraw(String member_id) throws Exception;
	
	//닉네임 중복 확인
	public String confirmNick(MemberDTO mDto) throws Exception;
	
	//회원 정보 수정
	public int modify(MemberDTO mDto) throws Exception;
	
	/* ● 탈퇴한 회원 관리 페이지 */
	public List<MemberDTO> listWithdrawPaging(MemberCriteria cri) throws Exception;
	public int getWithdrawCnt(MemberCriteria cri) throws Exception;
	
	public int modifyWithdrawCancle(String member_id) throws Exception;
	public int remove(String member_id) throws Exception;
	

}
