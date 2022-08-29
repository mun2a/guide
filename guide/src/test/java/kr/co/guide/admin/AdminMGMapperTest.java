package kr.co.guide.admin;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.guide.admin.domain.MemberDTO;
import kr.co.guide.admin.mapper.AdminMGMapper;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/**/security-context.xml"})
@Log4j
public class AdminMGMapperTest {

	@Autowired
	private AdminMGMapper mapper;
	
//	@Test
//	public void testList() throws Exception{
//		List<MemberDTO> list = mapper.adminList();
//		
//		System.out.println("======================================================================");
//		System.out.println(list.get(0).getAuthList().get(0).getMember_authority());
//	}
	
//	@Test
//	public void testaddauth() throws Exception{
//		String member_id = "user3@naver.com";
//		
//		mapper.insertAdminAuth(member_id);
//		
//	}
	
	@Test
	public void testadminpk() throws Exception{
		String member_id = "user3@naver.com";
		
		mapper.confirmPK(member_id);
		
	}
	
//	@Test
//	public void testdelauth() throws Exception{
//		String member_id = "user3@naver.com";
//		
//		mapper.deleteAdminAuth(member_id);
//		
//	}
	
	
	
	
	
	
}
