package com.cu.cum.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.cum.board.model.vo.Board;
import com.cu.cum.board.model.vo.BoardComment;
import com.cu.cum.board.model.vo.BoardReply;
import com.cu.cum.board.model.vo.RecommendList;
import com.cu.cum.board.model.vo.Search;
@Repository
public class BoardDaoImpl implements BoardDao {

	@Override
	public List<Board> selectBoardList(SqlSessionTemplate session,Map page) {
		int cPage = (int)page.get("cPage");
		int numPerpage = (int)page.get("numPerpage");
		String region = (String)page.get("region");
		
		
		return session.selectList("board.selectboardlist",region,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	@Override
	public List<Board> selectBoardList2(SqlSessionTemplate session,Map page) {
		int cPage = (int)page.get("cPage");
		int numPerpage = (int)page.get("numPerpage");
		Board b = (Board)page.get("board");
		
		return session.selectList("board.selectboardlist2",b,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	@Override
	public int insertBoard(SqlSessionTemplate session,Board b) {
		return session.insert("board.insertboard", b);
	}
	@Override
	public Board selectBoard(SqlSessionTemplate session,int boardId) {
		return session.selectOne("board.selectboard",boardId);
	}
	@Override
	public int selectboardCount(SqlSessionTemplate session,String region) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectboardcount",region);
	}
	
	@Override
	public int selectboardCount2(SqlSessionTemplate session,Map page) {
		// TODO Auto-generated method stub
		Board b = (Board)page.get("board");
		return session.selectOne("board.selectboardcount2",b);
	}
	@Override
	public int recommendCheck(SqlSessionTemplate session, RecommendList r) {
		// TODO Auto-generated method stub
		return session.selectOne("board.recommendcheck",r);
	}
	@Override
	public int recommendboard(SqlSessionTemplate session, RecommendList r) {
		// TODO Auto-generated method stub
		return session.insert("board.recommendboard",r);
	}
	@Override
	public int recommendIdcount(SqlSessionTemplate session, int BoardId) {
		// TODO Auto-generated method stub
		return session.selectOne("board.recommendidcount",BoardId);
	}
	@Override
	public int updateBoard(SqlSessionTemplate session, Board b) {
		// TODO Auto-generated method stub
		return session.update("board.updateboard",b);
	}
	
	
	//댓글
	@Override
	public int regReply(Map<String, Object> paramMap, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("board.insertBoardReply",paramMap);
	}
	@Override
	public List<BoardReply> getReplyList(int id, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectBoardReplyList",id);
	}
	@Override
	public int delReply(Map<String, Object> paramMap, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		if(paramMap.get("r_type").equals("main")) {
            //부모부터 하위 다 지움
            return session.delete("board.deleteBoardReplyAll", paramMap);
        }else {
            //자기 자신만 지움
            return session.delete("board.deleteBoardReply", paramMap);
        }
	}
	@Override
	public boolean checkReply(Map<String, Object> paramMap, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		int result=session.selectOne("board.selectReplyPassword",paramMap);
		if(result>0) {
			return true;
		}else return false;
		
		
	}
	@Override
	public boolean updateReply(Map<String, Object> paramMap, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		int result = session.update("board.updateReply",paramMap);
		return false;
	}
	@Override
	public int insertBoardComment(SqlSessionTemplate session, BoardComment b) {
		// TODO Auto-generated method stub
		return session.insert("board.insertboardcomment",b);
	}
	@Override
	public List<BoardComment> selectBoardComment(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectboardcommentlist",no);
	}
	@Override
	public int selectcommentcount(SqlSessionTemplate session, int boardId) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectcommentcount",boardId);
	}
	@Override
	public int deletecomment(SqlSessionTemplate session, int id) {
		// TODO Auto-generated method stub
		return session.delete("board.deletecomment",id);
	}
	@Override
	public int deletecomment2(SqlSessionTemplate session, int id) {
		// TODO Auto-generated method stub
		return session.delete("board.deletecomment2",id);
	}
	@Override
	public List<BoardComment> selectBoardComment(SqlSessionTemplate session, Map page) {
		// TODO Auto-generated method stub
		int cPage = (int)page.get("cPage");
		int numPerpage = (int)page.get("numPerpage");
		int boardId = (int)page.get("boardId");
		return session.selectList("board.selectboardcommentlist2", boardId, new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	@Override
	public List<Board> selectpopularlist(SqlSessionTemplate session,String region) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectpopularlist",region);
	}
	@Override
	public int selectBaordRecommendCount(SqlSessionTemplate session, int boardId) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectBaordRecommendCount",boardId);
	}
	@Override
	public List<RecommendList> selectRecommendList(SqlSessionTemplate session, int boardId) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectRecommendList",boardId);
	}
	@Override
	public String selectregion(SqlSessionTemplate session, String userid) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectregion",userid);
	}
	@Override
	public List<Board> searchBoardList(SqlSessionTemplate session, Map page) {
		// TODO Auto-generated method stub
		Search s  = (Search)page.get("search");
		int cPage = (int)page.get("cPage");
		int numPerpage = (int)page.get("numPerpage");
		return session.selectList("board.searchboardlist",s,new RowBounds((cPage-1)*numPerpage, numPerpage));
	}
	@Override
	public int searchBoardCount(SqlSessionTemplate session, Map page) {
		// TODO Auto-generated method stub
		Search s  = (Search)page.get("search");
		return session.selectOne("board.searchboardcount",s);
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
