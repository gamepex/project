package com.gamepex.share;

import lombok.Data;

@Data
public class RentDetailDTO {
	private int rd_no;
	private int rt_no; // 렌탈 번호
	private String rd_type; // ('ps5', 'xbox', 'nintendo', 'vr', 'steamdeck' != )
	private String rd_serial; 
	private int rd_price; // 1일당 단가
	private int rd_quantity;
	
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
