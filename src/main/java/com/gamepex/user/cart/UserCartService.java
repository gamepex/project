package com.gamepex.user.cart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gamepex.share.CartVO;

@Service
public class UserCartService {

	@Inject
	private UserCartDAO userCartDAO;
	
	public List<CartVO> getCartList(String mb_id)throws Exception{
		 return userCartDAO.getCartList(mb_id);
	}
	public void cartReg(CartVO cartVO)throws Exception{
		boolean ckCon = cartVO.getCon_serial() != null && !cartVO.getCon_serial().equals("");
		boolean ckTtl = cartVO.getTtl_serial() != null && !cartVO.getTtl_serial().equals("");
		// '잘못된 요청'을 사전에 차단해서 무의미한 DB 요청 방지하고 서버 자원을 아끼기 위함
		// 서비스 단에서 체크하면 "상품을 선택해 주세요"라는 정확한 메시지를 사용자에게 돌려줄 수 있음
		if (ckCon || ckTtl) {
			userCartDAO.cartReg(cartVO);
		} else {
			throw new Exception("대여할 상품이 선택되지 않았습니다.");
		}
	}
	
	
	
}
