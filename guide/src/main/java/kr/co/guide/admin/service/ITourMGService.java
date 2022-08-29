package kr.co.guide.admin.service;

import java.util.List;

import kr.co.guide.admin.domain.AreaDTO;
import kr.co.guide.admin.domain.TourCriteria;
import kr.co.guide.admin.domain.TourDTO;

public interface ITourMGService {
	
	public TourDTO read(String tour_no) throws Exception;
	
	public List<TourDTO> listAllPaging(TourCriteria cri) throws Exception;
	public int getTotalCnt(TourCriteria cri) throws Exception;
	
	public boolean remove(String tour_no) throws Exception;
	
	//카테고리 분류
	public List<AreaDTO> cateList();
	

}
