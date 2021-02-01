package com.allstar.studygame.game.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allstar.studygame.game.service.InterviewService;

@Controller
@RequestMapping("/interview/")
public class InterviewController {

	@Resource(name="interviewService")
	private InterviewService interviewService;

	
	//인텨뷰페이지 이동
	@RequestMapping(value = "page", method = RequestMethod.GET)
	public String moveInterviewpage(@RequestParam Map map, Model model) {
		List<Map> quizList =interviewService.getQuizs(map);
		model.addAttribute("quizList",quizList);
		System.out.println(quizList.size());

		return "Game/Interview.game";
	}
	
	//2]게임이 끝난후 틀린문제를 입력
	@RequestMapping(value="wrongAnswer/ajax",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public void inputWrongAnswerNo(@RequestParam String wrongAnswerNo,HttpServletRequest req) {
		
		Map wrongAnswerMap = new HashMap();
		wrongAnswerMap.put("wrongAnswerNo",wrongAnswerNo);
		wrongAnswerMap.put("id",req.getSession().getAttribute("memberId").toString());
		interviewService.inputWrongAnswerNo(wrongAnswerMap);

	}//inputTypingSpeedAjax()
}
