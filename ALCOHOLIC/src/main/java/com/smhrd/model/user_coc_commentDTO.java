package com.smhrd.model;

public class user_coc_commentDTO {
	private int cmt_idx;
	private int user_ct_idx;
	private String cmt_content;
	private String created_at;
	private String user_id;
	public int getCmt_idx() {
		return cmt_idx;
	}
	public void setCmt_idx(int cmt_idx) {
		this.cmt_idx = cmt_idx;
	}
	public int getUser_ct_idx() {
		return user_ct_idx;
	}
	public void setUser_ct_idx(int user_ct_idx) {
		this.user_ct_idx = user_ct_idx;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public user_coc_commentDTO(int cmt_idx, int user_ct_idx, String cmt_content, String created_at, String user_id) {
		super();
		this.cmt_idx = cmt_idx;
		this.user_ct_idx = user_ct_idx;
		this.cmt_content = cmt_content;
		this.created_at = created_at;
		this.user_id = user_id;
	}
	public user_coc_commentDTO() {
		super();
	}
	
}
