package com.allstar.studygame.game.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.game.dao.InterviewDAO;
import com.allstar.studygame.game.dto.InterviewDTO;
import com.allstar.studygame.game.service.InterviewService;

@Service("interviewService")
public class InterviewServiceImpl implements InterviewService{
	
	@Resource(name="interviewDAO")
	private InterviewDAO dao;

	@Override
	public List<Map> getQuizs(Map map) {
		List<Map> list =  dao.selectInterviewQuizList(map);
		System.out.println(list.size());
		//40개 미만일 때 반복해서 값을 넣어준다.
		if(list.size() < 10 && 0 < list.size()){
			List<Map> repeatList = new Vector<Map>();
			while(repeatList.size() < 10) {
				for(Map repeatmap : list) {
					repeatList.add(repeatmap);
					if (repeatList.size() == 10) {
						break;
					}//if()
				}//for()
			}//while()

			return repeatList;
			
		}else {
			
			return dao.selectInterviewQuizList(map);
		}
	
	}// getQuizs()
}
