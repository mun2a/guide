package kr.co.guide.admin;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.guide.admin.domain.Criteria;
import kr.co.guide.admin.mapper.QnaMGMapper;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/**/security-context.xml"})
@Log4j
public class QnaMGMapperTest {

	@Autowired
	private QnaMGMapper mapper;
	
//	@Test
//	public void testListCriteria() throws Exception {
//		Criteria cri = new Criteria();
//		mapper.getListWithPaging(cri);
//		
//	}
	
//	@Test
//	public void testTotalCnt() throws Exception {
//		
//		Criteria cri = new Criteria();
//		
//		System.out.println(mapper.getTotalCnt(cri));
//	}
	
//	@Test
//	public void readReply() throws Exception {
//		
//		String qna_no = "10323";
//		
//		mapper.readReply(qna_no);
//		
//	}

}
