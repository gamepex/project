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

import com.gamepex.share.RentDetailDTO;
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
	
	// 대여 내역 상세
	@GetMapping("/detail")
	public void getRentalDetail(@RequestParam("rt_no") int rt_no, Model model) throws Exception {
		List<RentalDTO> rentalDetailList = adminRentalService.getRentalDetail(rt_no);
		model.addAttribute("rentalList", rentalDetailList);
	}
	
	// 대여 현황 수정
	@PostMapping("/rtstate")
	public String setRentalState(@RequestParam("rt_no") int rt_no, @RequestParam("rt_state") int rt_state, RedirectAttributes rttr) throws Exception {
		adminRentalService.setRentalState(rt_no, rt_state);
		rttr.addAttribute("rt_no", rt_no);
		
		return "redirect:/admin/rental/detail?rt_no={rt_no}";
	}
//	
//	// 품목별 대여 현황 수정
//	@GetMapping("/modify")
//	public String setItemState(@RequestParam("rd_type") String rd_type, @RequestParam("rd_serialno") String rd_serialno) throws Exception {
//		
//		// 현재 대여 현황 조회(주문 테이블)
//		int currentState = adminRentalService.getRentalState(rd_serialno);
//		
//		if (currentState != 6) {
//			currentState = 1;
//		} else { currentState = 0;}
//		
//		
//		if(rd_type.equals("console")) {
//			adminRentalService.setConsoleState(currentState, rd_serialno);
//		} else {
//			adminRentalService.setTitleState(currentState, rd_serialno);
//		}
//		
//		return "redirect:/admin/rental/list";
//	}
//	
	
	
	
	
	
	

	
}
