package kr.co.guide.admin.mapper;

import java.util.List;

import kr.co.guide.admin.domain.MemberDTO;

public interface AdminMGMapper {
	
	/* ● 관리자 목록 페이지 */
	public List<MemberDTO> adminList() throws Exception;
	
	//관리자 권한 추가
	public int insertAdminAuth(String member_id) throws Exception;
	//관리자 권한 추가 - 이메일 확인
	public int confirmPK(String member_id) throws Exception;
	
	//관리자 권한 삭제
	public int deleteAdminAuth(String member_id) throws Exception;
	

}
