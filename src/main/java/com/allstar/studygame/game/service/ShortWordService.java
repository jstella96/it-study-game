package com.allstar.studygame.game.service;

import java.util.List;
import java.util.Map;

import com.allstar.studygame.game.dto.ShortWordDTO;

public interface ShortWordService {
	
	//퀴즈 리스트 얻기
	List<Map> getQuizs(Map map);
}
