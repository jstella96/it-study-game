package com.allstar.studygame.quizplus.service;

import java.util.List;
import java.util.Map;

public interface QuizPlusService {

	/*map에 저장된 정보를 읽어서 알맞은 테이블에서 서비스를 처리한다.*/
	//퀴즈 리스트 얻기
	List<Map> getQuizs(Map map);
	//퀴즈 한개 정보 얻기
	Map getQuiz(Map map);
	//퀴즈 추가
	void inputQuiz (Map map);
	//퀴즈 수정
	void modifyQuiz (Map map);
	//퀴즈 삭제
	void deleteQuiz (Map map);

}
