package com.cu.cum.wishlist.model.vo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Product;
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
@SequenceGenerator(name="seq_wishno" , sequenceName="seq_wishno" , allocationSize = 1)
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
public class WishList {
	
	@Id
	@GeneratedValue(generator = "seq_wishno" , strategy = GenerationType.SEQUENCE)
	private int wishId;
	
	@ManyToOne
	@JoinColumn(name="userId")
	private Member member;
	
	@OneToOne
	@JoinColumn(name="proNo")
	private Product product;
	
	@Temporal(TemporalType.DATE)
	private Date createDate;
	
	@PrePersist
	public void prePersist(){
        this.createDate = new Date();
    }
}
