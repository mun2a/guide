package kr.co.guide.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.guide.travel.domain.AreaDTO;
import kr.co.guide.travel.domain.ScheduleDTO;

public interface MypageMapper {
	
	//일정 수
	public int countSchedule(String member_id);
	//문의 수
	public int countQna(String member_id);
	
	//일정 
	public List<ScheduleDTO> readSchedule(String member_id);
	//일정 지역
	public AreaDTO readArea(@Param("area_code") String area_code, @Param("area_detail_code") String area_detail_code);
	
	
}
