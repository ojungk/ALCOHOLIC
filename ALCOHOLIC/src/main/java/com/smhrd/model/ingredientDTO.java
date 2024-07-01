package com.smhrd.model;

public class ingredientDTO {
	private int ingre_idx;
	private String ingre_name;
	private String ingre_e_name;
	private String ingre_type;
	private String ingre_info;
	private String ingre_img;
	public int getIngre_idx() {
		return ingre_idx;
	}
	public void setIngre_idx(int ingre_idx) {
		this.ingre_idx = ingre_idx;
	}
	public String getIngre_name() {
		return ingre_name;
	}
	public void setIngre_name(String ingre_name) {
		this.ingre_name = ingre_name;
	}
	public String getIngre_e_name() {
		return ingre_e_name;
	}
	public void setInger_e_name(String inger_e_name) {
		this.ingre_e_name = inger_e_name;
	}
	public String getIngre_type() {
		return ingre_type;
	}
	public void setIngre_type(String ingre_type) {
		this.ingre_type = ingre_type;
	}
	public String getIngre_info() {
		return ingre_info;
	}
	public void setIngre_info(String ingre_info) {
		this.ingre_info = ingre_info;
	}
	public String getIngre_img() {
		return ingre_img;
	}
	public void setIngre_img(String ingre_img) {
		this.ingre_img = ingre_img;
	}
	public ingredientDTO(int ingre_idx, String ingre_name, String ingre_e_name, String ingre_type, String ingre_info,
			String ingre_img) {
		super();
		this.ingre_idx = ingre_idx;
		this.ingre_name = ingre_name;
		this.ingre_e_name = ingre_e_name;
		this.ingre_type = ingre_type;
		this.ingre_info = ingre_info;
		this.ingre_img = ingre_img;
	}
	public ingredientDTO() {
		super();
	}
	
}
