package kr.co.guide.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.guide.admin.domain.AreaDTO;
import kr.co.guide.admin.domain.TourCriteria;
import kr.co.guide.admin.domain.TourDTO;

public interface TourMGMapper {
	
	/* ● 여행지 목록 페이지 */
	public TourDTO read(String tour_no) throws Exception;
	
	//여행지 목록
	public List<TourDTO> getListWithPaging(TourCriteria cri) throws Exception;
	public int getTotalCnt(TourCriteria cri) throws Exception;
	
	//삭제
	public int delete(String tour_no) throws Exception;
	
	//카테고리 분류
	public List<AreaDTO> cateList();
	
}
