package kr.co.guide.travel.mapper;

import java.util.List;

import kr.co.guide.travel.domain.AreaDTO;
import kr.co.guide.travel.domain.TourDTO;

public interface AreaMapper {

	public List<TourDTO> TourRead(AreaDTO aDto);
	
	public List<AreaDTO> selectAreaList();  // 메인화면 지역 뿌리기

	public List<AreaDTO> selectSearchAreaList(AreaDTO aDto);  // 메인화면 검색 결과 뿌리기
}
