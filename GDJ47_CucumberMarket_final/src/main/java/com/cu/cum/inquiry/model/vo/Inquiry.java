package com.cu.cum.inquiry.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Inquiry {
	
	private int inquiryNo;
	private String inquiryId;
	private String inquiryType;
	private String inquiryPhone;
	private String inquiryTitle;
	private String inquiryContent;
	private Date inquiryDate;
	private String answer;
	

}
