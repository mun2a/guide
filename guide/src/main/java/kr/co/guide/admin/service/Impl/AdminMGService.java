package kr.co.guide.admin.service.Impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.guide.admin.domain.MemberDTO;
import kr.co.guide.admin.mapper.AdminMGMapper;
import kr.co.guide.admin.service.IAdminMGService;

@Service
public class AdminMGService implements IAdminMGService{
	
	@Autowired
	private AdminMGMapper mapper;
	
	private static final Logger log = LoggerFactory.getLogger(AdminMGService.class);

	@Override
	public List<MemberDTO> list() throws Exception {
		log.info("AdminMGService......list..................");
		return mapper.adminList();
	}

	@Override
	public int addAdminAuth(String member_id) throws Exception {
		log.info("AdminMGService......addAdminAuth..................");
		return mapper.insertAdminAuth(member_id);
	}
	
	@Override
	public String confirmPK(MemberDTO mDto) throws Exception {
		log.info("AdminMGService......confirmPK..................");
		return mapper.confirmPK(mDto);
	}

	@Override
	public int removeAdminAuth(String member_id) throws Exception {
		log.info("AdminMGService......removeAdminAuth..................");
		return mapper.deleteAdminAuth(member_id);
	}

}
