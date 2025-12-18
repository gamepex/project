package com.gamepex.admin.console;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gamepex.share.ConsoleVO;

@Service
public class AdminConsoleService {
	
	@Inject
	private AdminConsoleDAO adminConsoleDAO;
	
	
	public int register(ConsoleVO consoleVO) throws Exception{
		return adminConsoleDAO.register(consoleVO);
	}
	public List<ConsoleVO> getConsoleList() throws Exception{
		return adminConsoleDAO.getConsoleList();
	}
	public List<ConsoleVO> getUnableList() throws Exception{
		return adminConsoleDAO.getUnableList();
	}
	@Transactional
	public void setState(ConsoleVO consoleVO) throws Exception{
		 adminConsoleDAO.setState(consoleVO);
		 adminConsoleDAO.unable_Rental(consoleVO);
	}
	public ConsoleVO getConsoleOne(String con_serial)throws Exception{
		return adminConsoleDAO.getConsoleOne(con_serial);
	}
	public int modify(ConsoleVO consoleVO) throws Exception{
		return adminConsoleDAO.modify(consoleVO);
	}
	
	public int delete(String con_serial)throws Exception{
		return adminConsoleDAO.delete(con_serial);
	}
}
