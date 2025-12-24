package com.gamepex.share;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class RentalVO {
	private int rt_no;
	private String con_serial;
	private String ttl_serial;
	private String mb_id;
	private int rt_days;
	private int rt_shipfee;
	private int rt_quantities;
	private int rt_amount;
	private LocalDateTime rt_regdate;
	private int rt_payment;
	private String rt_invoice;
	private int rt_state; 
	private String rt_name;
	private String rt_zipcode;
	private String rt_addr;
	private String rt_addrdet;
	private String rt_tel;
	private String rt_req;
	private String rt_startdate;
	private String rt_enddate;
	private String rt_rtndate;
	private LocalDateTime rt_moddate;
	
}
