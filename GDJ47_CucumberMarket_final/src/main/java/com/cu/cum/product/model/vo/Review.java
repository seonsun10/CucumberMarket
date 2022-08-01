package com.cu.cum.product.model.vo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Review implements Serializable{
	@Id
	@GeneratedValue
	private int proNo; //상품 번호
	private String writer; //후기작성자(거래자)
	private Date writeDate;
	private int oi; //평점 1~5
}
