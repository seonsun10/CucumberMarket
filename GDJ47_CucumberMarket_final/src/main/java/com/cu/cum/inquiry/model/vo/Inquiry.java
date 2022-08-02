package com.cu.cum.inquiry.model.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import com.cu.cum.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@SequenceGenerator(name="seq_inquiryno", sequenceName="seq_inquiryno")
public class Inquiry {
	@Id
	@GeneratedValue(generator = "seq_inquiryno", strategy= GenerationType.SEQUENCE)
	private int inquiryNo;
	
	@ManyToOne
	@JoinColumn(name="userid")
	private Member writer;  // 작성자 아이디
	
	private String inquiryType;  // 문의 유형
	private String inquiryPhone; // 전화번호
	private String inquiryTitle;  // 제목
	private String inquiryContent;  // 내용
	
	@Column(name="inquiryDate")
	private Date inquiryDate;  // 작성일
	
	@Column(columnDefinition = "default n")
	private String answer;  // 답변 여부
	

}
