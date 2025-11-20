package com.gamepex.user.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/info/*")
public class UserInfoController {
	
	@GetMapping("/playstation")
	public void playstation() throws Exception{}
	
	@GetMapping("/xbox")
	public void	xbox() throws Exception{}
	
	@GetMapping("/virtual")
	public void	virtual() throws Exception{}
	
	@GetMapping("/steam")
	public void	steam() throws Exception{}
	
	@GetMapping("/nintendo")
	public void	nintendo() throws Exception{}
}
