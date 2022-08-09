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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.board.model.service.BoardService;
import com.cu.cum.board.model.vo.Board;
import com.cu.cum.board.model.vo.RecommendList;
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
		mv.addObject("boards",boards);
		System.out.println(boards.size());
		String url = request.getRequestURI();
		int totalboardcount = service.selectboardCount();
		mv.addObject("pageBar", TestPageBar.getPageBar(cPage, numPerpage, totalboardcount, url));
		System.out.println(boards);
		mv.setViewName("board/boardList");
		return mv;
	}
	@GetMapping("/boardlist.do/{categoryname}")
	public ModelAndView boardlist2(@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage,HttpServletRequest request
			,@PathVariable String categoryname,ModelAndView mv) {
		if(categoryname.equals("실종센터")) {
			categoryname="동네 분실/실종센터";
		}
		System.out.println(categoryname);
		Map page = Map.of("cPage",cPage,"numPerpage",numPerpage,"categoryname",categoryname);
		
		List<Board> boards = service.selectBoardList2(page);
		mv.addObject("boards",boards);
		System.out.println(boards.size());
		String url = request.getRequestURI();
		int totalboardcount = service.selectboardCount2();
		mv.addObject("pageBar", TestPageBar.getPageBar(cPage, numPerpage, totalboardcount, url));
		System.out.println(boards);
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
	
	
	@GetMapping("/boardRecommend.do/{boardId}")
	@ResponseBody
	public ModelAndView boardRecommend(@PathVariable int boardId,ModelAndView mv) {
		String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
		RecommendList r = RecommendList.builder().recBoardId(boardId).recUserId(userid).build();
		System.out.println(boardId);
		System.out.println(r);
		Board b2 = service.selectBoard(boardId);
		int recommend;
		if(userid.equals(b2.getUserId())) {
			System.out.println("본인게시물");
			//게시물 추천개수 센후
			int count = service.recommendIdcount(boardId);
			//게시물 추천카운트에삽입
			Board b = Board.builder().boardId(boardId).recommendCount(count).build();
			service.updateBoard(b);
	
			mv.addObject("msg","본인게시물엔 추천할수없습니다.");
			mv.addObject("loc", "board/boardlist.do");
			mv.setViewName("common/msg");
			return mv;
			
		}else {
			int result = service.recommendCheck(r);
			if(result>=1) {
				System.out.println("이미추천");
				//게시물 추천개수 센후
				int count = service.recommendIdcount(boardId);
				//게시물 추천카운트에삽입
				Board b = Board.builder().boardId(boardId).recommendCount(count).build();
				service.updateBoard(b);
				
				mv.addObject("msg","이미 추천한 게시물입니다.");
				mv.addObject("loc", "board/boardlist.do");
				mv.setViewName("common/msg");
				return mv;
			}else{
				service.recommendboard(r);
				//게시물 추천개수 센후
				int count = service.recommendIdcount(boardId);
				//게시물 추천카운트에삽입
				Board b = Board.builder().boardId(boardId).recommendCount(count).build();
				service.updateBoard(b);
				mv.addObject("msg","추천하였습니다.");
				mv.addObject("loc", "board/boardlist.do");
				mv.setViewName("common/msg");
				return mv;
			}
			
		}
		
		
		
	}
	
}
