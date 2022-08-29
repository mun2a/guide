package kr.co.guide.qna.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.guide.qna.domain.QnaDTO;
import kr.co.guide.qna.service.IQnaService;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/qna")
public class RestQnaController {
	
	@Autowired
	IQnaService qnaService;
	
	@PostMapping("/passwordCheck")
	public boolean replyListPost(@RequestBody QnaDTO qDto) {
		
		log.info("==================== restController replyList Post ====================");
		
		System.out.println(qDto);
		QnaDTO qnaInfo = qnaService.selectQnaPasswordCheck(qDto);
		return qnaInfo != null ? true : false;
	}
}
