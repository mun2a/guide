package kr.co.guide.mypage.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.guide.member.domain.MemberDTO;
import kr.co.guide.member.service.IMemberService;
import kr.co.guide.mypage.service.IMypageService;
import kr.co.guide.qna.domain.QnaDTO;
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
		
		//일정
		List<ScheduleDTO> scheduleList = null;
		List<AreaDTO> areaList = new ArrayList<AreaDTO>();
		List<Integer> countScheduleDetailList = new ArrayList<Integer>();
		
		//문의
		List<QnaDTO> qnaList = null;
		
		if(principal != null) {
			mDto = memberService.selectMemberInfo(principal.getName());
			countSchedule = mypageService.countSchedule(mDto.getMember_id());
			countQna = mypageService.countQna(mDto.getMember_id());
			
			scheduleList = mypageService.readSchedule(mDto.getMember_id());
			for (ScheduleDTO scheduleDTO : scheduleList) {
				AreaDTO aDto = mypageService.readArea(scheduleDTO.getArea_code(), scheduleDTO.getArea_detail_code());
				areaList.add(aDto);

				Integer countScheduleDetail = mypageService.countScheduleDetail(scheduleDTO.getSchedule_no());
				countScheduleDetailList.add(countScheduleDetail);
			}
			
			qnaList = mypageService.readQna(mDto.getMember_id());
			log.info("mypageInfo.........................................................qnaList : " + qnaList);
			
			
		}

		model.addAttribute("memberInfo", mDto);
		model.addAttribute("countSchedule", countSchedule);
		model.addAttribute("countQna", countQna);
		
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("areaList", areaList);
		model.addAttribute("countScheduleDetailList", countScheduleDetailList);
		
		model.addAttribute("qnaList", qnaList);
		
		
		return "/mypage/info";
	}
	
	
	//일정 여행 이름 변경 기능
	@PostMapping(value = "/modifyScheduleTitle")
	public String modifyScheduleTitle(ScheduleDTO sDto) {
		log.info("==================== modifyScheduleTitle ====================");
		
		mypageService.modifyScheduleTitle(sDto);
		
		return "redirect:/mypage/info";
	}
	
	//여행 일정 삭제
	@PostMapping(value = "/removeSchedule")
	public void removeSchedule(@RequestParam("schedule_no") int schedule_no) {
		log.info("==================== removeSchedule ====================");
		log.info("mypageInfo.........................................................schedule_no : " + schedule_no);
		
		mypageService.removeSchedule(schedule_no);
		
	}
	
	
	
	
	
}
