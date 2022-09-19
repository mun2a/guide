package kr.co.guide.mypage.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.guide.member.domain.MemberDTO;
import kr.co.guide.member.service.IMemberService;
import kr.co.guide.mypage.service.IMypageService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage")
@Log4j
public class MypageController {

	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IMypageService mypageService;
	
	
	// 마이페이지 이동
	@RequestMapping(value="/info")
	public String infoGet(Principal principal, Model model) {
		
		log.info("==================== controller info Get ====================");
		
		MemberDTO mDto = null;
		int countSchedule = 0;
		int countQna = 0;
		
		if(principal != null) {
			mDto = memberService.selectMemberInfo(principal.getName());
			countSchedule = mypageService.countSchedule(mDto.getMember_id());
			countQna = mypageService.countQna(mDto.getMember_id());
		}
		
		log.info("infoGet.........................................................................mDto: " + mDto.getMember_id());
		log.info("infoGet....................................................countSchedule: " + countSchedule);
		log.info("infoGet....................................................countQna: " + countQna);
		
		model.addAttribute("memberInfo", mDto);
		model.addAttribute("countSchedule", countSchedule);
		model.addAttribute("countQna", countQna);
		
		return "/member/info";
	}
	
	
	
	
}
