package kr.co.guide.admin.service.Impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.guide.admin.domain.MemberCriteria;
import kr.co.guide.admin.domain.MemberDTO;
import kr.co.guide.admin.mapper.MemberMGMapper;
import kr.co.guide.admin.service.IMemberMGService;

@Service
public class MemberMGService implements IMemberMGService{
	
	@Autowired
	private MemberMGMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	private static final Logger log = LoggerFactory.getLogger(MemberMGService.class);

	@Override
	public MemberDTO read(String member_id) throws Exception {
		log.info("MemberMGService......read..................");
		return mapper.read(member_id);
	}

	@Override
	public List<MemberDTO> getListWithdrawNPaging(MemberCriteria cri) throws Exception {
		log.info("MemberMGService......회원목록 ..................");
		return mapper.getListWithdrawNPaging(cri);
	}
	
	@Override
	public int getWithdrawNCnt(MemberCriteria cri) throws Exception {
		return mapper.getWithdrawNCnt(cri);
	}

	@Override
	public int modifyWithdraw(String member_id) throws Exception {
		log.info("MemberMGService......탈퇴 ..................");
		return mapper.updateWithdrawY(member_id);
	}
	
	@Override
	public List<MemberDTO> listWithdrawPaging(MemberCriteria cri) throws Exception {
		log.info("MemberMGService...... 탈퇴회원목록 ..................");
		return mapper.getListWithdrawYPaging(cri);
	}
	
	@Override
	public int getWithdrawCnt(MemberCriteria cri) throws Exception {
		return mapper.getWithdrawYCnt(cri);
	}

	@Override
	public int modifyWithdrawCancle(String member_id) throws Exception {
		log.info("MemberMGService......탈퇴 취소 ..................");
		return mapper.updateWithdrawN(member_id);
	}

	@Override
	public int remove(String member_id) throws Exception {
		log.info("MemberMGService...... remove ..................");
		return mapper.delete(member_id);
	}

	@Override
	public int confirmNick(String member_nickname) throws Exception {
		return mapper.confirmNick(member_nickname);
	}

	@Override
	public int modify(MemberDTO mDto) throws Exception {
		if(mDto.getMember_password() != "") {
			mDto.setMember_password(passwordEncoder.encode(mDto.getMember_password()));
		}
		return mapper.update(mDto);
	}
	

}
