package com.cu.cum.board.model.service;

import java.util.List;
import java.util.Map;

import com.cu.cum.board.model.vo.Board;

public interface BoardService {
	List<Board> selectBoardList(Map page);
	int insertBoard(Board b);
	Board selectBoard(int boardId);
	int selectboardCount();
}
