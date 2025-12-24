package com.gamepex.user.member;

import java.util.List;
import java.util.Collections;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gamepex.share.MemberVO;

@Controller
@RequestMapping("/user/member")
public class UserMemberController {

	@Autowired
	private UserMemberService userMemberService;
	
	@GetMapping("/register")
	public String register() {
		return "user/member/register";
	}

	// 회원 아이디 중복 확인
	@PostMapping("/idcheck")
	@ResponseBody
	public String idCheck(@RequestParam("mb_id") String mb_id) {
		return userMemberService.idCheck(mb_id) ? "true" : "false"; // 중복일 시 true.
	}

	// 회원 가입
	@PostMapping("/register")
	public String register(MemberVO memberVO, HttpSession session, Model model) {
		try {
			MemberVO sessionMemberVO = userMemberService.register(memberVO);
			if (sessionMemberVO != null) {
				session.setAttribute("member", sessionMemberVO); // 성공시 로그인
				return "redirect:/user/member/mypage";
			}
			return "user/member/register"; // 실패시 페이지 유지

		} catch (IllegalArgumentException e) {
			model.addAttribute("resultMsg", e.getMessage());
			return "user/member/register";
		}
	}

	// 회원 로그인 페이지
	@GetMapping("/login")
	public String login() {
		return "user/member/login";
	}

	// 회원 로그인
	@PostMapping("/login")
	public String login(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) {

		try { // 로그인 성공	
			MemberVO dbMemberVO = userMemberService.login(memberVO);
			session.setAttribute("member", dbMemberVO);
			return "redirect:/user/member/mypage";
		} catch (LoginException e) { // 로그인 실패
			session.setAttribute("member", null);
	        rttr.addFlashAttribute("loginError", e.getMessage());
	        return "redirect:/user/member/login";
		}

	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/user";
	}
	
	// 마이페이지
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session)  {
		MemberVO svo = (MemberVO) session.getAttribute("member");
		List<MemberVO> memberInfo;
		MemberVO me = userMemberService.getMember(svo.getMb_id());
		memberInfo = Collections.singletonList(me);

		model.addAttribute("memberInfo", memberInfo);
		return "user/member/mypage";
	}
	

	// 회원 삭제
	@PostMapping("/deleteMember")
	public String deleteMember(@RequestParam("mb_id") String mb_id, RedirectAttributes rttr) {

	    int result = userMemberService.deleteMember(mb_id);

	    if (result == 1) {
			// 로그아웃
			

			return "redirect:/user";
	    } else {
	        rttr.addFlashAttribute("alertType", "danger");
	        rttr.addFlashAttribute("resultMsg", "회원 삭제에 실패했습니다.");
			return "redirect:/user/member/mypage";
	    }

	    
	}
	
	// 회원 수정 페이지
	@GetMapping("/modify")
	public String modify(@RequestParam("mb_id") String mb_id, Model model) {

		// 회원 정보 수집
	    MemberVO memberVO = userMemberService.getMember(mb_id);
	    model.addAttribute("svo", memberVO);
	    return "user/member/modify";
	}

	// 회원 수정 처리
	@PostMapping("/modify")
	public String modify(MemberVO memberVO, RedirectAttributes rttr) {

	    int result = userMemberService.modifyMember(memberVO);
	    if (result == 1) {
	        rttr.addFlashAttribute("alertType", "success");
	        rttr.addFlashAttribute("resultMsg", "회원 수정에 성공했습니다.");
	        return "redirect:/user/member/mypage";
	    } else {
		    rttr.addFlashAttribute("alertType", "danger");
		    rttr.addFlashAttribute("resultMsg", "회원 수정에 실패했습니다.");
		    rttr.addAttribute("mb_id", memberVO.getMb_id());
		    return "redirect:/user/member/modify";
	    }
	}


}
