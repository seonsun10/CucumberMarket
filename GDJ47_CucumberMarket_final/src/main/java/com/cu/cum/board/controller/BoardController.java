package com.cu.cum.board.controller;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.cu.cum.board.model.vo.BoardComment;
import com.cu.cum.board.model.vo.RecommendList;
import com.cu.cum.board.model.vo.Search;
import com.cu.cum.member.model.vo.Member;
import com.cu.cum.pagebar.PageBar;
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
		String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
		
		String region = service.selectregion(userid);
		System.out.println(region);
		mv.addObject("region", region);
		Map page = Map.of("cPage",cPage,"numPerpage",numPerpage,"region",region);
		List<Board> pboard = service.selectpopularlist(region); 
		
		List<Board> pboardlist = new ArrayList();
		for(Board s:pboard) {
			pboardlist.add(service.selectBoard(s.getBoardId())); 
		}
		mv.addObject("pboard", pboardlist);
		
		
		List<Board> boards = service.selectBoardList(page);
		
		mv.addObject("boards",boards);
		
		String url = request.getRequestURI();
		int totalboardcount = service.selectboardCount(region);
		mv.addObject("pageBar", TestPageBar.getPageBar(cPage, numPerpage, totalboardcount, url));
		
		mv.setViewName("board/boardList");
		return mv;
	}
	@GetMapping("/boardlist.do/{categoryname}")
	public ModelAndView boardlist2(@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage,HttpServletRequest request
			,@PathVariable String categoryname,ModelAndView mv) {
		String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
		
		String region = service.selectregion(userid);
		System.out.println(region);
		mv.addObject("region", region);
		
		if(categoryname.equals("실종센터")) {
			categoryname="동네 분실/실종센터";
		}
		Board b = Board.builder().boardregion(region).boardCategory(categoryname).build();
		
		
		Map page = Map.of("cPage",cPage,"numPerpage",numPerpage,"board",b);
		
		List<Board> boards = service.selectBoardList2(page);
		mv.addObject("boards",boards);
		
		String url = request.getRequestURI();
		int totalboardcount = service.selectboardCount2(page);
		mv.addObject("pageBar", TestPageBar.getPageBar(cPage, numPerpage, totalboardcount, url));
		List<Board> pboard = service.selectpopularlist(region); 
	
		List<Board> pboardlist = new ArrayList();
		for(Board s:pboard) {
			pboardlist.add(service.selectBoard(s.getBoardId())); 
		}
		mv.addObject("pboard", pboardlist);
		
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
		String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
		
		String region = service.selectregion(userid);
		b.setBoardregion(region);
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
	public ModelAndView boardinfo(ModelAndView mv,@PathVariable int boardId,@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage,HttpServletRequest request) {
		
		Board b = service.selectBoard(boardId);
		int count = service.selectBaordRecommendCount(boardId);
		b.setRecommendCount(count);
		mv.addObject("board", b);
		int commentcount;
		Board b1 = service.selectBoard(boardId);
		mv.addObject("board", b1);
		
		//추천누른사람
		List<RecommendList> Rlist= service.selectRecommendList(boardId);
		mv.addObject("Rlist",Rlist);
		
		String url = request.getRequestURI();
		try {
			
			commentcount = service.selectcommentcount(boardId);
			numPerpage=10;
			mv.addObject("count", commentcount);
			mv.addObject("pageBar", TestPageBar.getPageBar(cPage,
					  numPerpage,commentcount,url));
			
			
			
		}catch(NullPointerException e) {
			mv.addObject("count", 0);
		}
		Map page = Map.of("cPage",cPage,"numPerpage",numPerpage,"boardId",boardId);
		List<BoardComment> list = service.selectBoardComment(page);
		
		  
		 
		mv.addObject("comments",list);
		
		
	
		
		
		mv.setViewName("board/boardinfo");
		return mv;
	}
	
	
	@GetMapping("/boardRecommend.do/{boardId}")
	@ResponseBody
	public ModelAndView boardRecommend(@PathVariable int boardId,ModelAndView mv,HttpServletRequest request) {
		String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
		RecommendList r = RecommendList.builder().rec_BoardId(boardId).rec_UserId(userid).build();
		System.out.println(r.getRec_UserId()+r.getRec_BoardId());
		System.out.println(boardId);
		
		Board b2 = service.selectBoard(boardId);
		int recommend;
		if(userid.equals(b2.getUserId())) {
			System.out.println("본인게시물");
			//게시물 추천개수 센후
			int count = service.recommendIdcount(boardId);
			//게시물 추천카운트에삽입
			Board b = Board.builder().boardId(boardId).recommendCount(count).build();
			service.updateBoard(b);
			String url =request.getRequestURI();
			System.out.println(url);
			if(url.equals("/board/boardRecommend.do/"+boardId)) {
				url="board/boardinfo.do/"+boardId;
			}
	
			mv.addObject("msg","본인게시물엔 추천할수없습니다.");
			mv.addObject("loc", url);
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
	@PostMapping(value="/insertboardcomment.do")
	public ModelAndView insertBoardComment(BoardComment b,ModelAndView mv) {
		int result  = service.insertBoardComment(b);
		String msg = result>0?"댓글등록":"댓글등록실패";
		mv.addObject("msg",msg);
		mv.addObject("loc","board/boardinfo.do/"+b.getBoardRef());
		mv.setViewName("common/msg");
		return mv;
	}
	
	
 
    @GetMapping("/deletecomment/{id}/{no}")
    public ModelAndView deleteComment(@PathVariable int id,@PathVariable int no,ModelAndView mv) {
    	int result = service.deletecomment(id);
    	String msg = result>0?"댓글삭제":"댓글삭제실패";
    	mv.addObject("msg",msg);
		mv.addObject("loc","board/boardinfo.do/"+no);
		mv.setViewName("common/msg");
    	return mv;
    }
  
    @GetMapping("/deletecomment2/{id}/{no}")
    public ModelAndView deleteComment2(@PathVariable int id,@PathVariable int no,ModelAndView mv) {
    	int result = service.deletecomment2(id);
    	String msg = result>0?"댓글삭제":"댓글삭제실패";
    	mv.addObject("msg",msg);
		mv.addObject("loc","board/boardinfo.do/"+no);
		mv.setViewName("common/msg");
    	return mv;
    }
    
    
    @RequestMapping("/bsearch/{type}/{keyword}")
    public ModelAndView searchBoard(@PathVariable String type,@PathVariable String keyword,ModelAndView mv,@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage,HttpServletRequest request) {
    	String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
    	
    	String region = service.selectregion(userid);
    	Search s = Search.builder().type(type)
    			.keyword(keyword).region(region).build();
    	Map page = Map.of("cPage",cPage,"numPerpage",numPerpage,"search",s);
    	String url =request.getRequestURI();
		List<Board> boards = service.searchBoardList(page);
		System.out.println("테스트"+boards);
		int totalcount = service.searchBoardCount(page);
		System.out.println(totalcount);
		mv.addObject("pageBar", TestPageBar.getPageBar(cPage, numPerpage, totalcount, url));
				
				
		List<Board> pboard = service.selectpopularlist(region); 
		
		List<Board> pboardlist = new ArrayList();
		for(Board s2:pboard) {
			pboardlist.add(service.selectBoard(s2.getBoardId())); 
		}
		mv.addObject("pboard", pboardlist);
		mv.addObject("boards",boards);
		mv.setViewName("board/boardList");
    	return mv;
    	
    	
    }
    
    
    
    
    
    
    
    
    
    
    
}
