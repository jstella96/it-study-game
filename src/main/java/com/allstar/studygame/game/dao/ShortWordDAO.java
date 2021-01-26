package com.allstar.studygame.game.dao;

import java.util.List;
import java.util.Map;


import com.allstar.studygame.game.dto.ShortWordDTO;

public interface ShortWordDAO {
	 
	List<ShortWordDTO> selectShortWordQuizList(Map map);
	 
		
}
