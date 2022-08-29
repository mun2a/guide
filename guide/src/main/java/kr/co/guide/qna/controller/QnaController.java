package kr.co.guide.qna.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.guide.member.domain.MemberDTO;
import kr.co.guide.member.service.IMemberService;
import kr.co.guide.qna.domain.QnaCriteria;
import kr.co.guide.qna.domain.QnaDTO;
import kr.co.guide.qna.domain.QnaPageDTO;
import kr.co.guide.qna.domain.ReplyDTO;
import kr.co.guide.qna.service.IQnaService;
import kr.co.guide.qna.service.IReplyService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IQnaService qnaService;
	
	@Autowired
	private IReplyService replyService;
	
	
	//qna 게시판 이동
	@GetMapping("/list")
	public String qnaListGet(Principal principal, QnaCriteria criteria, Model model) {
		
		log.info("==================== controller qnaList Get ====================");
		
		int total = qnaService.countQnaBoard();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(principal != null) {
			MemberDTO memberInfo = memberService.selectMemberInfo(principal.getName());
			
			model.addAttribute("memberInfo", memberInfo);
		}
		
		map.put("criteria", criteria);
		map.put("total", qnaService.countQnaBoard());
		
		List<QnaDTO> qnaList = qnaService.selectQnaList(map);
		
		model.addAttribute("qnaList", qnaList);
		
		model.addAttribute("criteria", criteria);
		
		model.addAttribute("pageMaker", new QnaPageDTO(criteria, total));
		
		return "/qna/list";
	}
	
	//qna 글 등록 페이지 이동
	@GetMapping("/add")
	public String qnaAddGet(Principal principal, QnaCriteria criteria, Model model) {
		
		log.info("==================== controller qnaAdd Get ====================");
		
		//로그인한 회원이 글등록에 접근한 경우
		if(principal != null) {
			
			MemberDTO memberInfo = memberService.selectMemberInfo(principal.getName());
			
			model.addAttribute("memberInfo", memberInfo);
			
		}
		model.addAttribute("criteria", criteria);
		
		return "/qna/add";
	}
	
	//qna 글 등록 기능
	@PostMapping("/add")
	public String qnaAddPost(QnaDTO qDto, Principal principal, QnaCriteria criteria, RedirectAttributes rttr, Model model) {
		
		log.info("==================== controller qnaAdd Post ====================");
		
		//System.out.println(qDto);
		
		//로그인한 회원이 글등록에 접근한 경우
		if(principal != null) {
					
			MemberDTO memberInfo = memberService.selectMemberInfo(principal.getName());
					
			model.addAttribute("memberInfo", memberInfo);
					
		}
		
		qnaService.insertQnaBoard(qDto);
		
		rttr.addFlashAttribute("message", "게시글이 등록되었습니다.");
		
		return "redirect:/qna/list";
	}
	
	//qna 상세글 페이지 이동
	@GetMapping("/read")
	public String qnaReadGet(QnaDTO qDto, QnaCriteria criteria, Principal principal, Model model) {
		
		log.info("==================== controller qnaRead Get ====================");
		
		System.out.println(qDto);
		
		QnaDTO qnaInfo = qnaService.selectQnaInfo(qDto.getQna_no());
		
		List<ReplyDTO> replyList = replyService.selectReplyList(qDto.getQna_no());

		if(principal != null) {
			MemberDTO memberInfo = memberService.selectMemberInfo(principal.getName());
			
			model.addAttribute("memberInfo", memberInfo);
		}
		
		model.addAttribute("qnaInfo", qnaInfo);     //qna 게시판

		model.addAttribute("replyList", replyList); //댓글 게시판
		
		model.addAttribute("criteria", criteria);
		
		return "/qna/read";
	}	
	
	//qna 글 수정 페이지 이동
	@GetMapping("/modify")
	public String qnaModifyGet(QnaDTO qDto, QnaCriteria criteria, Model model) {
			
		log.info("==================== controller qnaModify Get ====================");
		
		QnaDTO qnaInfo = qnaService.selectQnaInfo(qDto.getQna_no());
		
		model.addAttribute("qnaInfo", qnaInfo);
		
		model.addAttribute("criteria", criteria);
		
		return "/qna/modify";
	}
	
	//qna 글 수정 기능
	@PostMapping("/modify")
	public String qnaModifyPost(QnaDTO qDto, QnaCriteria criteria, RedirectAttributes rttr) {
		
		log.info("==================== controller qnaModify Post ====================");
		System.out.println(qDto);
		qnaService.updateQnaBoard(qDto);
		
		rttr.addFlashAttribute("message", "게시글이 수정되었습니다.");
		
		return "redirect:/qna/read?pageNum=" + criteria.getPageNum() + "&qna_no=" + qDto.getQna_no();
	}
	
	//qna 글 삭제 기능
	@PostMapping("/delete")
	public String qnaDeletePost(QnaDTO qDto, QnaCriteria criteria, RedirectAttributes rttr) {
		
		log.info("==================== controller qnaDelete Post ====================");
		
		qnaService.delectQnaBoard(qDto.getQna_no());
		
		rttr.addFlashAttribute("message", "게시글이 삭제되었습니다.");
		
		return "redirect:/qna/list?PageNum=" + criteria.getPageNum();
	}
	
}
