package kr.co.guide.admin.service;

import java.util.List;

import kr.co.guide.admin.domain.MemberDTO;

public interface IAdminMGService {
	
	//관리자 목록
	public List<MemberDTO> list() throws Exception;
	
	//관리자 권한 추가
	public int addAdminAuth(String member_id) throws Exception;
	//관리자 권한 추가 - 이메일 확인
	public int confirmPK(String member_id) throws Exception;
	
	//관리자 권한 삭제
	public int removeAdminAuth(String member_id) throws Exception;

}
