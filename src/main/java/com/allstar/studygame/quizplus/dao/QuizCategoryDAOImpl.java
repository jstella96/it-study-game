package com.allstar.studygame.quizplus.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository("quizCategoryDAO")
public class QuizCategoryDAOImpl implements QuizCategoryDAO{

	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate sqlMapper; 
	
	@Override
	public List<Map> selectQuizCategoryList(Map map) {
		// TODO Auto-generated method stub
		
		return sqlMapper.selectList("selectQuizCategoryList",map);
	}

	@Override
	public void insertQuizCategory(Map map) {
		
		sqlMapper.insert("insertQuizCategory",map);
		
	}


	@Override
	public void deleteQuizCategory(Map map) {
		
		sqlMapper.delete("deleteQuizCategory",map);
		
	}

}
