package com.allstar.studygame.quizplus.dao;

import java.util.List;
import java.util.Map;

public interface QuizPlusDAO {
	
	 List<Map> selectQuizList(Map map);
	 Map selectQuiz(Map map);
	 
	 void insertQuiz(Map map);
	 void updateQuiz(Map map);
	 void deleteQuiz(Map map);
}
