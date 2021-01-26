package com.allstar.studygame.game.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.game.dao.ShortWordDAO;
import com.allstar.studygame.game.dto.ShortWordDTO;
import com.allstar.studygame.game.service.ShortWordService;


@Service("shortWordService")
public class ShortWordServiceImpl implements ShortWordService {
	
	@Resource(name="shortWordDAO")
	private ShortWordDAO dao;

	@Override
	public List<ShortWordDTO> getQuizs(Map map) {
		
		return dao.selectShortWordQuizList(map);
	}
}
