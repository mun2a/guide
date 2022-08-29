package kr.co.guide.member.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.guide.member.domain.MemberDTO;
import kr.co.guide.member.mapper.MemberMapper;
import kr.co.guide.member.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements IMemberService{
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	//해당 회원의 정보 출력 
	@Override
	public MemberDTO selectMemberInfo(String member_id) {
		
		log.info("==================== service selectMemberInfo ====================");
		
		
		return memberMapper.selectMemberInfo(member_id); //회원 정보 출력
	}
	
	// 일반 맴버 회원 추가 기능
	@Override
	public boolean insertMemberInfo(MemberDTO mDto) {

		log.info("==================== service insertMemberInfo ====================");
		
		MemberDTO existUser = memberMapper.selectMemberInfo(mDto.getMember_id());
		
		if(existUser != null) {  //현재 아이디 존재하는경우 //이중장치
			
			return false;
			
		} else {  //아이디가 존재하지 않을경우 회원등록
			
			
			mDto.setMember_password(passwordEncoder.encode(mDto.getMember_password()));  //패스워드 암호화 시큐리티
			 
			memberMapper.insertMemberInfo(mDto);                     //유저 테이블에 회원등록
			memberMapper.insertMemberAuthority(mDto.getMember_id()); //유저 권한테이블에 맴버권한 등록
				
			return true;
				
		}
		
	}
	
	
	//회원 접속시 최근 접속날짜 최신화 기능
	@Override
	public boolean updateMemberAccessDate(String member_id) {

		log.info("==================== service updateAccessDate ====================");
		
		return memberMapper.updateMemberAccessDate(member_id) == 1 ? true : false;    //성공하면 true 아니면 false
	}
	
	
	//회원 정보 체크(비밀번호찾기, 회원정보 수정창 접근 직전 페이지 )
	@Override
	public String selectMemberCheck(MemberDTO mDto) {
		
		log.info("==================== service selectMemberCheck ====================");
		
		return memberMapper.selectMemberCheck(mDto);
	}
	
	//회원가입시 중복체크(아이디(이메일) / 닉네임)
	@Override
	public String selectDuplicateCheck(MemberDTO mDto) {
		
		log.info("==================== service selectDuplicateCheck ====================");
		
		return memberMapper.selectDuplicateCheck(mDto);
	}
	
	//회원 정보 수정
	@Override
	public boolean updateMemberInfo(MemberDTO mDto) {
		
		log.info("==================== service updateMemberInfo ====================");
		
		//비밀번호도 변경하는 경우
		if(mDto.getMember_password() != "") {
			mDto.setMember_password(passwordEncoder.encode(mDto.getMember_password()));
		}
		System.out.println(mDto);
		
		return memberMapper.updateMemberInfo(mDto) == 1 ? true : false;
	}
	
	//회원 비밀번호수정(임시비밀번호 전송
	@Override
	public boolean updateMemberPassword(MemberDTO mDto) {
		
		log.info("==================== service updateMemberPassword ====================");
		
		return  memberMapper.updateMemberPassword(mDto) == 1 ? true : false;
	}

	@Override
	public boolean updateMemberDelete(MemberDTO mDto) {
		
		log.info("==================== service updateMemberDelete ====================");
		
		return memberMapper.updateMemberDelete(mDto) == 1 ? true : false;
	}
	
	

}
