package com.smhrd.model;

public class cocDTO {
	private int ct_idx;
	private String ct_eng_name;
	private String ct_kor_name;
	private String ct_recipe;
	private String ct_ingredient;
	private String ct_type;
	private String ct_garnish;
	private String ct_info;
	private String ct_percent;
	private String ct_img;
	public int getCt_idx() {
		return ct_idx;
	}
	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}
	public String getCt_eng_name() {
		return ct_eng_name;
	}
	public void setCt_eng_name(String ct_eng_name) {
		this.ct_eng_name = ct_eng_name;
	}
	public String getCt_kor_name() {
		return ct_kor_name;
	}
	public void setCt_kor_name(String ct_kor_name) {
		this.ct_kor_name = ct_kor_name;
	}
	public String getCt_recipe() {
		return ct_recipe;
	}
	public void setCt_recipe(String ct_recipe) {
		this.ct_recipe = ct_recipe;
	}
	public String getCt_ingredient() {
		return ct_ingredient;
	}
	public void setCt_ingredient(String ct_ingredient) {
		this.ct_ingredient = ct_ingredient;
	}
	public String getCt_type() {
		return ct_type;
	}
	public void setCt_type(String ct_type) {
		this.ct_type = ct_type;
	}
	public String getCt_garnish() {
		return ct_garnish;
	}
	public void setCt_garnish(String ct_garnish) {
		this.ct_garnish = ct_garnish;
	}
	public String getCt_info() {
		return ct_info;
	}
	public void setCt_info(String ct_info) {
		this.ct_info = ct_info;
	}
	public String getCt_percent() {
		return ct_percent;
	}
	public void setCt_percent(String ct_percent) {
		this.ct_percent = ct_percent;
	}
	public String getCt_img() {
		return ct_img;
	}
	public void setCt_img(String ct_img) {
		this.ct_img = ct_img;
	}
	public cocDTO(int ct_idx, String ct_eng_name, String ct_kor_name, String ct_recipe, String ct_ingredient,
			String ct_type, String ct_garnish, String ct_info, String ct_percent, String ct_img) {
		super();
		this.ct_idx = ct_idx;
		this.ct_eng_name = ct_eng_name;
		this.ct_kor_name = ct_kor_name;
		this.ct_recipe = ct_recipe;
		this.ct_ingredient = ct_ingredient;
		this.ct_type = ct_type;
		this.ct_garnish = ct_garnish;
		this.ct_info = ct_info;
		this.ct_percent = ct_percent;
		this.ct_img = ct_img;
	}
	public cocDTO() {
		super();
	}
	
	
	
}
