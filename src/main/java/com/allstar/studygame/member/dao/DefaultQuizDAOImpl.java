package com.allstar.studygame.member.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("defaultQuizDAO")
public class DefaultQuizDAOImpl implements DefaultQuizDAO{

	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate sqlMapper; 
	
	
	@Override
	public List<Map> selectDefaultQuizCategoryList() {
		
		return sqlMapper.selectList("selectDefaultQuizCategoryList");
	}

	@Override
	public List<Map> selectDefaultQuizList(int defaultCategoryNo) {

		return sqlMapper.selectList("selectDefaultQuizList", defaultCategoryNo);
	}

	@Override
	public void insertDefaultQuiz(Map quizMap) {
		
		sqlMapper.insert("insertDefaultQuiz", quizMap);
	}

	@Override
	public int insertDefaultQuizCategory(Map quizCategoryMap) {
		
		sqlMapper.insert("insertDefaultQuizCategory", quizCategoryMap);
		//System.out.println("testNo"+(int)quizCategoryMap.get("categoryNo"));
		
		return (int)quizCategoryMap.get("categoryNo");
	}

}
