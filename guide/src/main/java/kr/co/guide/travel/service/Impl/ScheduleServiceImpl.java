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
	public void sInsert(ScheduleDTO sDto) {
		mapper.sInsert(sDto);
	}

	@Override
	public void sdInsert(ScheduleDetailDTO sdDto) {
		mapper.sdInsert(sdDto);
	}
}
