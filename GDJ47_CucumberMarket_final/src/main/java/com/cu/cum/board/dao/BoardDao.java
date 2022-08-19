package com.cu.cum.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.cu.cum.board.model.vo.Board;
import com.cu.cum.board.model.vo.BoardComment;
import com.cu.cum.board.model.vo.BoardReply;
import com.cu.cum.board.model.vo.RecommendList;

public interface BoardDao {
	List<Board> selectBoardList(SqlSessionTemplate session,Map page);
	List<Board> selectBoardList2(SqlSessionTemplate session,Map page);
	int insertBoard(SqlSessionTemplate session,Board b);
	Board selectBoard(SqlSessionTemplate session,int BoardId);
	int selectboardCount(SqlSessionTemplate session,String region);
	int selectboardCount2(SqlSessionTemplate session,Map page);
	int recommendCheck(SqlSessionTemplate session,RecommendList r);
	int recommendboard(SqlSessionTemplate session,RecommendList r);
	int recommendIdcount(SqlSessionTemplate session,int BoardId);
	int updateBoard(SqlSessionTemplate session,Board b);
	
	int selectcommentcount(SqlSessionTemplate session,int boardId);
	
	int deletecomment(SqlSessionTemplate session,int id);
	int deletecomment2(SqlSessionTemplate session,int id);
	List<Board> selectpopularlist(SqlSessionTemplate session,String region);
	int selectBaordRecommendCount(SqlSessionTemplate session,int boardId);
	List<RecommendList> selectRecommendList(SqlSessionTemplate session,int boardId);
	
	//댓글
	//
	List<BoardComment> selectBoardComment(SqlSessionTemplate session,Map page);
	int insertBoardComment(SqlSessionTemplate session,BoardComment b);
	List<BoardComment> selectBoardComment(SqlSessionTemplate session,int no);
	int regReply(Map<String, Object> paramMap,SqlSessionTemplate session);
    
    List<BoardReply> getReplyList(int id, SqlSessionTemplate session);
    
    int delReply(Map<String, Object> paramMap,SqlSessionTemplate session);
   
    
    boolean checkReply(Map<String, Object> paramMap,SqlSessionTemplate session);
    
    boolean updateReply(Map<String, Object> paramMap,SqlSessionTemplate session);
	//지역
    String selectregion(SqlSessionTemplate session,String userid);
    
    //검색
    List<Board> searchBoardList(SqlSessionTemplate session,Map page);
    
    int searchBoardCount(SqlSessionTemplate session,Map page);
    //수정삭제
    int deleteboard(SqlSessionTemplate session,int id);
    int updateboard2(SqlSessionTemplate session,Board b);
	
}
