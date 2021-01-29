package com.allstar.studygame.game.dao;

import java.util.List;
import java.util.Map;

import com.allstar.studygame.game.dto.LongWordDTO;

public interface LongWordDAO {
	
	
	List<Map> selectLongWordQuizList(Map map);
	
	/*문제 타이핑 속도 관련*/ 
	 void insertAvgTypingSpeed(Map map);


}
