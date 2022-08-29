package kr.co.guide.admin.service.Impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.guide.admin.domain.AreaDTO;
import kr.co.guide.admin.domain.TourCriteria;
import kr.co.guide.admin.domain.TourDTO;
import kr.co.guide.admin.mapper.TourMGMapper;
import kr.co.guide.admin.service.ITourMGService;

@Service
public class TourMGService implements ITourMGService{

	@Autowired
	private TourMGMapper mapper;
	
	private static final Logger log = LoggerFactory.getLogger(TourMGService.class);

	@Override
	public List<TourDTO> listAllPaging(TourCriteria cri) throws Exception {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCnt(TourCriteria cri) throws Exception {
		return mapper.getTotalCnt(cri);
	}

	@Override
	public boolean remove(String tour_no) throws Exception {
		log.info("TourMGService......remove..................");
		return mapper.delete(tour_no) == 1;
	}

	@Override
	public TourDTO read(String tour_no) throws Exception {
		return mapper.read(tour_no);
	}

	@Override
	public List<AreaDTO> cateList() {
		return mapper.cateList();
	}


}
