package com.cu.cum.report.model.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
@SequenceGenerator(name="seq_repno", sequenceName="seq_repno",allocationSize = 1)
public class Report {
	@Id
	@GeneratedValue(generator="seq_reportno", strategy=GenerationType.SEQUENCE)
	private int repNo;
	
	@ManyToOne
	@JoinColumn(name="userid")
	private Member userId; // 신고한 사람아이디 
	
	private int proNo; // 상품 아이디 
	private String repContent; // 신고 내용
	private String repTitle; // 제목 
	private String repType; // 신고 유형
	
	@Column(name="writeDate", columnDefinition = "date default sysdate not null " )
	@Temporal(TemporalType.DATE)
	private Date repDate; // 신고날짜 
	
	private String targetId; // 신고 당한 사람아이디 
	
	
	@PrePersist
	public void perpersist() {
		this.repDate=this.repDate==null?new Date():this.repDate;
	}
	

}
