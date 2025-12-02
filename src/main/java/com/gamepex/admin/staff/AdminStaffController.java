package com.gamepex.admin.staff;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gamepex.dto.AdminStaffVO;

@Controller
@RequestMapping("/admin/staff")
public class AdminStaffController {
	@Inject
	private AdminStaffService adminStaffService;
	@Inject
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("/register")
	public String register() {
		return "admin/staff/register";
	}
	
	// 아이디 중복 확인
	@PostMapping("/idcheck")
	@ResponseBody
	public String idCheck(HttpServletRequest request) throws Exception {
		String staff_id = request.getParameter("staff_id");
		AdminStaffVO adminStaffVO = adminStaffService.idCheck(staff_id);
		return adminStaffVO != null ? "success" : "fail";
	}
	
	
	
	// 직원 가입
	@PostMapping("/register")
	public String register(AdminStaffVO adminStaffVO) {
		String staff_pw = adminStaffVO.getStaff_pw();
		String staff_ecd_pw = bCryptPasswordEncoder.encode(staff_pw);
		adminStaffVO.setStaff_pw(staff_ecd_pw);
		
		int result = adminStaffService.register(adminStaffVO);
		
		
		return result != 0 ? "성공" : "실패";
	}
}