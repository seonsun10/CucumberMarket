package com.cu.cum.product.model.vo;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.cu.cum.member.model.vo.Member;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@SequenceGenerator(name="seq_prono" , sequenceName="seq_prono")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
public class Product {
	
	@Id
	@GeneratedValue(generator = "seq_prono" , strategy = GenerationType.SEQUENCE)
	private int proNo;
	
	private String categoryId;
	
	private String proName;
	
	private String proStatus; //s급=s a급=a b급=b c급=c d급=d
	
	private int price;
	
	private int proCount;
	
	private String proContent;
	
	@Temporal(TemporalType.DATE)
	private Date enrollDate; // 상품 작성일(등록일자)
	
	private String solveStatus; //y=판매중 , n=판매완료
	
	@ManyToOne
	@JoinColumn(name="userId")
	private Member member; //판매자 아이디
	
	
	
	
	
	
	
	
	//n(상품):1(회원) product에선 ManyToOne member에선 OneToMany
}
