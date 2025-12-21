package com.gamepex.admin.staff;

import java.util.List;
import java.util.Collections;
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
	public String register(AdminStaffVO adminStaffVO, HttpSession session, Model model) {
		try {
			AdminStaffVO sessionStaffVO = adminStaffService.register(adminStaffVO);

			if (sessionStaffVO != null) {
				session.setAttribute("staff", sessionStaffVO); // 성공시 로그인
				return "redirect:/admin";
			}
			return "admin/staff/register"; // 실패시 페이지 유지

		} catch (IllegalArgumentException e) {
			model.addAttribute("resultMsg", e.getMessage());
			return "admin/staff/register";
		}
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
	@GetMapping("/list")
	public String getStaffList(Model model, HttpSession session) {
		AdminStaffVO svo = (AdminStaffVO) session.getAttribute("staff");
		List<AdminStaffVO> staffList;

		if ("인사".equals(svo.getStaff_part())) {
			staffList = adminStaffService.getStaffList(); // 전체
		} else {
			AdminStaffVO me = adminStaffService.getStaff(svo.getStaff_id()); // 본인
			staffList = Collections.singletonList(me);
		}

		model.addAttribute("staffList", staffList);
		return "admin/staff/list";
	}
	
	// 직원 승인
	@PostMapping("/approval/{staff_id}")
	@ResponseBody
	public String setApproval(@PathVariable("staff_id") String staff_id) {
		int result = adminStaffService.setApproval(staff_id);
	    return (result == 1) ? "ok" : "fail";
	}
	
	// 직원 삭제
	@PostMapping("/deleteStaff")
	public String deleteStaff(@RequestParam("staff_id") String staff_id, RedirectAttributes rttr) {

	    int result = adminStaffService.deleteStaff(staff_id);

	    if (result == 1) {
	        rttr.addFlashAttribute("alertType", "success");
	        rttr.addFlashAttribute("resultMsg", "직원 삭제에 성공했습니다.");
	    } else {
	        rttr.addFlashAttribute("alertType", "danger");
	        rttr.addFlashAttribute("resultMsg", "직원 삭제에 실패했습니다.");
	    }

	    return "redirect:/admin/staff/list";
	}
	
	// 직원 수정 접속
	@GetMapping("/modify")
	public String modify(@RequestParam("staff_id") String staff_id, Model model) {
		
		// 직원 정보 수집
	    AdminStaffVO adminStaffVO = adminStaffService.getStaff(staff_id);
	    model.addAttribute("svo", adminStaffVO);
	    return "admin/staff/modify";
	}
	
	// 직원 수정 처리
	@PostMapping("/modify")
	public String modify(AdminStaffVO adminStaffVO, RedirectAttributes rttr) {

	    int result = adminStaffService.modifyStaff(adminStaffVO);

	    if (result == 1) {
	        rttr.addFlashAttribute("alertType", "success");
	        rttr.addFlashAttribute("resultMsg", "직원 수정에 성공했습니다.");
	        return "redirect:/admin/staff/list";
	    } else {
		    rttr.addFlashAttribute("alertType", "danger");
		    rttr.addFlashAttribute("resultMsg", "직원 수정에 실패했습니다.");
		    rttr.addAttribute("staff_id", adminStaffVO.getStaff_id());
		    return "redirect:/admin/staff/modify";
	    }
	}

}