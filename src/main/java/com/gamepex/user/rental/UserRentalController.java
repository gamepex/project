package com.gamepex.user.rental;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gamepex.admin.console.AdminConsoleService;
import com.gamepex.admin.gametitle.AdminGameTitleService;
import com.gamepex.admin.rental.AdminRentalService;
import com.gamepex.share.ConsoleVO;
import com.gamepex.share.GameTitleVO;
import com.gamepex.share.MemberVO;
import com.gamepex.share.RentalDTO;
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
	
	String alert = null;
	
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
	public String getConsoleOne(@RequestParam("con_serial")String con_serial,Model model) throws Exception {
		ConsoleVO consoleVO = adminConsoleService.getConsoleOne(con_serial);
			model.addAttribute("con",consoleVO);
		return "/user/rental/con_view";
	}
	@GetMapping("/title_view")
	public String getTitleOne(@RequestParam("title_serial")String ttl_serial,Model model)throws Exception {
		GameTitleVO titleVO = adminGameTitleService.getGameTitleOne(ttl_serial);
			model.addAttribute("ttl",titleVO);
		return "/user/rental/title_view";
	}

	@GetMapping("/register")
	public String register(@RequestParam(value="con_serial", required=false)String con_serial, @RequestParam(value="ttl_serial", required=false)String ttl_serial,
	@RequestParam(value="fromCart", required=false, defaultValue="false") boolean fromCart
	, HttpSession session, Model model) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute("m");
		
		if(memberVO != null) {
			model.addAttribute("m",memberVO);
			//if(fromCart){
			//	model.addAttribute("itemList", userCartService.getCartList(memberVO.getMb_id()));
			//	model.addAttribute("viewType", "cart");
			//	return "/user/rental/register";
			//}
			if(con_serial != null && !con_serial.isEmpty()) {
				model.addAttribute("item", adminConsoleService.getConsoleOne(con_serial));
				//지금 화면에 보여줄 데이터가 콘솔인지, 게임 타이틀인지 알려주는 역할(if,when-otherwise,form-hidden)
				return "/user/rental/con_rental";
			} else if (ttl_serial != null && !ttl_serial.isEmpty()) {
				model.addAttribute("item", adminGameTitleService.getGameTitleOne(ttl_serial));
				return "/user/rental/ttl_rental";
			}	
		} else {
			return "redirect:/user/member/login";
		}
		return "/user/include/error";
	}
	
	@PostMapping("/register")
	public String register(RentalVO rentalVO, HttpSession session) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("m");

		if (memberVO != null) {
			rentalVO.setMb_id(memberVO.getMb_id());
			userRentalService.register(rentalVO);
			System.out.println("생성된 주문번호: " + rentalVO.getRt_no()); 
			return "redirect:/user/rental/register_ok";
		} 
		return "redirect:/user/member/login";
	}

	@GetMapping("/register_ok")
	public void completeReg(){}
	
	
	
	
	
	
	
	
	
	
}
