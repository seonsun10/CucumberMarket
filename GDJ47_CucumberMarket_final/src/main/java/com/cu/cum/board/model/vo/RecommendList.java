package com.cu.cum.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class RecommendList {
	private String rec_UserId;
	private int rec_BoardId;

}
