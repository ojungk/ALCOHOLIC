package com.smhrd.model;

public class user_coc_likeDTO {
	private int user_like_idx;
	private String user_id;
	private int user_ct_idx;
	private String created_at;
	public int getUser_like_idx() {
		return user_like_idx;
	}
	public void setUser_like_idx(int user_like_idx) {
		this.user_like_idx = user_like_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getUser_ct_idx() {
		return user_ct_idx;
	}
	public void setUser_ct_idx(int user_ct_idx) {
		this.user_ct_idx = user_ct_idx;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public user_coc_likeDTO(int user_like_idx, String user_id, int user_ct_idx, String created_at) {
		super();
		this.user_like_idx = user_like_idx;
		this.user_id = user_id;
		this.user_ct_idx = user_ct_idx;
		this.created_at = created_at;
	}
	public user_coc_likeDTO() {
		super();
	}
	
}
