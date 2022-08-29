package kr.co.guide.travel.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.guide.travel.domain.AreaDTO;
import kr.co.guide.travel.domain.TourDTO;
import kr.co.guide.travel.mapper.AreaMapper;
import kr.co.guide.travel.service.AreaService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AreaServiceImpl implements AreaService{

   @Autowired
   private AreaMapper mapper;
   
   @Override
   public List<TourDTO> tourList(AreaDTO aDto) throws Exception {
     
	   return mapper.TourRead(aDto);
   }

   @Override
   public List<AreaDTO> selectAreaList() {
	   
	   log.info("==================== service SelectAreaList ====================");
	   
	   return mapper.selectAreaList();
   }

	@Override
	public List<AreaDTO> selectSearchAreaList(AreaDTO aDto) {

		 log.info("==================== service SelectAreaList ====================");
		 
		return mapper.selectSearchAreaList(aDto);
	}

}