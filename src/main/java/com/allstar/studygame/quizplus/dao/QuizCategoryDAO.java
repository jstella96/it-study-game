package com.allstar.studygame.quizplus.dao;

import java.util.List;
import java.util.Map;


public interface QuizCategoryDAO {
	
	
	 List<Map> selectQuizCategoryList(Map map);
	 
	 void insertQuizCategory(Map map);
	 void deleteQuizCategory(Map map);
	

}
