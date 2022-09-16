package kr.co.guide.mypage.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.guide.member.domain.MemberDTO;
import kr.co.guide.member.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage")
@Log4j
public class MypageController {

	@Autowired
	private IMemberService memberService;
	
	// 마이페이지 이동
	@RequestMapping(value="/info", method = RequestMethod.GET)
	public String infoGet(Principal principal, Model model) {
		
		log.info("==================== controller info Get ====================");
		
		MemberDTO mDto = null;
		if(principal != null) {
			mDto = memberService.selectMemberInfo(principal.getName());
		}
		
		model.addAttribute("memberInfo", mDto);
		
		return "/member/info";
	}
	
	
	
	
}
