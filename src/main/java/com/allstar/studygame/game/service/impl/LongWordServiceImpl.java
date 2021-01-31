package com.allstar.studygame.game.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.allstar.studygame.game.dao.LongWordDAO;
import com.allstar.studygame.game.dto.LongWordDTO;
import com.allstar.studygame.game.service.LongWordService;

@Repository("longWordService")
public class LongWordServiceImpl implements LongWordService{

	@Resource(name="longWordDAO")
	private LongWordDAO dao;
	
	public List<Map> getQuizs(Map map) {
		
		List<Map> list =  dao.selectLongWordQuizList(map);
		if(list.size() < 20 && 0 < list.size()){
			List<Map> repeatList = new Vector<Map>();
			while(repeatList.size() < 20) {
				for(Map repeatmap : list) {
					repeatList.add(repeatmap);
					if (repeatList.size() == 20) {
						break;
					}//if()
				}//for()
			}//while()

			return repeatList;
			
		}else {
			
			return dao.selectLongWordQuizList(map);
		}
		

		
	}

	@Override
	public void inputAvgTypingSpeed(Map map) {
		
		dao.insertAvgTypingSpeed(map);
	}

	@Override
	public String getTargetTypingSpeed(String id) {
		
		return dao.selectTargetTypingSpeed(id);
	}

	@Override
	public List<Map> getAvgTypingSpeedList(String id) {
		// TODO Auto-generated method stub
		return dao.selectAvgTypingSpeedList(id);
	}

}
