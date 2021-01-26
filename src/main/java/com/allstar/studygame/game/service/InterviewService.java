package com.allstar.studygame.game.service;

import java.util.List;
import java.util.Map;

import com.allstar.studygame.game.dto.InterviewDTO;

public interface InterviewService {
	
	//퀴즈 리스트 얻기
	List<InterviewDTO> getQuizs(Map map);
}
