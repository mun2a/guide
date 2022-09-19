package kr.co.guide.travel.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.guide.travel.domain.ScheduleDTO;
import kr.co.guide.travel.domain.ScheduleDetailDTO;
import kr.co.guide.travel.mapper.ScheduleMapper;
import kr.co.guide.travel.service.ScheduleService;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleMapper mapper;
	
	@Override
	public void addSchedule(ScheduleDTO sDto) {
		mapper.insertSchedule(sDto);
	}

	@Override
	public void addScheduleDetail(ScheduleDetailDTO sdDto) {
		mapper.insertScheduleDetail(sdDto);
	}
}
