package com.gamepex.user.cart;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gamepex.share.CartVO;
import com.gamepex.share.MemberVO;

@Controller
@RequestMapping("/user/cart/*")
public class UserCartController {
	
	@Inject
	private UserCartService userCartService;
	
	@GetMapping("/view")
	public String getCartList(HttpSession session, Model model)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO != null) {
			model.addAttribute("cartList", userCartService.getCartList(memberVO.getMb_id()));
			return "/user/cart/view";
		} return "redirect:/user/member/login";
	}
	@PostMapping("/register")
	@ResponseBody // JSP 뷰를 찾지 않고 데이터(문자열/JSON)를 직접 반환
	public String cartReg(CartVO cartVO, HttpSession session, Model model)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO != null) {
			try {
				cartVO.setMb_id(memberVO.getMb_id());
				userCartService.cartReg(cartVO);
				return "success";
			} catch (Exception e) { // 자바 언어에서 기본적으로 제공하는 예외 처리용 변수
				e.printStackTrace(); // 서버 콘솔에 에러 내용을 출력
				return e.getMessage();
			}
		} return "login_required";
		
	}
}

