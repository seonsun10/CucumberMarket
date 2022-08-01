package com.cu.cum.test.model.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatRoom {
	
	private String roomId;//랜덤 채팅방아이디
	private int proNo;//상품아이디
	private String userId;//판매자
	
	private String otherId;//구매자 로그인
	
	private int unReadCount;//
}
