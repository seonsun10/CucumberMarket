package com.cu.cum.alert.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Alert {

	private String n_id;
	private String n_target;
	private String n_type;
	private String n_time;
	private String n_content;
	private String n_checked;
	private String n_url;
	private String n_editor;
	private String n_editdate;
	private String userId;


	
	
	
}