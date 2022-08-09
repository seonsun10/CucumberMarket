package com.cu.cum.inquiry.model.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.cu.cum.member.model.vo.Member;


//@Data
//@Builder
//@AllArgsConstructor
//@NoArgsConstructor
//@Entity
//@SequenceGenerator(name="seq_replyinquiryno", sequenceName="seq_replyinquiryno", allocationSize = 1)
public class ReplyInquiry {
	
	// 답글 VO 클래스
	
//	@Id
//	@GeneratedValue(generator = "seq_replyinquiryno",  strategy = GenerationType.SEQUENCE)
//	private int replyinquiryNo;  // 답글 번호
//	  
//	@OneToOne
//	@JoinColumn(name="userid")
//	private Member writer;  // 답글 작성자 -> admin(관리자)으로 한정 
//	
//	private String replyinquiryTitle; // 답글 제목 -> 원글 제목에 [답글] 추가
//	private String replyinquiryContent;  // 답글 내용
//	
//	@OneToOne
//	@JoinColumn(name="inquiryNo")
//	private Inquiry inquiryNo; // 원 글번호 레퍼런스참조 
//	  
//	@Column(name="inquiryDate", columnDefinition = "date default sysdate not null " )
//	@Temporal(TemporalType.DATE)
//	private Date replyinquiryDate;  // 작성일
	

}