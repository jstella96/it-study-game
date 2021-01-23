package com.allstar.studygame.quizplus.service;

import java.util.List;
import java.util.Map;

public interface QuizCategoryService {

	//퀴즈 카테고리 리스트 얻기
	List<Map> getQuizCategorys(Map map);
	//퀴즈  카테고리추가
	void inputQuizCategory (Map map);
	//퀴즈  카테고리삭제(내부내용 전체 삭제)
	void deleteQuizCategory (Map map);
	
}
