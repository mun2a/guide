package kr.co.guide.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TourDTO {
	
	private String tour_no;
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
	private String tour_mapx;
	private String tour_mapy;
	private String tour_maplevel;
	private String tour_homepage;
	private int tour_count;
	private String area_code;
	private String area_detail_code;
	
	
	private String area_name;
	private String area_detail_name;
	

}

//DTO - Mapper.java - Mapper.xml 
//- MapperTests.java - service - controller
