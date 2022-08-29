package kr.co.guide.member.mapper;

import kr.co.guide.member.domain.MemberDTO;


public interface MemberMapper {
	
	public MemberDTO selectMemberInfo(String member_id);            //해당 회원의 정보 출력 

	public int insertMemberInfo(MemberDTO mDto);   					// 맴버 회원 추가 기능
	
	public int insertMemberAuthority(String member_id);   			//회원가입시 일반회원권한 등록
	
	public int insertAdminAuthority(String member_id);    			//회원가입시 관리자권한 등록
	
	public int updateMemberAccessDate(String member_id);            //회원 접속시 최근 접속날짜 최신화 기능
	
	public String selectMemberCheck(MemberDTO mDto);             //회원 정보 체크(비밀번호찾기, 회원정보 수정창 접근 직전 페이지)
	
	public String selectDuplicateCheck(MemberDTO mDto);         	//회원가입시 중복체크(아이디(이메일) / 닉네임)
	
	public int updateMemberInfo(MemberDTO mDto);            		//회원의 정보 수정

	public int updateMemberPassword(MemberDTO mDto);            		//회원의 비밀번호 수정(임시비밀번호전송)
	
	public int updateMemberDelete(MemberDTO mDto);            		//회원 탈퇴 컬럼값 변경
}
