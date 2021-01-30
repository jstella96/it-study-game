package com.allstar.studygame.game.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.allstar.studygame.game.dao.ShortWordDAO;
import com.allstar.studygame.game.dto.ShortWordDTO;

@Repository("shortWordDAO")
public class ShortWordDAOImpl implements ShortWordDAO{
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<Map> selectShortWordQuizList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectShortWordQuizList",map);
	}
	
}
