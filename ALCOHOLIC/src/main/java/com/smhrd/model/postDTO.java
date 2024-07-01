package com.smhrd.model;

public class postDTO {
	private int post_idx;
	private String post_title;
	private String post_content;
	private String post_img;
	private int post_views;
	private String created_at;
	private String user_id;
	public int getPost_idx() {
		return post_idx;
	}
	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_img() {
		return post_img;
	}
	public void setPost_img(String post_img) {
		this.post_img = post_img;
	}
	public int getPost_views() {
		return post_views;
	}
	public void setPost_views(int post_views) {
		this.post_views = post_views;
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
	public postDTO(int post_idx, String post_title, String post_content, String post_img, int post_views,
			String created_at, String user_id) {
		super();
		this.post_idx = post_idx;
		this.post_title = post_title;
		this.post_content = post_content;
		this.post_img = post_img;
		this.post_views = post_views;
		this.created_at = created_at;
		this.user_id = user_id;
	}
	public postDTO() {
		super();
	}
	
	
}
