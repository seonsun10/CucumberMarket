package com.cu.cum.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardReply {

	 	private String reply_id;
	    private String board_id;
	    private String parent_id;
	    private String depth;
	    private String reply_content;
	    private String reply_writer;
	    private String register_datetime;
}
