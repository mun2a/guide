package kr.co.guide.admin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.guide.member.domain.MemberDTO;
import kr.co.guide.member.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/**/security-context.xml"})
@Log4j
public class DataTest {
	
	@Autowired
	private MemberMapper mMapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder passwordEncoder;
	
//	@Test
//	public void adminData() throws Exception{
//		
//		MemberDTO mDto = new MemberDTO();
//		
//		mDto.setMember_id("admin@naver.com");
//		mDto.setMember_password(passwordEncoder.encode("admin1234"));;
//		mDto.setMember_name("관리자");
//		mDto.setMember_nickname("관리자");
//		
//		mMapper.insertMemberInfo(mDto);                     
//		mMapper.insertAdminAuthority(mDto.getMember_id());
//		
//	}
	
	@Test
	public void memberData() throws Exception{
		
		MemberDTO mDto = new MemberDTO();
		
		for (int i = 1; i <= 100; i++) {
			mDto.setMember_id("user" + i + "@naver.com");
			mDto.setMember_password(passwordEncoder.encode("user" + i));;
			mDto.setMember_name("userName" + i);
			mDto.setMember_nickname("userNick" + i);
			
			mMapper.insertMemberInfo(mDto);                     //유저 테이블에 회원등록
			mMapper.insertMemberAuthority(mDto.getMember_id()); //유저 권한테이블에 맴버권한 등록
		}
		
		for (int i = 101; i <= 200; i++) {
			mDto.setMember_id("user" + i + "@gmail.com");
			mDto.setMember_password(passwordEncoder.encode("user" + i));;
			mDto.setMember_name("userName" + i);
			mDto.setMember_nickname("userNick" + i);
			
			mMapper.insertMemberInfo(mDto);                     //유저 테이블에 회원등록
			mMapper.insertMemberAuthority(mDto.getMember_id()); //유저 권한테이블에 맴버권한 등록
		}
		
		for (int i = 201; i <= 2050; i++) {
			mDto.setMember_id("user" + i + "@daum.net");
			mDto.setMember_password(passwordEncoder.encode("user" + i));;
			mDto.setMember_name("userName" + i);
			mDto.setMember_nickname("userNick" + i);
			
			mMapper.insertMemberInfo(mDto);                     //유저 테이블에 회원등록
			mMapper.insertMemberAuthority(mDto.getMember_id()); //유저 권한테이블에 맴버권한 등록
		}
		
	}

	
	
	
}
