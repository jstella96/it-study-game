package com.allstar.studygame.member.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.allstar.studygame.member.dao.DefaultQuizDAO;
import com.allstar.studygame.member.dao.MemberDAO;
import com.allstar.studygame.member.service.MemberSignService;

@Service("memberSignService")
public class MemberSignServiceImpl implements MemberSignService{

	@Resource(name="memberDAO")
	private MemberDAO dao;
	
	@Resource(name="defaultQuizDAO")
	private DefaultQuizDAO defaultQuizDao;
	
	@Override
	public boolean isIdDuplicate(String id) {
		//count 함수로 0 or 1 받아온다
		int checkResult = dao.selectMemberId(id);
		
		return checkResult== 0 ? true : false;
	}

	@Override
	public boolean isNicknameDuplicate(String nickname) {
		//count 함수로 0 or 1 받아온다
		int checkResult = dao.selectMemberNickName(nickname);
				
		return checkResult== 0 ? true : false;
	}

	@Override
	public void inputMember(Map map) {
		/*멤버가입 처리와 동시에, 기본문제 제공*/
		dao.insertMember(map);
		/*1. 기본제공 카테고리 가져온다*/
		List<Map> quizCategoryList = defaultQuizDao.selectDefaultQuizCategoryList();
		/*2. 기본제공 카테고리 한개씩*/

		for(Map quizCategoryMap : quizCategoryList) {
			//]한개의 기본제공 카테고리에 들어가있는 ,기본제공quizList받아오기
			int gamecode=(int)quizCategoryMap.get("game_code");
			int defaultCategoryNo = (int)quizCategoryMap.get("default_quiz_category_no");
			List<Map> quizList = defaultQuizDao.selectDefaultQuizList(defaultCategoryNo);
			//System.out.println("defaultCategoryNo"+defaultCategoryNo);
			//System.out.println("quizList SIze"+quizList.size());
			//]아이디 추가 후
			quizCategoryMap.put("id",map.get("id").toString());
			//]카테고리에 insert 그 후 입력된 primary NO값 받기.
			int categoryNo  = defaultQuizDao.insertDefaultQuizCategory(quizCategoryMap);
			//]위에 퀴즈 리스트 한개씩 넣어준다
			for(Map quizMap : quizList){ 
				quizMap.put("gamecode",gamecode);
				quizMap.put("categoryNo",categoryNo);
				defaultQuizDao.insertDefaultQuiz(quizMap);
			}
			
		}
		
		/*1. 기본제공 카테고리 가져온다*/
	}

}
