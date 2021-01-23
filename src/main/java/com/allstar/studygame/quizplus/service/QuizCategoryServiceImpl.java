package com.allstar.studygame.quizplus.service;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.quizplus.dao.QuizCategoryDAO;
@Service("quizCategoryService")
public class QuizCategoryServiceImpl implements QuizCategoryService{
	
	@Resource(name="quizCategoryDAO")
	private QuizCategoryDAO dao;
	
	@Override
	public List<Map> getQuizCategorys(Map map) {
		
		return dao.selectQuizCategoryList(map);
	}

	@Override
	public void inputQuizCategory(Map map) {
		
		dao.insertQuizCategory(map);
		
	}

	@Override
	public void deleteQuizCategory(Map map) {
		
		dao.deleteQuizCategory(map);
		
	}


}
