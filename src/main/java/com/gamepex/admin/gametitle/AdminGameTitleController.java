package com.gamepex.admin.gametitle;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gamepex.share.ConsoleVO;
import com.gamepex.share.GameTitleVO;
import com.gamepex.util.UploadFileService;

@Controller
@RequestMapping("/admin/game_title/*")
public class AdminGameTitleController {
	
	@Inject
	private AdminGameTitleService adminGameTitleService;
	@Inject
	private UploadFileService  uploadFileService;
	
	
	@GetMapping("/register")
	public void register() throws Exception{}

	@PostMapping("/register")
	public String register(GameTitleVO gameTitleVO, @RequestParam("file")MultipartFile file) throws Exception{
		
		String url =null;
		int result = 0;
		
		if(!file.getOriginalFilename().equals("")) {
			String attachFile = uploadFileService.upload(file);
			if(attachFile != null) {
				gameTitleVO.setTtl_thumbnail(attachFile);
				result = adminGameTitleService.register(gameTitleVO);
			}
			if(result !=0) {
				 url = "redirect:/admin/game_title/list";
			 }else {
				 url ="redirect:/admin/game_title/register_ng";
			 }
		}else {
			gameTitleVO.setTtl_thumbnail("attach.jsp");
			result = adminGameTitleService.register(gameTitleVO);
			if(result != 0) {
				url = "redirect:/admin/game_title/list";
			}else {
				 url ="redirect:/admin/game_title/register_ng";
			 }
		}
		
		return url;
	}

	@GetMapping("/list")
	public void getGameTitleList(Model model) throws Exception{
		List<GameTitleVO>gametitleList =	adminGameTitleService.getGameTitleList();
		model.addAttribute("gametitleList",gametitleList);
	}
	@GetMapping("/unable_list")
	public void getUnableList(Model model)throws Exception{
		List<GameTitleVO> gametitleList =adminGameTitleService.getUnableList();
		model.addAttribute("gametitleList",gametitleList);
	}
	@GetMapping("/modify")
	public void modify(@RequestParam("ttl_serial")String ttl_serial, Model model)throws Exception{
		GameTitleVO gameTitleVO = adminGameTitleService.getGameTitleOne(ttl_serial);
		model.addAttribute("modify",gameTitleVO);
	}
	
	@PostMapping("/modify")
	public String modify(GameTitleVO gameTitleVO,@RequestParam("file")MultipartFile file) throws Exception{
		String url = null;
		int result = 0;
		if(!file.getOriginalFilename().equals("")) {
			String attachFile =uploadFileService.upload(file);
			
			if(attachFile != null) {
				gameTitleVO.setTtl_thumbnail(attachFile);
			}
			result = adminGameTitleService.modify(gameTitleVO);
			if(result != 0) {
				adminGameTitleService.setState(gameTitleVO);
				url = "redirect:/admin/game_title/list";
			}else {
				url = "redirect:/admin/game_title/modify";
			}
		}else {
			result = adminGameTitleService.modify(gameTitleVO);
			
			if(result != 0) {
				adminGameTitleService.setState(gameTitleVO);
				url = "redirect:/admin/game_title/list";
			}else {
				url = "redirect:/admin/game_title/modify";
			}
		}
		return url;
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("ttl_serial")String ttl_serial)throws Exception{
		int result =adminGameTitleService.delete(ttl_serial);
		String url = null;
		
		if(result != 0) {
			url = "redirect:/admin/game_title/list";
		}else {
			url = "redirect:/admin/game_title/delete_ng";
		}
		return url;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
