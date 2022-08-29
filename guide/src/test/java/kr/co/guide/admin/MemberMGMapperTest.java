package kr.co.guide.admin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import kr.co.guide.DataSourceTest;
import kr.co.guide.admin.domain.TourCriteria;
import kr.co.guide.admin.domain.Criteria;
import kr.co.guide.admin.domain.MemberAuthDTO;
import kr.co.guide.admin.domain.MemberDTO;
import kr.co.guide.admin.mapper.MemberMGMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/**/security-context.xml"})
@Log4j
public class MemberMGMapperTest {
	
	@Autowired
	private MemberMGMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder passwordEncoder;
	
//	@Test
//	public void testRead() throws Exception{
//		String member_id = "user3@naver.com";
//		MemberDTO mDto = new MemberDTO();
//		mDto = mapper.read(member_id);
//		
//		System.out.println("======================================================================");
//		System.out.println(mDto.getAuthList());
//	}
	
//	@Test
//	public void testUpdate() throws Exception{
//		MemberDTO mDto = new MemberDTO();
//		
//		mDto.setMember_id("111");
//		mDto.setMember_password(passwordEncoder.encode("111"));
//		mDto.setMember_nickname("111");
//		
//		mapper.update(mDto);
//		
//	}
	
//	@Test
//	public void testInsertAuth() throws Exception{
//		String member_id = "user3@naver.com";
//		mapper.insertAuth(member_id);
//	}
	
//	@Test
//	public void testdeleteAuth() throws Exception{
//		String member_id = "user3@naver.com";
//		mapper.deleteAuth(member_id);
//	}
	
//	@Test
//	public void testList() throws Exception{
//		
//		Criteria cri = new Criteria();
//		
//		cri.setPageNum(1);
//		cri.setAmount(20);
//		
//		mapper.getListWithPaging(cri);
//	}
	
//	@Test
//	public void testTotal() throws Exception{
//		
//		Criteria cri = new Criteria();
//		
//		mapper.getTotalCnt(cri);
//	}
	
//	@Test
//	public void testlist() throws Exception{
//		mapper.getListWithdrawN();
//	}
	
//	@Test
//	public void testlist() throws Exception{
//		String member_id = "user11@naver.com";
//		
//		mapper.updateWithdrawY(member_id);
//	}
	
//	@Test
//	public void testlist() throws Exception{
//		mapper.getListWithdrawY();
//	}
	
//	@Test
//	public void testlist() throws Exception{
//		String member_id = "user11@naver.com";
//		
//		mapper.updateWithdrawN(member_id);
//	}
	
//	@Test
//	public void testlist() throws Exception{
//		String member_id = "user22@naver.com";
//		
//		mapper.delete(member_id);
//	}
	
	
//	@Test
//	public void testGetListWithdrawNPaging() throws Exception {
//		Criteria cri = new Criteria();
//		
//		 mapper.getListWithdrawNPaging(cri);
//		
//	}
	
//	@Test
//	public void testTotalCnt() throws Exception {
//		
//		Criteria cri = new Criteria();
//		
//		System.out.println(mapper.getTotalCnt(cri));
//	}
	
	
}
