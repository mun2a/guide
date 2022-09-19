package kr.co.guide.travel.controller.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.guide.travel.domain.ScheduleDTO;
import kr.co.guide.travel.domain.ScheduleDetailDTO;
import kr.co.guide.travel.service.ScheduleService;

@RestController
@RequestMapping("/travel")
public class RestTravelController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestTravelController.class);
	
	@Autowired
	private ScheduleService sService;
	
	   @PostMapping(value="/addSchedule")
	   public int addSchedule(@RequestBody ScheduleDTO sDto) throws Exception {
		   
		   logger.info("addSchedule .............................. ScheduleDTO: " + sDto);
		   sService.addSchedule(sDto);
		   logger.info("addSchedule ................................. sDto.getSchedule_no(): " + sDto.getSchedule_no());
		   return sDto.getSchedule_no();
	   }
	   
	   
	   @PostMapping(value="/addScheduleDetail")
		public void addScheduleDetail(@RequestBody ScheduleDetailDTO sdDto) {
			
		    logger.info("addScheduleDetail .....................................ScheduleDetailDTO: " + sdDto);
		    sService.addScheduleDetail(sdDto);
		}
	
	
}
