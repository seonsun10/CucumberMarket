package com.cu.cum.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardComment {
	

		private int boardCommentNo;
		private int boardCommentLevel;
		private String boardCommentWriter;
		private int boardRef;
		private int boardCommentRef;
		private String boardCommentContent;
		private Date boardCommentDate;

	
}
