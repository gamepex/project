package com.gamepex.user.device;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/user/device/*")
public class DeviceController {
	
	@GetMapping("/playstation")
	public void playstation() {}
	
	@GetMapping("/nintendo")
	public void nintendo() {}
	
	@GetMapping("/steam")
	public void steam() {}
	
	@GetMapping("/virtual")
	public void virtual() {}
	
	@GetMapping("/xbox")
	public void xbox() {}
}
