package com.cu.cum.product.model.vo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@SequenceGenerator(name="seq_reviewno", sequenceName = "seq_reviewno", allocationSize = 1)
public class Review implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3690049655744253815L;
	@Id
	@GeneratedValue
	private int reviewNo;
	
	@OneToOne
	@JoinColumn(name = "proNo")
	private Product product; //상품 번호
	
	private String writer; //후기작성자(거래자)
	private String host; //상품 판매자
	@Temporal(TemporalType.DATE)
	@Column(columnDefinition = "date default sysdate")
	private Date writeDate;
	private int oi; //평점 1~5
}
