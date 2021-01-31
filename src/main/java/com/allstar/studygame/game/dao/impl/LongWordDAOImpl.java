package com.allstar.studygame.game.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.allstar.studygame.game.dao.LongWordDAO;


@Repository("longWordDAO")
public class LongWordDAOImpl implements LongWordDAO {
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<Map> selectLongWordQuizList(Map map) {
		
		return sqlMapper.selectList("selectLongWordQuizList",map);
	}

	@Override
	public void insertAvgTypingSpeed(Map map) {
		
		sqlMapper.insert("insertAvgTypingSpeed", map);
	}

	@Override
	public String selectTargetTypingSpeed(String id) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("selectTargetTypingSpeed",id);
	}

	@Override
	public List<Map> selectAvgTypingSpeedList(String id) {
		// TODO Auto-generated method stub
		
		return sqlMapper.selectList("selectAvgTypingSpeedList",id);
	}

}
