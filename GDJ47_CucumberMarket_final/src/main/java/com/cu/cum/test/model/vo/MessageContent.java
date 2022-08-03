package com.cu.cum.test.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class MessageContent {
	private int messageId;
	private String roomId;

	private String massage;
	private String userid;
	
	private int unReadCount;
	private int sessionCount;
	private Date createdate;
	private Date senddate;
}
