package com.gamepex.admin.staff;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/staff")
public class AdminStaffController {
	
	@Autowired
	private AdminStaffService adminStaffService;
	
	@GetMapping("/register")
	public String register() {
		return "admin/staff/register";
	}
	
	// 직원 아이디 중복 확인
	@PostMapping("/idcheck")
	@ResponseBody
	public String idCheck(@RequestParam("staff_id") String staff_id) {
		return adminStaffService.idCheck(staff_id) ? "true" : "false"; // 중복일 시 true.
	}
	
	
	
	// 직원 가입
	@PostMapping("/register")
	public String register(AdminStaffVO adminStaffVO, HttpSession session) {
		AdminStaffVO sessionStaffVO = adminStaffService.register(adminStaffVO);

	    if (sessionStaffVO != null) {
	        session.setAttribute("staff", sessionStaffVO); // 성공시 로그인
	        return "redirect:/admin";
	    }

	    return "admin/staff/register"; // 실패시 페이지 유지
	}
	
	
	// 로그인
	@PostMapping("/login")
	public String login(AdminStaffVO adminStaffVO, HttpSession session, RedirectAttributes rttr) {

		try { // 로그인 성공	
			AdminStaffVO dbStaffVO = adminStaffService.login(adminStaffVO);
			session.setAttribute("staff", dbStaffVO);
			return "redirect:/admin";
		} catch (LoginException e) { // 로그인 실패
			session.setAttribute("staff", null);
	        rttr.addFlashAttribute("loginError", e.getMessage());
	        return "redirect:/admin";
		}

	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin";
	}
	
	
	// 전체 직원 목록
	@GetMapping("/staff_list")
	public String getStaffList(Model model) {
	    List<AdminStaffVO> staffList = adminStaffService.getStaffList();
	    model.addAttribute("staffList", staffList);
	    return "admin/staff/staff_list";
	}
	
	// 직원 승인
	@PostMapping("/approval/{staffId}")
	@ResponseBody
	public String setApproval(@PathVariable("staffId") String staffId) {
	    adminStaffService.setApproval(staffId);
	    return "ok";
	}

}