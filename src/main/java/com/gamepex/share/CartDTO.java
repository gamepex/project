package com.gamepex.share;

import lombok.Data;

@Data
public class CartDTO {

	private int ct_no;
	private String ct_type;
	private String ct_name;
	private int ct_price;
	private int ct_quantity;
	
	private int rt_no;
	
	private String con_serial;
	private String con_name;
	private String con_platform;
	private int con_price;
	private int con_stock;
	
	private int ttl_no;
	private String ttl_name;
	private String ttl_platform;
	private int ttl_price;
	private int ttl_stock;
}
