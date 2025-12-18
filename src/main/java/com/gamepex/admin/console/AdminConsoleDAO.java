package com.gamepex.admin.console;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gamepex.share.ConsoleVO;

@Repository
public class AdminConsoleDAO {

	@Inject
	private SqlSession sqlSession;
	
	private String namespace = "com.gamepex.mappers.admin.console";
	
	public int register(ConsoleVO consoleVO) {
		return sqlSession.insert(namespace + ".register",consoleVO);
	}
	public List<ConsoleVO> getConsoleList() throws Exception{
		return sqlSession.selectList(namespace + ".getConsoleList");
	}
	public List<ConsoleVO> getUnableList() throws Exception{
		return sqlSession.selectList(namespace + ".getUnableList");
	}
	public void setState(ConsoleVO consoleVO) throws Exception{
		sqlSession.update(namespace + ".setState",consoleVO);
	}
	public void unable_Rental(ConsoleVO consoleVO) throws Exception{
		sqlSession.update(namespace + ".unable_Rental",consoleVO);
	}
	public ConsoleVO getConsoleOne(String con_serial) throws Exception{
		return sqlSession.selectOne(namespace+".getConsoleOne",con_serial);
	}
	public int modify(ConsoleVO consoleVO)throws Exception{
		return sqlSession.update(namespace + ".modify",consoleVO);
	}
	public int delete(String con_serial) throws Exception{
		return sqlSession.delete(namespace+ ".delete",con_serial);
	}
}
