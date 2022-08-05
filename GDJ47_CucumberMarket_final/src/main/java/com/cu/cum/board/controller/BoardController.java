package com.cu.cum.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class BoardController {

	@GetMapping("/board/boardlist.do")
	public ModelAndView boardlist(ModelAndView mv) {
		mv.setViewName("board/boardList");
		return mv;
	}
	
}
