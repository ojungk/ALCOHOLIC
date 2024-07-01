package com.smhrd.model;

public class usercocDTO {
	private int user_ct_idx;
	private String user_id;
	private String user_cocktail_name;
	private String user_cocktail_img;
	private String user_cocktail_ing;
	private String user_cocktail_rsp;
	private String user_cocktail_title;
	private String user_cocktail_at;
	private String user_cocktail_content;
	public int getUser_ct_idx() {
		return user_ct_idx;
	}
	public void setUser_ct_idx(int user_ct_idx) {
		this.user_ct_idx = user_ct_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_cocktail_name() {
		return user_cocktail_name;
	}
	public void setUser_cocktail_name(String user_cocktail_name) {
		this.user_cocktail_name = user_cocktail_name;
	}
	public String getUser_cocktail_img() {
		return user_cocktail_img;
	}
	public void setUser_cocktail_img(String user_cocktail_img) {
		this.user_cocktail_img = user_cocktail_img;
	}
	public String getUser_cocktail_ing() {
		return user_cocktail_ing;
	}
	public void setUser_cocktail_ing(String user_cocktail_ing) {
		this.user_cocktail_ing = user_cocktail_ing;
	}
	public String getUser_cocktail_rsp() {
		return user_cocktail_rsp;
	}
	public void setUser_cocktail_rsp(String user_cocktail_rsp) {
		this.user_cocktail_rsp = user_cocktail_rsp;
	}
	public String getUser_cocktail_title() {
		return user_cocktail_title;
	}
	public void setUser_cocktail_title(String user_cocktail_title) {
		this.user_cocktail_title = user_cocktail_title;
	}
	public String getUser_cocktail_at() {
		return user_cocktail_at;
	}
	public void setUser_cocktail_at(String user_cocktail_at) {
		this.user_cocktail_at = user_cocktail_at;
	}
	public String getUser_cocktail_content() {
		return user_cocktail_content;
	}
	public void setUser_cocktail_content(String user_cocktail_content) {
		this.user_cocktail_content = user_cocktail_content;
	}
	public usercocDTO(int user_ct_idx, String user_id, String user_cocktail_name, String user_cocktail_img,
			String user_cocktail_ing, String user_cocktail_rsp, String user_cocktail_title, String user_cocktail_at,
			String user_cocktail_content) {
		super();
		this.user_ct_idx = user_ct_idx;
		this.user_id = user_id;
		this.user_cocktail_name = user_cocktail_name;
		this.user_cocktail_img = user_cocktail_img;
		this.user_cocktail_ing = user_cocktail_ing;
		this.user_cocktail_rsp = user_cocktail_rsp;
		this.user_cocktail_title = user_cocktail_title;
		this.user_cocktail_at = user_cocktail_at;
		this.user_cocktail_content = user_cocktail_content;
	}
	public usercocDTO() {
		super();
	}
	
	
}
