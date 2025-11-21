package com.gamepex.user.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/info/")
public class UserInfoController {
	@GetMapping
	public String home() { return "user/info/index"; }
	
	@GetMapping("/virtual")
	public String virtual() { return "user/info/virtual"; }
	
	@GetMapping("/steam")
	public String steam() { return "user/info/steam"; }
}