package com.allstar.studygame.game.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
}
