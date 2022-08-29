package kr.co.guide.member.service;

import kr.co.guide.member.domain.MemberDTO;

public interface IEmailService {
	
	public String sendMail(String member_id);   		// 메일 보내고 retrun은 인증번호
	
	public boolean sendPasswordMail(MemberDTO mDto); 	// 회원정보가있으면 임시비밀번호 전송 ture 없으면 바로 false 반환
}
