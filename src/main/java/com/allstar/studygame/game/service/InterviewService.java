package com.allstar.studygame.game.service;

import java.util.List;
import java.util.Map;

import com.allstar.studygame.game.dto.InterviewDTO;

public interface InterviewService {
	
	//퀴즈 리스트 얻기
	List<Map> getQuizs(Map map);
	
	void inputWrongAnswerNo(Map map);
	//틀린 퀴즈 리스트 얻기
	List<Map> getWrongQuizs(String id);
	
	void deleteWrongQuiz(String quizNo);
}
