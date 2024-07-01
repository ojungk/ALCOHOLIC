package com.smhrd.model;

public class pickDTO {
	private int pick_idx;
	private String user_id;
	private int ct_idx;
	private String created_at;
	public int getPick_idx() {
		return pick_idx;
	}
	public void setPick_idx(int pick_idx) {
		this.pick_idx = pick_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCt_idx() {
		return ct_idx;
	}
	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public pickDTO(int pick_idx, String user_id, int ct_idx, String created_at) {
		super();
		this.pick_idx = pick_idx;
		this.user_id = user_id;
		this.ct_idx = ct_idx;
		this.created_at = created_at;
	}
	public pickDTO() {
		super();
	}
	
}
