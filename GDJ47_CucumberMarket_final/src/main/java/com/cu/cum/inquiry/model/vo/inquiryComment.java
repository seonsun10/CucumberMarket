package com.cu.cum.inquiry.model.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.cu.cum.member.model.vo.Member;

public class inquiryComment {
	
	// 답글 VO 클래스
	
//	@Id
//	@GeneratedValue(generator = "seq_inquiryComment_no", strategy = GenerationType.SEQUENCE)
//	private int inquiryComment_No;  // 답글 번호
//	  
//	@ManyToOne
//	@JoinColumn(name="userid")
//	private Member userId;  // 답글 작성자 -> admin(관리자)으로 한정 
//	
//	private String inquiryComment_Title; // 답글 제목 -> 원글 제목에 [답글] 추가
//
//	@Column(columnDefinition = "varchar2(50) default 1 not null ")
//	private String inquiryComment_Level; // 원글 ... 깊이..?
//	private String inquiryComment_Content;  // 답글 내용 
//	private int inquiry_Ref; // 원글번호 레퍼런스참조 
//	  
//	@Column(name="inquiryDate", columnDefinition = "date default sysdate not null " )
//	@Temporal(TemporalType.DATE)
//	private Date inquiryComment_Date;  // 작성일
	

}