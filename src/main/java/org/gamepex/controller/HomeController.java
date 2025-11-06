package org.bookrental.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@GetMapping("/")
	// 스프링 프로젝트가 웹 서버에서 실행될 때 요청 URL(http://localhost:8080)
	public String home() {
		return "redirect:/user/";
		// 사용자 URL 요청이 '/'이면 '/user'로 재전송하면 UserHomeController로 매핑된다.
	}
	
}



















