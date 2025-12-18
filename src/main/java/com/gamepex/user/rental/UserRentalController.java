package com.gamepex.user.rental;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gamepex.admin.console.AdminConsoleService;
import com.gamepex.admin.gametitle.AdminGameTitleService;
import com.gamepex.admin.rental.AdminRentalService;
import com.gamepex.share.AddressDTO;
import com.gamepex.share.ConsoleVO;
import com.gamepex.share.GameTitleVO;
import com.gamepex.share.MemberVO;
import com.gamepex.share.RentDetailVO;
import com.gamepex.share.RentalDTO;
import com.gamepex.share.RentalRequestDTO;
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
	public String register(@RequestParam("con_serial") String con_serial, HttpSession session, Model model) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute("m");
		ConsoleVO consoleVO = adminConsoleService.getConsoleOne(con_serial);
		//if(memberVO != null) {
			model.addAttribute("c",consoleVO);
			return "/user/rental/register";
	//	} else {
	//		return "/user/member/login";
		//}
	}
	
	// 대여 신청 데이터 
	@PostMapping("/register")
	@ResponseBody
	public String register(@RequestBody RentalRequestDTO rrdto, HttpSession session, Model model) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute("m");
		System.out.println(rrdto);
		if (memberVO != null) {
			userRentalService.register(rrdto.getRentalInfo(), rrdto.getDetailList());
			return "success";
		} else {
			return "login-required";
		}
	}
	
	@GetMapping("/get_zipcode")
	public void getZipcode() throws Exception {}
	
	@PostMapping("/get_zipcode")
	public void getZipcode(AddressDTO addressDTO, Model model) throws Exception {
		List<AddressDTO> addrList = userMemberService.getZipcode(addressDTO);
		model.addAttribute("addrList", addrList);
	}

	
	
	
	
	
	
	
	
	
	
}
