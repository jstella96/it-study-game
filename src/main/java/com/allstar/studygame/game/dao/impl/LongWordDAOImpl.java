package com.allstar.studygame.game.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.allstar.studygame.game.dao.LongWordDAO;
import com.allstar.studygame.game.dto.LongWordDTO;

@Repository("longWordDAO")
public class LongWordDAOImpl implements LongWordDAO {
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<LongWordDTO> selectLongWordQuizList(Map map) {
		
		return sqlMapper.selectList("selectLongWordQuizList",map);
	}

	@Override
	public void insertAvgTypingSpeed(Map map) {
		
		sqlMapper.insert("insertAvgTypingSpeed", map);
	}

}
