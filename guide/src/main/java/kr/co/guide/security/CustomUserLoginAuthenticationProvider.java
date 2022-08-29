package kr.co.guide.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.co.guide.member.domain.MemberDTO;
import kr.co.guide.member.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserLoginAuthenticationProvider implements AuthenticationProvider {
	
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private CustomUserDetailsService userDetailsService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	//인증하는 로직
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		log.info("==================== CustomUserLoginAuthenticationProvider ====================");
		
		String id = authentication.getName();
		String password = (String)authentication.getCredentials();
		
		UserDetails userInfo = userDetailsService.loadUserByUsername(id); //db에서 값 가져오기
		MemberDTO mDto = memberService.selectMemberInfo(id);
		
		
		//계정이 존재하지않음 or 탈퇴한 계정
		if(userInfo == null || "Y".equals(mDto.getMember_withdraw())) { 
			throw new AuthenticationServiceException(id);
		} 
		
		//계정비번이 틀린경우
		else if( !passwordEncoder.matches(password, userInfo.getPassword())){
			System.out.println(!passwordEncoder.matches(password, userInfo.getPassword()));
			System.out.println(password);
			System.out.println("여길들어온다고?");
			throw new BadCredentialsException(id);
		}
		
		//계정이 잠금된 회원
		else if( "Y".equals(mDto.getMember_lock())){
			throw new LockedException(id);
		}
		
		// 계정이 휴면계정이 되어 비활성 된경우
		else if( "Y".equals(mDto.getMember_dormant())){
			throw new DisabledException(id);
		}
		
		
		/* 최종 리턴 시킬 새로만든 Authentication 객체 */
		Authentication newAuth = new UsernamePasswordAuthenticationToken(
				userInfo, null, userInfo.getAuthorities());
	
		return newAuth;
	}

	
	// 위의 authenticate 메소드에서 반환한 객체가 유효한 타입이 맞는지 검사
	// null 값이거나 잘못된 타입을 반환했을 경우 인증 실패로 간주
	@Override
	public boolean supports(Class<?> authentication) {
	
		// 스프링 Security가 요구하는 UsernamePasswordAuthenticationToken 타입이 맞는지 확인
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
	
}
