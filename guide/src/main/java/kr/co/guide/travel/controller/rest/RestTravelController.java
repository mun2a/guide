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
	
	   @PostMapping(value="/scheduleInsert")
	   public int scheduleInsert(@RequestBody ScheduleDTO sDto) throws Exception {
		   
		   logger.info("scheduleInsert ScheduleDTO..........." + sDto);
		   sService.sInsert(sDto);
		   logger.info("scheduleInsert sDto.getMember_id();..........." + sDto.getSchedule_no());
		   return sDto.getSchedule_no();
	   }
	   
	   
	   @PostMapping(value="/sdInsert")
		public void sdInsert(@RequestBody ScheduleDetailDTO sdDto) {
			
		    logger.info("scheduleInsert sdInsert..........." + sdDto);
		    sService.sdInsert(sdDto);
		}
	
	
}
