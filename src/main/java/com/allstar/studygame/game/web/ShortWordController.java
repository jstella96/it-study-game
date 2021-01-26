package com.allstar.studygame.game.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allstar.studygame.game.service.ShortWordService;

@Controller
@RequestMapping("/shortword/")
public class ShortWordController {

		@Resource(name="shortWordService")
		private ShortWordService shortWordService;

		//짧은글페이지 이동
		@RequestMapping(value = "page", method = RequestMethod.GET)
		public String moveShortPagepage() {
			
			return "Game/ShortWord.game";
		}//moveShortWordpage()
}
