package com.allstar.studygame.game.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.allstar.studygame.game.dao.LongWordDAO;
import com.allstar.studygame.game.dto.LongWordDTO;
import com.allstar.studygame.game.service.LongWordService;

@Repository("longWordService")
public class LongWordServiceImpl implements LongWordService{

	@Resource(name="longWordDAO")
	private LongWordDAO dao;
	
	public List<LongWordDTO> getQuizs(Map map) {
		
		return dao.selectLongWordQuizList(map);
		
	}

	@Override
	public void inputAvgTypingSpeed(Map map) {
		
		dao.insertAvgTypingSpeed(map);
	}

}
