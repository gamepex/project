package com.gamepex.share;

import java.util.Date;
import lombok.Data;

@Data
public class CartDTO {
	private int ct_no;
	private String mb_id;
	private int ct_quantity;
	private int ct_ischecked; // 체크된 상품(1: true(체크됨, 기본값), 0: false)',
	private int ct_days;
	private Date ct_startdate;
	private Date ct_enddate;
	private int ct_shipfee;
	private int ct_amount;
	
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
