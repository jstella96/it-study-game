package com.allstar.studygame.game.dao;

import java.util.List;
import java.util.Map;

import com.allstar.studygame.game.dto.InterviewDTO;

public interface InterviewDAO {
	
	/*문제 내는 페이지 때*/
	 List<InterviewDTO> selectInterviewQuizList(Map map);
	 
	/*문제 오답 체크 관련*/ 
	 void insertInterviewMark(Map map);
	 void updateInterviewMark(Map map);
	 void deleteInterviewMark(Map map);
	 
	 List<Map> selectInterviewMarkList(String id);
}
