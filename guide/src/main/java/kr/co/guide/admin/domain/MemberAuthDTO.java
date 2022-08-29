package kr.co.guide.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberAuthDTO {

	private String member_id;
	private String member_authority;
	
}
	