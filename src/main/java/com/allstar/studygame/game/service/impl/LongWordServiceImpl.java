package com.allstar.studygame.game.service.impl;

import java.text.SimpleDateFormat;
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

	//날짜 타입 바꾸기
	@Override
	public List<Map> getAvgTypingSpeedList(String id) {
		List<Map> avgTypingSpeedList = dao.selectAvgTypingSpeedList(id);
		for(Map typingMap : avgTypingSpeedList){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM월 dd일"); 
			String typingDate =  simpleDateFormat.format(typingMap.get("typing_date"));
			typingMap.put("typing_date",typingDate);
		}
		return avgTypingSpeedList;
	}

}
