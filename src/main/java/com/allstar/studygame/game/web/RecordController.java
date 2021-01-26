package com.allstar.studygame.game.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/record/")
public class RecordController {

	@RequestMapping(value = "page", method = RequestMethod.GET)
	public String moveLongWordpage(HttpServletRequest req, Model model) {
		/*Map map = new HashMap();
		map.put("id",req.getSession().getAttribute("memberId").toString());
		longWordService =longWordService.getQuizs(map);
		model.addAttribute("quizList",quizList);*/
		return "Record/Record.game";
	}//moveLongWordpage()
}
