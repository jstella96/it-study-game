package com.allstar.studygame.game.service;

import java.util.List;
import java.util.Map;

import com.allstar.studygame.game.dto.LongWordDTO;

public interface LongWordService {

	//퀴즈 리스트 얻기
	List<Map> getQuizs(Map map);
	
	//타이핑 스피드
	void inputAvgTypingSpeed(Map map);	
	
	String getTargetTypingSpeed(String id);
	
	
	//기록페이지용 평균속도리스트 얻기
	List<Map> getAvgTypingSpeedList(String id);

}
