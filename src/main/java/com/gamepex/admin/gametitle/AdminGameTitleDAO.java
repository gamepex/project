package com.gamepex.admin.gametitle;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gamepex.share.GameTitleVO;

@Repository
public class AdminGameTitleDAO {

	@Inject
	private SqlSession sqlSession;
	
	private String namespace = "com.gamepex.mappers.admin.gametitle";
	
	public int register(GameTitleVO gameTitleVO) {
		return sqlSession.insert(namespace + ".register",gameTitleVO);
	}
	public List<GameTitleVO> getGameTitleList() throws Exception{
		return sqlSession.selectList(namespace + ".getGameTitleList");
	}
	public List<GameTitleVO> getUnableList() throws Exception{
		return sqlSession.selectList(namespace + ".getUnableList");
	}
	public void setState(GameTitleVO gameTitleVO) throws Exception{
		sqlSession.update(namespace + ".setState",gameTitleVO);
	}
	public void unable_Rental(GameTitleVO gameTitleVO) throws Exception{
		sqlSession.update(namespace + ".unable_Rental",gameTitleVO);
	}
	public GameTitleVO getGameTitleOne(String ttl_serial) throws Exception{
		return sqlSession.selectOne(namespace+".getGameTitleOne",ttl_serial);
	}
	public int modify(GameTitleVO gameTitleVO)throws Exception{
		return sqlSession.update(namespace + ".modify",gameTitleVO);
	}
	public int delete(String ttl_serial) throws Exception{
		return sqlSession.delete(namespace+ ".delete",ttl_serial);
	}
}
