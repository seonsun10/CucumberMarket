package com.cu.cum.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.board.model.service.BoardService;
import com.cu.cum.board.model.vo.Board;
import com.cu.cum.member.model.vo.Member;
import com.cu.cum.pagebar.PageBar;
import com.cu.cum.pagebar.PageBarBasic;
import com.cu.cum.pagebar.TestPageBar;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;
	
	
	@GetMapping("/boardlist.do")
	public ModelAndView boardlist(@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage,HttpServletRequest request
			,ModelAndView mv) {
		
		Map page = Map.of("cPage",cPage,"numPerpage",numPerpage);
		
		List<Board> boards = service.selectBoardList(page);
		System.out.println(boards.size());
		String url = request.getRequestURI();
		int totalboardcount = service.selectboardCount();
		mv.addObject("pageBar", PageBarBasic.getPageBar(cPage, numPerpage, totalboardcount, url));
		System.out.println(boards);
		mv.addObject("boards",boards);
		mv.setViewName("board/boardList");
		return mv;
	}
	@GetMapping("/boardWrite.do")
	public ModelAndView boardWrite(ModelAndView mv) {
		mv.setViewName("board/boardWrite");
		return mv;
		
	}
	@PostMapping("/saveBoard.do")
	@ResponseBody
	public ModelAndView insertBoard(ModelAndView mv,Board b) {
		int result =service.insertBoard(b);
		if(result>0) {
			mv.addObject("msg", "게시글 작성완료");
			mv.addObject("loc","board/boardlist.do");
			
		}else {
			mv.addObject("msg", "게시글 작성실패");
			mv.addObject("loc","board/boardWirte.do");
		}
		mv.setViewName("common/msg");
		return mv;
	}
	@RequestMapping("/boardinfo.do/{boardId}")
	public ModelAndView boardinfo(ModelAndView mv,@PathVariable int boardId) {
		System.out.println(boardId);
		Board b = service.selectBoard(boardId);
		mv.addObject("board", b);
		mv.setViewName("board/boardinfo");
		return mv;
	}
	
}
