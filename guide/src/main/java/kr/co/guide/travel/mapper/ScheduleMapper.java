package kr.co.guide.travel.mapper;

import kr.co.guide.travel.domain.ScheduleDTO;
import kr.co.guide.travel.domain.ScheduleDetailDTO;

public interface ScheduleMapper {
	public void sInsert(ScheduleDTO sDto);
	public void sdInsert(ScheduleDetailDTO sdDto);
	
	
	
}
