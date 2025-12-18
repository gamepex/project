package com.gamepex.admin.gametitle;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gamepex.share.ConsoleVO;
import com.gamepex.share.GameTitleVO;

@Service
public class AdminGameTitleService {
	
	@Inject
	private AdminGameTitleDAO adminGameTitleDAO;
	
	
	public int register(GameTitleVO gameTitleVO) throws Exception{
		return adminGameTitleDAO.register(gameTitleVO);
	}
	public List<GameTitleVO> getGameTitleList() throws Exception{
		return adminGameTitleDAO.getGameTitleList();
	}
	public List<GameTitleVO> getUnableList() throws Exception{
		return adminGameTitleDAO.getUnableList();
	}
	@Transactional
	public void setState(GameTitleVO gameTitleVO) throws Exception{
		adminGameTitleDAO.setState(gameTitleVO);
		adminGameTitleDAO.unable_Rental(gameTitleVO);
	}
	public GameTitleVO getGameTitleOne(String ttl_serial) throws Exception{
		return adminGameTitleDAO.getGameTitleOne(ttl_serial);
	}
	public int modify(GameTitleVO gameTitleVO) throws Exception{
		return adminGameTitleDAO.modify(gameTitleVO);
	}
	
	public int delete(String ttl_serial)throws Exception{
		return adminGameTitleDAO.delete(ttl_serial);
	}
}
