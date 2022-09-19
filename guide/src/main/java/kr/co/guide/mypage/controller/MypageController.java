package kr.co.guide.mypage.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.guide.member.domain.MemberDTO;
import kr.co.guide.member.service.IMemberService;
import kr.co.guide.mypage.service.IMypageService;
import kr.co.guide.travel.domain.AreaDTO;
import kr.co.guide.travel.domain.ScheduleDTO;
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
	public String mypageInfo(Principal principal, Model model) {
		
		log.info("==================== controller mypageInfo ====================");
		
		MemberDTO mDto = null;
		int countSchedule = 0;
		int countQna = 0;
		List<ScheduleDTO> scheduleList = null;
		List<AreaDTO> areaList = new ArrayList<AreaDTO>();
		
		if(principal != null) {
			mDto = memberService.selectMemberInfo(principal.getName());
			countSchedule = mypageService.countSchedule(mDto.getMember_id());
			countQna = mypageService.countQna(mDto.getMember_id());
			scheduleList = mypageService.readSchedule(mDto.getMember_id());
			log.info("mypageInfo.........................................................scheduleList : " + scheduleList);
			
			//List<AreaDTO> areaList = new List<AreaDTO>[scheduleList.size()];
			//AreaDTO[] areaList = new AreaDTO[scheduleList.size()];
			
			for (ScheduleDTO scheduleDTO : scheduleList) {
				AreaDTO aDto = mypageService.readArea(scheduleDTO.getArea_code(), scheduleDTO.getArea_detail_code());
				areaList.add(aDto);
			}
			log.info("mypageInfo.........................................................areaList : " + areaList);
			
		}
		

		model.addAttribute("memberInfo", mDto);
		model.addAttribute("countSchedule", countSchedule);
		model.addAttribute("countQna", countQna);
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("areaList", areaList);
		
		return "/mypage/info";
	}
	
	
	
	
}
