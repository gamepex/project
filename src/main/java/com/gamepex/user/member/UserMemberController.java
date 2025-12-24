package com.gamepex.user.member;

import java.util.List;
import java.util.Collections;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gamepex.share.MemberVO;

@Controller
@RequestMapping("/user/member")
public class UserMemberController {

	@Autowired
	private UserMemberService userMemberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(MemberVO memberVO) throws Exception {
		
		int result = 0;
		String url =null;
		
		String mb_pw = memberVO.getMb_pw();
		String mb_enc_pw = bCryptPasswordEncoder.encode(mb_pw);
		memberVO.setMb_pw(mb_enc_pw);
		
		result = userMemberService.register(memberVO);
		
		if(result != 0) {
			url = "/admin/index";
		}else {
			url = "/admin/console/register";
		}
		return url;
	}
	
	@GetMapping("/get_zipcode")
	public void getZipcode() throws Exception {}
	
	/* @PostMapping("/get_zipcode")
	public void getZipcode(AddressDTO addressDTO, Model model) throws Exception {
		List<AddressDTO> addrList = userMemberService.getZipcode(addressDTO);
		model.addAttribute("addrList", addrList);
	}*/

	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session)  {
		MemberVO svo = (MemberVO) session.getAttribute("member");
		List<MemberVO> memberInfo;
		MemberVO me = userMemberService.getMember(svo.getMb_id());
		memberInfo = Collections.singletonList(me);

		model.addAttribute("memberInfo", memberInfo);
		return "user/member/mypage";
	}


	
	
	@GetMapping("/login")
	public String login() {
		return "user/member/login";
	}
	
	@PostMapping("/login")
	public String login(MemberVO memberVO, HttpSession session, Model model) throws Exception {
		MemberVO dbMvo = userMemberService.login(memberVO);
		String url = null;
		
		if (dbMvo != null) {
			if (dbMvo.getMb_state() != 0) {
				boolean result = bCryptPasswordEncoder.matches(memberVO.getMb_pw(), dbMvo.getMb_pw());
				
				if (result) { 
					session.setAttribute("member", dbMvo);
					url = "/user/index";
				} else {
					session.setAttribute("member", null);
					model.addAttribute("mb_pw", false);
					url = "/user/member/login_ng";
				}
			} else { 
				session.setAttribute("member", null);
				model.addAttribute("mb_state", false);
				url = "/user/member/login_ng";
			}
		} else { 
			session.setAttribute("member", null);
			model.addAttribute("mb_id", false);
			url = "/user/member/login_ng";
		}
		
		return url;
	}
	
	
	@GetMapping("/resetpwd")
	public void resetPwd() throws Exception {}
	
	@PostMapping("/resetpwd")
	public String resetPwd(MemberVO memberVO, RedirectAttributes rttr) throws Exception {
		String mb_pw = memberVO.getMb_pw();
		String enc_pw = bCryptPasswordEncoder.encode(mb_pw);
		memberVO.setMb_pw(enc_pw);
		String url = null;
		
		int result = userMemberService.resetPwd(memberVO);
		
		if (result != 0) {
			rttr.addFlashAttribute("reset_pwd", true);
			url = "redirect:/user/member/login";
		} else { 
			rttr.addFlashAttribute("reset_pwd", false);
			url = "redirect:/user/member/resetpwd";
		}
		
		return url;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
