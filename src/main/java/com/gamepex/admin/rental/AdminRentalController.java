package com.gamepex.admin.rental;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gamepex.share.RentalDTO;

@Controller
@RequestMapping("/admin/rental/*")
public class AdminRentalController {

	@Inject
	private AdminRentalService adminRentalService;
	

	// 대여 내역 조회
	@GetMapping("/list")
	public void getRentalList(Model model) throws Exception { 
		List<RentalDTO> rentalList = adminRentalService.getRentalList();
		model.addAttribute("rentalList", rentalList);
	}

	
	// 대여 현황 수정
	@PostMapping("/rtstate")
	public String setRentalState(@RequestParam("rt_no") int rt_no, @RequestParam("rt_state") int rt_state, RedirectAttributes rttr) throws Exception {
		adminRentalService.setRentalState(rt_no, rt_state);
		rttr.addAttribute("rt_no", rt_no);
		
		return "redirect:/admin/rental/detail?rt_no={rt_no}";
	}

	
	
	
	
	

	
}
