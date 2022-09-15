package kr.co.guide.admin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.guide.member.domain.MemberDTO;
import kr.co.guide.member.mapper.MemberMapper;
import kr.co.guide.qna.domain.QnaDTO;
import kr.co.guide.qna.mapper.QnaMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/**/security-context.xml"})
@Log4j
public class DataTest {
	
	@Autowired
	private MemberMapper mMapper;
	
	@Autowired
	private QnaMapper qnaMapper;
	
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
//		mMapper.insertMemberAuthority(mDto.getMember_id());
//		
//	}
	
//	@Test
//	public void memberData() throws Exception{
//		
//		MemberDTO mDto = new MemberDTO();
//		
//		for (int i = 1; i <= 100; i++) {
//			mDto.setMember_id("user" + i + "@naver.com");
//			mDto.setMember_password(passwordEncoder.encode("user" + i));;
//			mDto.setMember_name("userName" + i);
//			mDto.setMember_nickname("userNick" + i);
//			
//			mMapper.insertMemberInfo(mDto);                     //유저 테이블에 회원등록
//			mMapper.insertMemberAuthority(mDto.getMember_id()); //유저 권한테이블에 맴버권한 등록
//		}
//		
//		for (int i = 101; i <= 200; i++) {
//			mDto.setMember_id("user" + i + "@gmail.com");
//			mDto.setMember_password(passwordEncoder.encode("user" + i));;
//			mDto.setMember_name("userName" + i);
//			mDto.setMember_nickname("userNick" + i);
//			
//			mMapper.insertMemberInfo(mDto);                     //유저 테이블에 회원등록
//			mMapper.insertMemberAuthority(mDto.getMember_id()); //유저 권한테이블에 맴버권한 등록
//		}
//		
//		for (int i = 201; i <= 250; i++) {
//			mDto.setMember_id("user" + i + "@daum.net");
//			mDto.setMember_password(passwordEncoder.encode("user" + i));;
//			mDto.setMember_name("userName" + i);
//			mDto.setMember_nickname("userNick" + i);
//			
//			mMapper.insertMemberInfo(mDto);                     //유저 테이블에 회원등록
//			mMapper.insertMemberAuthority(mDto.getMember_id()); //유저 권한테이블에 맴버권한 등록
//		}
//		
//	}

	
//	@Test
//	public void qnaData() throws Exception{
//		
//		QnaDTO qDto = new QnaDTO();
//		
//		for (int i = 10; i <= 20; i++) {
//			qDto.setQna_title("1");
//			qDto.setQna_content("Qna content userName" + i);
//			
//			qDto.setQna_write("user"+ i +"@naver.com");
//			qDto.setQna_write_name("userName" + i);
//			
//			qDto.setQna_secret("N");
//			//qDto.setQna_password("");
//			
//			qnaMapper.insertQnaBoard(qDto);
//		}
//		
//		for (int i = 20; i <= 30; i++) {
//			qDto.setQna_title("2");
//			qDto.setQna_content("Qna content userName" + i);
//			
//			qDto.setQna_write("user"+ i +"@naver.com");
//			qDto.setQna_write_name("userName" + i);
//			
//			qDto.setQna_secret("Y");
//			qDto.setQna_password("2345");
//			
//			qnaMapper.insertQnaBoard(qDto);
//		}
//		
//		for (int i = 30; i <= 40; i++) {
//			qDto.setQna_title("3");
//			qDto.setQna_content("Qna content userName" + i);
//			
//			qDto.setQna_write("user"+ i +"@naver.com");
//			qDto.setQna_write_name("userName" + i);
//			
//			qDto.setQna_secret("Y");
//			qDto.setQna_password("3456");
//			
//			qnaMapper.insertQnaBoard(qDto);
//		}
//		
//		for (int i = 110; i <= 120; i++) {
//			qDto.setQna_title("1");
//			qDto.setQna_content("Qna content userName" + i);
//			
//			qDto.setQna_write("user"+ i +"@gmail.com");
//			qDto.setQna_write_name("userName" + i);
//			
//			qDto.setQna_secret("Y");
//			qDto.setQna_password("1123");
//			
//			qnaMapper.insertQnaBoard(qDto);
//		}
//		
//		for (int i = 120; i <= 130; i++) {
//			qDto.setQna_title("2");
//			qDto.setQna_content("Qna content userName" + i);
//			
//			qDto.setQna_write("user"+ i +"@gmail.com");
//			qDto.setQna_write_name("userName" + i);
//			
//			qDto.setQna_secret("N");
//			//qDto.setQna_password("user"+ i);
//			
//			qnaMapper.insertQnaBoard(qDto);
//		}
//		
//		for (int i = 130; i <= 140; i++) {
//			qDto.setQna_title("3");
//			qDto.setQna_content("Qna content userName" + i);
//			
//			qDto.setQna_write("user"+ i +"@gmail.com");
//			qDto.setQna_write_name("userName" + i);
//			
//			qDto.setQna_secret("N");
//			//qDto.setQna_password("user"+ i);
//			
//			qnaMapper.insertQnaBoard(qDto);
//		}
//		
//		for (int i = 220; i <= 230; i++) {
//			qDto.setQna_title("2");
//			qDto.setQna_content("Qna content userName" + i);
//			
//			qDto.setQna_write("user"+ i +"@daum.net");
//			qDto.setQna_write_name("userName" + i);
//			
//			qDto.setQna_secret("N");
//			//qDto.setQna_password("user"+ i);
//			
//			qnaMapper.insertQnaBoard(qDto);
//		}
//		
//		for (int i = 230; i <= 240; i++) {
//			qDto.setQna_title("3");
//			qDto.setQna_content("Qna content userName" + i);
//			
//			qDto.setQna_write("user"+ i +"@daum.net");
//			qDto.setQna_write_name("userName" + i);
//			
//			qDto.setQna_secret("Y");
//			qDto.setQna_password("2345");
//			
//			qnaMapper.insertQnaBoard(qDto);
//		}
//		
//		
//	}
	
	
	
	
	
}
