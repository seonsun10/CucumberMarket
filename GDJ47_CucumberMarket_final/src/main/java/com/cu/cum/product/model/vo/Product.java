package com.cu.cum.product.model.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
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
	
	@Column(name="category_id")
	private String categoryName; //카테고리아이디
	
	private String proName; //상품이름
	
	
	private String proStatus; //중고상품=y , 새상품=n
	
	private int price; //가격
	
	@Column(columnDefinition = "default 0")
	private int proCount; //조회수
	
	private String proContent; //상품설명
	
	@Temporal(TemporalType.DATE)
	@Column(columnDefinition = "default sysdate")
	private Date enrollDate; // 상품 작성일(등록일자)
	
	@Column(columnDefinition = "varchar2(10) default 'y'")
	private String solveStatus; //y=판매중 , n=판매완료
	
	private String region; //거래지역
	
//	@ManyToMany(cascade = CascadeType.ALL)
//	@JoinColumn(name="products")
//	private List<Member> members = new ArrayList(); //판매자 아이디
	
	@ManyToOne()
	@JoinColumn(name="userId")
	private Member member; //판매자 아이디
	
	
}
