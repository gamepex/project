package com.gamepex.user.rental;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gamepex.admin.console.AdminConsoleService;
import com.gamepex.admin.gametitle.AdminGameTitleService;
import com.gamepex.admin.rental.AdminRentalService;
import com.gamepex.share.ConsoleVO;
import com.gamepex.share.GameTitleVO;
import com.gamepex.share.MemberVO;
import com.gamepex.share.RentalVO;
import com.gamepex.user.member.UserMemberService;

@Controller
@RequestMapping("/user/rental/*")
public class UserRentalController {
	
	@Inject
	private UserRentalService userRentalService;
	@Inject
	private AdminConsoleService adminConsoleService;
	@Inject
	private AdminGameTitleService adminGameTitleService;
	@Inject
	private UserMemberService userMemberService;
	@Inject
	private AdminRentalService adminRentalService;
	
	@GetMapping("/con_list")
	public String getConsoleList (Model model) throws Exception {
		List<ConsoleVO> consoleList= adminConsoleService.getConsoleList();
		String url = null;
		
		if(consoleList != null) {
			model.addAttribute("consoleList", consoleList);
			url ="/user/rental/con_list";
		} else {
			model.addAttribute("");
			url = "redirect:/user/index";
		}
		return url;
	}
	@GetMapping("/title_list")
	public String getGameTitleList (Model model) throws Exception {
		List<GameTitleVO> titleList= adminGameTitleService.getGameTitleList();
		String url = null;
		if(titleList != null) {
			model.addAttribute("titleList", titleList);
			url ="/user/rental/title_list";
		}
		return url;
	}
	@GetMapping("/con_view")
	public void getConsoleOne(@RequestParam("con_serial")String con_serial, HttpSession session, Model model) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		model.addAttribute("member", memberVO);
		ConsoleVO consoleVO = adminConsoleService.getConsoleOne(con_serial);
			model.addAttribute("con",consoleVO);
	}
	@GetMapping("/title_view")
	public void getTitleOne(@RequestParam("ttl_serial")String ttl_serial,Model model)throws Exception {
		GameTitleVO titleVO = adminGameTitleService.getGameTitleOne(ttl_serial);
			model.addAttribute("ttl",titleVO);
	}

	@GetMapping("/con_rental")
	public String conRent(@RequestParam("con_serial")String con_serial, HttpSession session, Model model) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		if(memberVO != null) {
			if(con_serial != null && !con_serial.isEmpty()) {
				model.addAttribute("m", memberVO);
				model.addAttribute("item", adminConsoleService.getConsoleOne(con_serial));
				return "/user/rental/con_rental";
			} 
		} return "/user/member/login";
	}
	
	@GetMapping("/ttl_rental")
	public String ttlRent(@RequestParam("ttl_serial")String ttl_serial, HttpSession session, Model model) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		if(memberVO != null) {
			if(ttl_serial != null && !ttl_serial.isEmpty()) {
				model.addAttribute("m",memberVO);
				model.addAttribute("item", adminGameTitleService.getGameTitleOne(ttl_serial));
				return "/user/rental/ttl_rental";
			}
		} return "redirect:/user/member/login";
	}
	
//	@GetMapping("/register")
//	public String register(@RequestParam(value="con_serial",required=false)String con_serial, @RequestParam(value="ttl_serial",required=false)String ttl_serial,
//	@RequestParam(value="fromCart",required=false, defaultValue="false")boolean fromCart
//	, HttpSession session, Model model) throws Exception {

//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
//		if(memberVO != null) {
//			model.addAttribute("m",memberVO);
			//if(fromCart){
			//	model.addAttribute("itemList", userCartService.getCartList(memberVO.getMb_id()));
			//	model.addAttribute("viewType", "cart");
			// 지금 화면에 보여줄 데이터가 어디로부터 왔는지 알려주는 역할(if,when-otherwise,form-hidden 쓰임)
			//	return "/user/rental/register";
			//}
//			if(con_serial != null && !con_serial.isEmpty()) {
//				model.addAttribute("item", adminConsoleService.getConsoleOne(con_serial));
//				return "/user/rental/con_rental";
//			} else if (ttl_serial != null && !ttl_serial.isEmpty()) {
//				model.addAttribute("item", adminGameTitleService.getGameTitleOne(ttl_serial));
//				return "/user/rental/ttl_rental";
//			}	
//		} else {
//			return "redirect:/user/member/login";
//		}
//		return "/user/include/error";
//	}

	@PostMapping("/register")
	public String register(RentalVO rentalVO, HttpSession session)throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");

		if(memberVO != null) {
			rentalVO.setMb_id(memberVO.getMb_id());
			userRentalService.register(rentalVO);
			return "redirect:/user/rental/register_ok";
		} 
		return "redirect:/user/member/login";
	}

	@GetMapping("/register_ok")
	public String completeReg(HttpSession session, Model model)throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");

		if(memberVO != null) {
			model.addAttribute("latestRt", userRentalService.getLatestRental(memberVO.getMb_id()));
			return "/user/rental/register_ok";
		} else {
			return "/user/member/login";
		}
	}
	

	
	
	
	
	
	
	
	
	
	
}
