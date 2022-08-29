package kr.co.guide.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserLoginFailHandler implements AuthenticationFailureHandler {
		
	
	// 로그인 실패시 작동
		@Override
		public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
				AuthenticationException exception) throws IOException, ServletException {
			
			
			log.info("==================== CustomUserLoginFailHandler ====================");
			String error = null;
			// 계정 존재 안함
			if (exception instanceof AuthenticationServiceException) {
				error = "1";
			} 
			// 비밀번호 틀림
			else if (exception instanceof BadCredentialsException) {
				error = "2";
			} 
			// 잠긴 계정
			else if(exception instanceof LockedException) {
				error = "3";
			} 
			// 휴면계정
			else if(exception instanceof DisabledException) {
				error = "4";
			} 
			 
			
			//get 방식
			String page = "/gogo.co.kr/login?error=" + error;
			response.sendRedirect(page);
				 

		}
		
		


}
