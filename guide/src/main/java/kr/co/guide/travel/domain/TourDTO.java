package kr.co.guide.travel.domain;

import lombok.Data;

@Data
public class TourDTO {
	private int tour_no;
	private String tour_title;
	private String tour_content;
	private String tour_zipcode;
	private String tour_address;
	private String tour_type;
	private String tour_image;
	private String tour_thumbnail;
	private String tour_category1;
	private String tour_category2;
	private String tour_category3;
	private double tour_mapx;
	private double tour_mapy;
	private int tour_maplevel;
	private String tour_homepage;
	private int tour_count;
	private String area_code;
	private String area_detail_code;
}
