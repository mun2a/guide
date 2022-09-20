package kr.co.guide.mypage.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.guide.mypage.mapper.MypageMapper;
import kr.co.guide.mypage.service.IMypageService;
import kr.co.guide.travel.domain.AreaDTO;
import kr.co.guide.travel.domain.ScheduleDTO;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MypageServiceImpl implements IMypageService{
	
	@Autowired
	private MypageMapper mypageMapper;
	
	public int countSchedule(String member_id) {
		log.info("==================== countSchedule ====================");
		return mypageMapper.countSchedule(member_id);
	}

	@Override
	public int countQna(String member_id) {
		return mypageMapper.countQna(member_id);
	}

	@Override
	public List<ScheduleDTO> readSchedule(String member_id) {
		log.info("==================== readSchedule ====================");
		return mypageMapper.readSchedule(member_id);
	}

	@Override
	public AreaDTO readArea(String area_code, String area_detail_code) {
		log.info("==================== readArea ====================");
		return mypageMapper.readArea(area_code, area_detail_code);
	}

	@Override
	public int countScheduleDetail(int schedule_no) {
		return mypageMapper.countScheduleDetail(schedule_no);
	}

	@Override
	public boolean modifyScheduleTitle(ScheduleDTO sDto) {
		return mypageMapper.updateScheduleTitle(sDto);
	}
	

}
