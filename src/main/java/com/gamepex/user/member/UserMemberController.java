package com.gamepex.user.member;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user/member/")
public class UserMemberController {
	@Inject
	private UserMemberService userMemberService;
	
	@GetMapping("/register")
	public String register() {
		return "user/member/register";
	}
	
	@GetMapping("/idcheck")
	@ResponseBody
	public String idCheck(@RequestParam("mb_id") String mb_id) {
		return userMemberService.idCheck(mb_id) != null ? "ok" : "ng";
	}
}
