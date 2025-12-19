package com.gamepex.share;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class RentalDTO {
	private int rt_no;
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
	
	private String mb_id;
	private String mb_name;
	private String mb_nickname;
	private String mb_gender;
	private String mb_mail;
	private String mb_phone;
	private String mb_zipcode;
	private String mb_addr;
	private String mb_addrdet;
	private int mb_grade;
	private int mb_state;
	
	private String con_serial;
	private String con_name;
	private String con_platform;
	private int con_price;
	private String con_thumbnail;
	private int con_stock;
	private int con_state;
	
	private String ttl_serial;
	private String ttl_name;
	private String ttl_genre;
	private int ttl_price;
	private String ttl_thumbnail;
	private int ttl_stock;
	private int ttl_state;
}
