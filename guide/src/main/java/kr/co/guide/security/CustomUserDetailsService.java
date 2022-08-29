package kr.co.guide.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.co.guide.member.domain.MemberDTO;
import kr.co.guide.member.mapper.MemberMapper;
import kr.co.guide.security.domain.CustomUser;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberMapper memberMapper;
	

	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		
		log.info("==================== CustomUserDetailsService ====================");
		log.info("입력받은 아이디 : " + member_id);
		
		
		// user_id means user_id
		MemberDTO mDto = memberMapper.selectMemberInfo(member_id);
		
		
		return mDto == null ? null : new CustomUser(mDto);
	}

	
	
}
