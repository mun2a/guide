package kr.co.guide;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.guide.travel.domain.AreaDTO;
import kr.co.guide.travel.service.AreaService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	@Autowired
	AreaService areaService;
	
	//메인화면 진입
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String mainGet(Model model) {
		
		log.info("==================== main get ====================");
		
		List<AreaDTO> areaList = areaService.selectAreaList();
		
		model.addAttribute("areaList", areaList);
		
		return "common/index_2";
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/area/serach", method = RequestMethod.POST)
	public List<AreaDTO> mainAreaSerachGet(@RequestBody AreaDTO aDto) {
		System.out.println(aDto);
		List<AreaDTO> areaSearchList = areaService.selectSearchAreaList(aDto);
		
		return areaSearchList;
	}
		
		
	//기대근 추가
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet(HttpServletRequest request, String error, Model model,HttpServletResponse response) throws IOException {

		log.info("==================== Controller login get ====================");
		
		//log.info(error);
		if ("1".equals(error)) {
			model.addAttribute("message" , "해당되는 계정이 없습니다.");
		} else if ("2".equals(error)) {
			model.addAttribute("message" , "비밀번호가 틀립니다.");
		} else if ("3".equals(error)) {
			model.addAttribute("message" , "해당 계정은 잠긴 계정입니다. 관리자에게 문의해주세요.");
		}  else if ("4".equals(error)) {
			//model.addAttribute("message" , "휴면계정입니다.");
			//response.sendRedirect("/gogo.co.kr/member/confirm"); 휴면계정인경우 이 페이지로 넘어가서 본인인증
		}
		
		// 요청 시점의 사용자 URI 정보를 Session의 Attribute에 담아서 전달(잘 지워줘야 함)
		// 로그인이 틀려서 다시 하면 요청 시점의 URI가 로그인 페이지가 되기때문에 로그인 성공시 로그인 전 페이지로 요청
		String uri = request.getHeader("Referer");
		System.out.println("uri : " + uri);
		if(uri != null) {
			if ("/login".contains(uri)) {
				request.getSession().setAttribute("prevPage", request.getHeader("Referer"));
			}
		}

		return "/common/login";
	}
	
	//기대근 추가
	//아이디 기억기능
	@PostMapping("/remeberId")
	@ResponseBody
	public void remeberIdPost(String member_id, boolean remember, HttpServletResponse response) throws UnsupportedEncodingException {
		
		log.info("==================== Controller remeberId Post ====================");
		
		if (remember) { //기억하기 눌렀을시
			Cookie cookie = new Cookie("remember_id", member_id); 

			cookie.setMaxAge(60 * 60 * 24 * 7); //일주일
			response.addCookie(cookie);
			
		} else {
			Cookie cookie = new Cookie("remember_id", "");
			cookie.setMaxAge(0); //쿠키 삭제
			response.addCookie(cookie);
		}
		
	}
	
}
