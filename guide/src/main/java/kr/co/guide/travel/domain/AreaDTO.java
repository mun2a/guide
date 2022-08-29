package kr.co.guide.travel.domain;

import lombok.Data;

@Data
public class AreaDTO {
	private String area_code;
	private String area_detail_code;
	private String area_english_title;
	private String area_image;
	private String area_content;
	private String area_name;
	private String area_detail_name;
	private int area_count;
	private double area_latitude; // 위도
	private double area_longitude; // 경도
}
