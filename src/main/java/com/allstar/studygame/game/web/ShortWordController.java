package com.allstar.studygame.game.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.allstar.studygame.game.service.ShortWordService;

@Controller
@RequestMapping("/shortword/")
public class ShortWordController {

		@Resource(name="shortWordService")
		private ShortWordService shortWordService;

		//짧은글페이지 이동
		@RequestMapping(value = "page", method = RequestMethod.GET)
		public String moveShortPagepage(@RequestParam Map map, Model model,HttpServletRequest req) {
			List<Map> quizList =shortWordService.getQuizs(map);
			model.addAttribute("quizList",quizList);
			System.out.println(quizList.size());
			return "Game/ShortWord.game";
		}//moveShortWordpage()
}
