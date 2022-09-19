package kr.co.guide.travel.service;

import kr.co.guide.travel.domain.ScheduleDTO;
import kr.co.guide.travel.domain.ScheduleDetailDTO;

public interface ScheduleService {
	
	//일정 저장
	public void addSchedule(ScheduleDTO sDto);
	
	//일정 상세 저장
	public void addScheduleDetail(ScheduleDetailDTO sdDto);
	
}
