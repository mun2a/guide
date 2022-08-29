package kr.co.guide.member.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.guide.member.domain.MemberDTO;
import kr.co.guide.member.service.IEmailService;
import kr.co.guide.member.service.IMemberService;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/member")
@Log4j
public class RestMemberController {
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IEmailService emailService;
	
	// 이메일 인증 전송 기능
	@RequestMapping(value="/email/certification", method = RequestMethod.POST)
	public String emailSendPost(@RequestBody String member_id) {
		
		log.info("==================== restControlle emailSend Post ====================");
		
		//System.out.println("member_id는요 : " + member_id);
		
		String massage = emailService.sendMail(member_id);
		
		return massage;
	}
	
	//중복 체크 기능
	@PostMapping(value="/duplicateCheck")
	public String duplicateCheckPost(@RequestBody MemberDTO mDto) {
		
		log.info("==================== restControlle duplicateCheck Post ====================");
		
		//System.out.println("member_id는요 : " + mDto.getMember_id());
		//System.out.println("member_id는요 : " + mDto.getMember_nickname());
		
		String duplicateCheck = memberService.selectDuplicateCheck(mDto);
		
		return duplicateCheck;
	}
	
	
}
