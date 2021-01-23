package com.allstar.studygame.quizplus.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
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
public class QuizCategoryController {
	
	@Resource(name = "quizCategoryService")
	private QuizCategoryService quizCategoryService;

	@Resource(name = "quizPlusService")
	private QuizPlusService quizPlusService;
	
	//문제관리 페이지로 이동
	@RequestMapping(value = "category", method = RequestMethod.POST)
	public String inputQuizCategory(@RequestParam Map map, HttpServletRequest req, Model model) {
		
		quizCategoryService.inputQuizCategory(map);
		
		return "QuizPlus/QuizPlus.game";
	}//
	//문제관리 페이지로 이동
	@RequestMapping(value = "category", method = RequestMethod.POST)
	public String deleteQuizCategory(@RequestParam Map map, HttpServletRequest req, Model model) {
		
		
		return "QuizPlus/QuizPlus.game";
	}//
	
	@RequestMapping(value="/category/change",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxCourse(@RequestParam String course) {
		JSONObject obj = new JSONObject();
		switch(course) {
			case "java":
				obj.put("j01", "자바");
				obj.put("j02", "JSP");
				obj.put("j03", "스프링");
				break;
			case "dotnet":
				obj.put("d01", "C#");
				obj.put("d02", "ASP.NET");
				obj.put("d03", "WPF4");				
				break;
			default:
				obj.put("i01", "라즈베리 파이");
				obj.put("i02", "파이썬");				
		}
		return obj.toJSONString();
	}/////////////////////
}
