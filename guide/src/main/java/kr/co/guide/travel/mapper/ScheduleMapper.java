package kr.co.guide.travel.mapper;

import kr.co.guide.travel.domain.ScheduleDTO;
import kr.co.guide.travel.domain.ScheduleDetailDTO;

public interface ScheduleMapper {
	
	//일정 저장
	public void insertSchedule(ScheduleDTO sDto);
	
	//일정 상세 저장
	public void insertScheduleDetail(ScheduleDetailDTO sdDto);
	
	
	
}
