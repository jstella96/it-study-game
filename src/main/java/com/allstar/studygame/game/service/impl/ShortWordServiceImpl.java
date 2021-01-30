package com.allstar.studygame.game.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.game.dao.ShortWordDAO;
import com.allstar.studygame.game.dto.ShortWordDTO;
import com.allstar.studygame.game.service.ShortWordService;


@Service("shortWordService")
public class ShortWordServiceImpl implements ShortWordService {
	
	@Resource(name="shortWordDAO")
	private ShortWordDAO dao;

	@Override
	public List<Map> getQuizs(Map map) {
		
		List<Map> list = dao.selectShortWordQuizList(map);
		if(list.size() < 40 && 0 < list.size()){
			List<Map> repeatList = new Vector<Map>();
			while(repeatList.size() < 40) {
				for(Map repeatmap : list) {
					repeatList.add(repeatmap);
					if (repeatList.size() == 40) {
						break;
					}//if()
				}//for()
			}//while()

			return repeatList;
			
		}else {
			
			return dao.selectShortWordQuizList(map);
		
		}
	
	}//getQuizs()
}//class()

