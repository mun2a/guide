package kr.co.guide.travel.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ScheduleDetailDTO {
	private int schedule_day;
	private int schedule_order;
	private int schedule_no;
	private int tour_no;
}
