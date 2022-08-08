package com.cu.cum.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.board.model.service.BoardService;
import com.cu.cum.board.model.vo.Board;

@Controller

public class BoardController {
	@Autowired
	private BoardService service;
	
	
	@GetMapping("/board/boardlist.do")
	public ModelAndView boardlist(ModelAndView mv) {
		List<Board> boards = service.selectBoardList();
		System.out.println(boards);
		mv.addObject("boards",boards);
		mv.setViewName("board/boardList");
		return mv;
	}
	
}
