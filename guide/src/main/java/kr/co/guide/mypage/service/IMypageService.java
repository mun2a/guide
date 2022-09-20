package kr.co.guide.mypage.service;

import java.util.List;

import kr.co.guide.travel.domain.AreaDTO;
import kr.co.guide.travel.domain.ScheduleDTO;

public interface IMypageService {
	
	//일정 수
	public int countSchedule(String member_id);
	//문의 수
	public int countQna(String member_id);
	
	//일정 
	public List<ScheduleDTO> readSchedule(String member_id);
	//일정 지역
	public AreaDTO readArea(String area_code, String area_detail_code);
	//일정 상세 수
	public int countScheduleDetail(int schedule_no);
	//여행 이름 수정
	public boolean modifyScheduleTitle(ScheduleDTO sDto);
	
}
