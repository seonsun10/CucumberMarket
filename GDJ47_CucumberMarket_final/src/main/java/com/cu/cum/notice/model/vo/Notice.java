package com.cu.cum.notice.model.vo;

import lombok.Data;

@Data
public class Notice {

	String n_id, n_title, n_content, n_time, n_editor, n_editdate;

	public Notice() {
	}
	
	public Notice(String n_title, String n_content) {
		super();
		this.n_title = n_title;
		this.n_content = n_content;
	}
	
	
	public Notice(String n_id, String n_title, String n_content) {
		super();
		this.n_id = n_id;
		this.n_title = n_title;
		this.n_content = n_content;
	}

	/* getter, setter */

	
	public String getN_id() {
		return n_id;
	}

	public String getN_editor() {
		return n_editor;
	}

	public void setN_editor(String n_editor) {
		this.n_editor = n_editor;
	}

	public String getN_editdate() {
		return n_editdate;
	}

	public void setN_editdate(String n_editdate) {
		this.n_editdate = n_editdate;
	}

	public void setN_id(String n_id) {
		this.n_id = n_id;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_time() {
		return n_time;
	}

	public void setN_date(String n_time) {
		this.n_time = n_time;
	}
	
	
}


