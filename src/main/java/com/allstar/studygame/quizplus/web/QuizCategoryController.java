package com.allstar.studygame.quizplus.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
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
	
	
	//1]문제 카테고리 추가
	@RequestMapping(value = "category", method = RequestMethod.POST)
	public String inputQuizCategory(@RequestParam Map map) {
		
		quizCategoryService.inputQuizCategory(map);
		return "QuizPlus/QuizPlus.game";
	}//

	
	//2]문제 카테고리 삭제
	@RequestMapping(value = "category/delete", method = RequestMethod.POST)
	public String deleteQuizCategory(@RequestParam Map map) {
		
		quizCategoryService.deleteQuizCategory(map);
		return "QuizPlus/QuizPlus.game";
	}//

	//3]문제 카테고리 바꾸기
	@RequestMapping(value="category/change",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String getCategoryListAjax(@RequestParam Map map) {
	
		/*JSONArray의 정적 메소드인 toJSONString(List계열 컬렉션) 사용*/
		List<Map> categoryList= quizCategoryService.getQuizCategorys(map);
		
		
		return JSONArray.toJSONString(categoryList);
	}/////////////////////
}
