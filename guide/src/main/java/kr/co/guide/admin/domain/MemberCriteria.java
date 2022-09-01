package kr.co.guide.admin.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class MemberCriteria {
	
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	private String member_id;
	
	public MemberCriteria() {
		this(1, 20);
	}
	
	public MemberCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
	public String GetListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
												.queryParam("pageNum", this.pageNum)
												.queryParam("amount", this.getAmount())
												.queryParam("type", this.getType())
												.queryParam("keyword", this.getKeyword())
												.queryParam("member_id", this.getMember_id())
												;
		
		return builder.toUriString();
													
	}
													
}
