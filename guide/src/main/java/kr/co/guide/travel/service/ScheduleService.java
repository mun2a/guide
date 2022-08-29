package kr.co.guide.travel.service;

import kr.co.guide.travel.domain.ScheduleDTO;
import kr.co.guide.travel.domain.ScheduleDetailDTO;

public interface ScheduleService {
	public void sInsert(ScheduleDTO sDto);
	public void sdInsert(ScheduleDetailDTO sdDto);
}
