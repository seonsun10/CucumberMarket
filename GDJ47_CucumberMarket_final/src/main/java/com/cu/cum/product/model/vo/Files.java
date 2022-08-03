package com.cu.cum.product.model.vo;

import javax.persistence.Entity;
import javax.persistence.FetchType;
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

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@SequenceGenerator(name="seq_filesno" , sequenceName="seq_filesno", allocationSize = 1)
public class Files {
	
	@Id
	@GeneratedValue(generator = "seq_filesno" , strategy = GenerationType.SEQUENCE)
	private int filesNo;
	
	@ManyToOne
	@JoinColumn(name="userId") //member
	private Member member;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="proNo")//eager
	private Product product;
	
	
	private String originalFilename;
	
	private String renameFilename;
}
