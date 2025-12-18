package com.gamepex.admin.console;

import java.util.List;

import javax.inject.Inject;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gamepex.share.ConsoleVO;
import com.gamepex.util.UploadFileService;

@Controller
@RequestMapping("/admin/console/*")
public class AdminConsoleController {
	
	@Inject
	private AdminConsoleService adminConsoleService;
	@Inject
	private UploadFileService  uploadFileService;
	
	
	@GetMapping("/register")
	public void register() throws Exception{}

	@PostMapping("/register")
	public String register(ConsoleVO consoleVO, @RequestParam("file")MultipartFile file) throws Exception{
		String url =null;
		int result = 0;
		
			if(!file.getOriginalFilename().equals("")) {
				String attachFile = uploadFileService.upload(file);
				if(attachFile != null) {
					consoleVO.setCon_thumbnail(attachFile);
					result = adminConsoleService.register(consoleVO);
				}
				if(result !=0) {
					 url = "redirect:/admin/console/list";
				 }else {
					 url ="redirect:/admin/console/register_ng";
				 }
			}else {
				consoleVO.setCon_thumbnail("attach.jsp");
				result = adminConsoleService.register(consoleVO);
				if(result != 0) {
					url = "redirect:/admin/console/list";
				}else {
					 url ="redirect:/admin/console/register_ng";
				 }
			}
		return url;
	}
	
	@GetMapping("/list")
	public void getConsoleList(Model model) throws Exception{
		List<ConsoleVO>consoleList =	adminConsoleService.getConsoleList();
		model.addAttribute("consoleList",consoleList);
	}
	
	@GetMapping("/unable_list")
	public void getUnableList(Model model)throws Exception{
		List<ConsoleVO>consoleList = adminConsoleService.getUnableList();
		model.addAttribute("consoleList",consoleList);
	}
	@GetMapping("/modify")
	public void modify(@RequestParam("con_serial")String con_serial, Model model)throws Exception{
		ConsoleVO consoleVO = adminConsoleService.getConsoleOne(con_serial);
		model.addAttribute("modify",consoleVO);
	}
	
	@PostMapping("/modify")
	public String modify(ConsoleVO consoleVO,@RequestParam("file")MultipartFile file) throws Exception{
		String url = null;
		int result = 0;
	
		if(!file.getOriginalFilename().equals("")) {
			String attachFile =uploadFileService.upload(file);
			if(attachFile != null) {
				consoleVO.setCon_thumbnail(attachFile);
			}
			result = adminConsoleService.modify(consoleVO);
			if(result != 0) {
				adminConsoleService.setState(consoleVO);
				url = "redirect:/admin/console/list";
			}else {
				url = "redirect:/admin/console/modify";
			}
		}else {
			result = adminConsoleService.modify(consoleVO);
			
			if(result != 0) {
				adminConsoleService.setState(consoleVO);
				url = "redirect:/admin/console/list";
			}else {
				url = "redirect:/admin/console/modify";
			}
		}
		return url;
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("con_serial")String con_serial)throws Exception{
		int result =adminConsoleService.delete(con_serial);
		String url = null;
		
		if(result != 0) {
			url = "redirect:/admin/console/list";
		}else {
			url = "redirect:/admin/console/delete_ng";
		}
		return url;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
