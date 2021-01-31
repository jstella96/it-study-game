package com.allstar.studygame.member.dao;

import java.util.List;
import java.util.Map;

public interface DefaultQuizDAO {

	//기본제공 카테고리 리스트 
	List<Map> selectDefaultQuizCategoryList();
	//기본제공 문제 리스트 (카테고리 번호)
	List<Map> selectDefaultQuizList(int defaultCategoryNo);
	
	 void insertDefaultQuiz(Map quizMap);
	 int insertDefaultQuizCategory(Map quizCategoryMap);
	
}
