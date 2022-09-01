package kr.co.guide.admin;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.guide.admin.domain.TourCriteria;
import kr.co.guide.admin.domain.TourDTO;
import kr.co.guide.admin.mapper.TourMGMapper;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/**/security-context.xml"})
@Log4j
public class TourMGMapperTest {

	@Autowired
	private TourMGMapper mapper;
	
//	@Test
//	public void testRead() throws Exception{
//		String tour_no = "125266";
//		mapper.read(tour_no);
//	}
	
//	@Test
//	public void testRead() throws Exception{
//		System.out.println(mapper.cateList());
//	}
	
//	@Test
//	public void testListCriteria() throws Exception {
//		TourCriteria cri = new TourCriteria();
//		List<TourDTO> result;
//		
//		cri.setPageNum(2);
//		cri.setAmount(20);
//		cri.setArea_code("");
//		cri.setArea_detail_code("");
//		cri.setTour_type("1");
//		
//		result = mapper.getListWithPaging(cri);
//		System.out.println("-----------------------------------------------------------------");
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
