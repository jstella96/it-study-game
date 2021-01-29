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

import com.allstar.studygame.game.service.LongWordService;


@Controller
@RequestMapping("/longword/")
public class LongWordController {
	
	@Resource(name="longWordService")
	private LongWordService longWordService;

	//긴글게임페이지 이동
	@RequestMapping(value = "page", method = RequestMethod.GET)
	public String moveLongWordpage(@RequestParam Map map, Model model) {
		
		List<Map> quizList =longWordService.getQuizs(map);
		System.out.println(quizList.size());
		model.addAttribute("quizList",quizList);
		model.addAttribute("targetTypingSpeed",400);
		return "Game/LongWord.game";
	}//moveLongWordpage()
	
}
