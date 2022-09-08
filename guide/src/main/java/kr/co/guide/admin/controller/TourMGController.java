package kr.co.guide.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.guide.admin.domain.AreaDTO;
import kr.co.guide.admin.domain.TourCriteria;
import kr.co.guide.admin.domain.TourPageDTO;
import kr.co.guide.admin.service.ITourMGService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/tourMG")
public class TourMGController {
	
	@Autowired
	private ITourMGService service;
	
	/* ● 관광지 목록 페이지 */
	@RequestMapping(value = "/tourList", method = RequestMethod.GET)
	public void tourListAll(TourCriteria cri, Model model) throws Exception {
		log.info("show all Tour list ...........................................");
		
		//검색
		ObjectMapper objm = new ObjectMapper();
		List<AreaDTO> list = service.cateList();
		String cateList = objm.writeValueAsString(list); 
		
		
		model.addAttribute("tourMGList", service.listAllPaging(cri));
		model.addAttribute("cateList", cateList);
		
		
		int total = service.getTotalCnt(cri);
		log.info("total : " + total);
		log.info("cri ----------------" + cri.getArea_code());
		
		model.addAttribute("pageMaker", new TourPageDTO(cri, total));
	}
	
	//관광지 삭제
	@RequestMapping(value = "/tourListDel", method = RequestMethod.GET)		
	public String tourRemove(@RequestParam("tour_no") String tour_no, @ModelAttribute("cri") TourCriteria cri,
			RedirectAttributes rttr) throws Exception {
		log.info("tourListDel............................ : " + tour_no);
		
		//1개 있을 경우 이전 페이지 이동
		int total = service.getTotalCnt(cri);
		if (total%cri.getAmount() == 1) {
			cri.setPageNum(cri.getPageNum()-1); 
			if (cri.getPageNum()<1) {		
				cri.setPageNum(1);
			}
		} 
		
		service.remove(tour_no);
		return "redirect:/admin/tourMG/tourList" + cri.GetListLink();
	}
	
	/* ● 관광지 상세 페이지 */
	@RequestMapping(value = "/tourDetail", method = RequestMethod.GET)		
	public void tourDetail(@RequestParam("tour_no") String tour_no, 
			@ModelAttribute("cri") TourCriteria cri, Model model) throws Exception {
		log.info("tourDetail............................ : " + tour_no);
		
		model.addAttribute("tourDetail", service.read(tour_no));
		model.addAttribute("cri", cri);
		
	}
	
	
	
	
}
