package kr.co.guide.member.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberDTO {
	private String member_id;                //회원아이디 (이메일형식)
	private String member_password;           //회원비밀번호
	private String member_name;               //회원이름
	private String member_nickname;           //회원 닉네임
	private Timestamp member_regist_date;     //회원 등록일
	private Timestamp member_access_date;     //회원 최근 접속일
	private String member_withdraw;           //회원 탈퇴 여부
	private Timestamp member_delete_date;     //회원 탈퇴일
	private String member_dormant;            //회원 휴면계정 여부
	private Timestamp member_dormant_date;    //회원 휴면계정 진입 날짜
	private String member_lock;               //회원 잠금

	List<AuthorityDTO> authList;             // AuthorityDTO 의 권한들을 불러옴
}
