package com.gamepex.share;

import java.util.Date;
import lombok.Data;

@Data
public class CartVO {
	private int ct_no;
	private String con_serial;
	private String ttl_serial;
	private String mb_id;
	private int ct_quantity;
	private int ct_ischecked; // 체크된 상품(1: true(체크됨, 기본값), 0: false)',
	private int ct_days;
	private Date ct_startdate;
	private Date ct_enddate;
	private int ct_shipfee;
	private int ct_amount;
}
