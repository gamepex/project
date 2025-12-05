package com.gamepex.admin.staff;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/staff")
public class AdminStaffController {
	
	@Inject
	private AdminStaffService adminStaffService;
	
	@GetMapping("/register")
	public String register() {
		return "admin/staff/register";
	}
	
	// 직원 아이디 중복 확인
	@PostMapping("/idcheck")
	@ResponseBody
	public boolean idCheck(@RequestParam("staff_id") String staff_id) {
		return adminStaffService.idCheck(staff_id);
	}
	
	
	
	// 직원 가입
	@PostMapping("/register")
	@ResponseBody
	public String register(AdminStaffVO adminStaffVO) {
		return adminStaffService.register(adminStaffVO) ? "성공" : "실패";
	}
	
	

	@PostMapping("/login")
	public String login(AdminStaffVO adminStaffVO, HttpSession session) {

		try { // 로그인 성공
			AdminStaffVO dbStaffVO = adminStaffService.login(adminStaffVO);
			session.setAttribute("staff", dbStaffVO);
			return "redirect:/admin";
		} catch (LoginException e) { // 로그인 실패 (미완)
			session.setAttribute("staff", null);
			return e.getMessage();
		}

	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin";
	}

}