package com.allstar.studygame.quizplus.web;


import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.allstar.studygame.quizplus.service.QuizCategoryService;
import com.allstar.studygame.quizplus.service.QuizPlusService;

@Controller
@RequestMapping("/quizplus/")
public class QuizPlusController {

	@Resource(name = "quizCategoryService")
	private QuizCategoryService quizCategoryService;

	@Resource(name = "quizPlusService")
	private QuizPlusService quizPlusService;
	
	//문제관리 페이지로 이동
	@RequestMapping(value = "main/page", method = RequestMethod.GET)
	public String moveQuizPlusPage(HttpServletRequest req, Model model) {
		
		return "QuizPlus/QuizPlusMain.game";
	}//moveMypage()
	
	//문제 추가
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String QuizPlusProcess(HttpServletRequest req, Model model) {
		
		return "QuizPlus/QuizPlus.game";
	}//moveMypage()
		
	//문제 추가 페이지로 이동  01:긴글 02:짧은글 03:개념원리 
	@RequestMapping(value ="/page", method = RequestMethod.GET)
	public String moveQuizListPage(@RequestParam Map map, HttpServletRequest req, Model model) {
		if(map.get("gamecode").equals("1")) {
			
			return "QuizPlus/LongWordQuizPlus.game";
			
		}else if(map.get("gamecode").equals("2")) {
			
			return "QuizPlus/ShortWordQuizPlus.game";
			
		}else if(map.get("gamecode").equals("3")) {
			
			return "QuizPlus/InterviewQuizPlus.game";
			
		}else {
			
			return "QuizPlus/QuizPlus.game";
		}
		
	}//moveQuizListPage()
	
	//문제 삭제
	@RequestMapping(value = "list/delete", method = RequestMethod.GET)
	public String QuizDelete(HttpServletRequest req, Model model) {
		
		return  "redirect:/quizplus/page?";
	}//moveMypage()
	
}
