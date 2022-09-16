package kr.co.guide.mypage.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.guide.mypage.mapper.MypageMapper;
import kr.co.guide.mypage.service.IMypageService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MypageServiceImpl implements IMypageService{
	
	@Autowired
	private MypageMapper mapgeMapper;
	
	public int countSchedule(String member_id) {
		log.info("==================== countSchedule ====================");
		return mapgeMapper.countSchedule(member_id);
	}

	@Override
	public int countQna(String member_id) {
		return mapgeMapper.countQna(member_id);
	}
	

}
