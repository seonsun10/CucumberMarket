package com.cu.cum.inquiry.model.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@SequenceGenerator(name="seq_replyinquiryno", sequenceName="seq_replyinquiryno", allocationSize = 1)
public class ReplyInquiry {
	
	// 답글 VO 클래스
	
	@Id
	@GeneratedValue(generator = "seq_replyinquiryno",  strategy = GenerationType.SEQUENCE)
	private int replyinquiryNo;  // 답글 번호
	  
//	@OneToOne
//	@JoinColumn(name="userid")
//	private Member writer;  // 답글 작성자 -> admin(관리자)으로 한정
	private String writer;  // 관리자만 작성할 수 있으니 그냥 String으로 데이터에 저장만 해도 되지 않을까.
	
	private String replyinquiryTitle; // 답글 제목 -> 원글 제목에 '[답글] : ' 추가
	private String replyinquiryContent;  // 답글 내용
	
	@ToString.Exclude
	@OneToOne
	@JoinColumn(name="inquiryNo")
	private Inquiry inquiry; // 원 글번호 레퍼런스참조 
	
	//private int inquiryNo;
	  
	@Column(name="replyDate", columnDefinition = "date default sysdate not null " )
	@Temporal(TemporalType.DATE)
	private Date replyinquiryDate;  // 작성일
	
	
	// 이 설정을 하지 않으면 아무리 not null을 해도 null값이 들어간다. 
	@PrePersist
	public void prepersist() {
		this.replyinquiryDate=this.replyinquiryDate==null?new Date():this.replyinquiryDate;
	}
	

}