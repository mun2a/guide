package kr.co.guide.admin.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class TourCriteria {
	
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	private String area_code;
	private String area_detail_code;
	private String tour_type;
	
	public TourCriteria() {
		this(1, 20);
	}
	
	public TourCriteria(int pageNum, int amount) {
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
												.queryParam("area_code", this.getArea_code())
												.queryParam("area_detail_code", this.getArea_detail_code())
												.queryParam("tour_type", this.getTour_type())
												;
		
		return builder.toUriString();
													
	}
	
}
