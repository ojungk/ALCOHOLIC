package com.smhrd.model;

public class mixDTO {
	private int mix_idx;
	private int ct_idx;
	private int ingre_idx;
	private int mix_amount;
	public int getMix_idx() {
		return mix_idx;
	}
	public void setMix_idx(int mix_idx) {
		this.mix_idx = mix_idx;
	}
	public int getCt_idx() {
		return ct_idx;
	}
	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}
	public int getIngre_idx() {
		return ingre_idx;
	}
	public void setIngre_idx(int ingre_idx) {
		this.ingre_idx = ingre_idx;
	}
	public int getMix_amount() {
		return mix_amount;
	}
	public void setMix_amount(int mix_amount) {
		this.mix_amount = mix_amount;
	}
	public mixDTO(int mix_idx, int ct_idx, int ingre_idx, int mix_amount) {
		super();
		this.mix_idx = mix_idx;
		this.ct_idx = ct_idx;
		this.ingre_idx = ingre_idx;
		this.mix_amount = mix_amount;
	}
	public mixDTO() {
		super();
	}
	
}
