package com.gamepex.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserPageController {
	@GetMapping
	public String home() { return "user/index"; }
	
	@GetMapping("/virtual")
	public String virtual() { return "user/virtual"; }
}