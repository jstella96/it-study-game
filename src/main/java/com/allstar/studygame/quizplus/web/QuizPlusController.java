package com.allstar.studygame.quizplus.web;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allstar.studygame.quizplus.service.QuizCategoryService;
import com.allstar.studygame.quizplus.service.QuizPlusService;

@Controller
@RequestMapping("/quizplus/")
public class QuizPlusController {

	@Resource(name = "quizCategoryService")
	private QuizCategoryService quizCategoryService;

	@Resource(name = "quizPlusService")
	private QuizPlusService quizPlusService;
	
	//1]문제 추가
	@RequestMapping(value = "quiz", method = RequestMethod.POST)
	public String quizPlusProcess(@RequestParam Map map) {
		quizPlusService.inputQuiz(map);
		return "QuizPlus/QuizPlus.game";
	}//QuizPlusProcess()
	

			
	
	//2]문제관리 메인 페이지로 이동
	@RequestMapping(value = "main/page", method = RequestMethod.GET)
	public String moveQuizPlusMainPage() {
		
		return "QuizPlus/QuizPlusMain.game";
	}//moveQuizPlusPage()
	
	//3]문제 추가 페이지로 이동
	@RequestMapping(value = "page", method = RequestMethod.GET)
	public String moveQuizPlusPage() {

		return "QuizPlus/QuizPlus.game";
	}//QuizPlusProcess()
	
	//4]문제 리스트 페이지로 이동  01:긴글 02:짧은글 03:개념완성 
	@RequestMapping(value ="quizs", method = RequestMethod.GET)
	public String moveQuizListPage(@RequestParam Map map,Model model,HttpServletRequest req) {
			map.put("id",req.getSession().getAttribute("memberId"));
			List<Map> categoryList = quizCategoryService.getQuizCategorys(map);
			String gamecode = map.get("gamecode").toString();
			/*아래 정보들 저장*/
			model.addAttribute("gamecode",map.get("gamecode"));
			model.addAttribute("gamename",gamecode.equals("1") ? "긴 글 연습" : gamecode.equals("2") ? "짧은 글 연습":"개념 완성" );
			model.addAttribute("categoryList",categoryList);
			
			return "QuizPlus/QuizList.game";

	}//moveQuizListPage()
	
	
	
	//문제 삭제
	//3]문제 카테고리 바꾸기
	@RequestMapping(value="change",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getQuizListAjax(@RequestParam Map map) {
	
		/*JSONArray의 정적 메소드인 toJSONString(List계열 컬렉션) 사용*/
		List<Map> quizList= quizPlusService.getQuizs(map);

		return JSONArray.toJSONString(quizList);
	}


	//문제 삭제
	@RequestMapping(value = "quiz/delete", method = RequestMethod.GET)
	public String quizDelete(@RequestParam Map map) {
		 quizPlusService.deleteQuiz(map);
		return  "forward:/quizplus/quizs";
	}//QuizDelete()
	
}
