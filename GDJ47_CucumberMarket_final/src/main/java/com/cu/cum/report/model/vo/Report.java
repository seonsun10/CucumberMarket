package com.cu.cum.report.model.vo;

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
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@SequenceGenerator(name="seq_reportno", sequenceName="seq_reportname")
public class Report {
	@Id
	@GeneratedValue(generator="seq_reportno", strategy=GenerationType.SEQUENCE)
	private int reportNo;
	
	@ManyToOne
	@JoinColumn(name="userid")
	private Member userId; // 신고한 사람아이디 
	
	private int proNo; // 상품 아이디 
	private String content; // 신고 내용
	private String title; // 제목 
	@Column(columnDefinition = "default sysdate")
	private Date writeDate; // 신고날짜 
	private String targetId; // 신고 당한 사람아이디 
	

}
