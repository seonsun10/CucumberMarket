package com.cu.cum.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Board {
	private int boardId;
	private String userId;
	private String boardCategory;
	private String boardTitle;
	private String boardContent;
	private String picName;
	private Date createDate;
	private int recommendCount;
	private int count;
	
}
