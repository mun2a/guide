package kr.co.guide.admin.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDTO {
	
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_nickname;
	private Timestamp member_regist_date;
	private Timestamp member_access_date;
	private String member_withdraw;
	private Timestamp member_delete_date;
	private String member_dormant;
	private Timestamp member_dormant_date;
	private String member_lock;
	
	private List<MemberAuthDTO> authList;

}



