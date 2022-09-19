package kr.co.guide.mypage.service;

public interface IMypageService {
	
	//일정 수
	public int countSchedule(String member_id);
	
	//문의 수
	public int countQna(String member_id);
	
}
