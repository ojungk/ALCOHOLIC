package com.smhrd.model;

public class user_recipeDTO {
	private int recipe_idx;
	private int ingre_idx;
	private int recipe_amount;
	private int user_ct_idx;
	public int getRecipe_idx() {
		return recipe_idx;
	}
	public void setRecipe_idx(int recipe_idx) {
		this.recipe_idx = recipe_idx;
	}
	public int getIngre_idx() {
		return ingre_idx;
	}
	public void setIngre_idx(int ingre_idx) {
		this.ingre_idx = ingre_idx;
	}
	public int getRecipe_amount() {
		return recipe_amount;
	}
	public void setRecipe_amount(int recipe_amount) {
		this.recipe_amount = recipe_amount;
	}
	public int getUser_ct_idx() {
		return user_ct_idx;
	}
	public void setUser_ct_idx(int user_ct_idx) {
		this.user_ct_idx = user_ct_idx;
	}
	public user_recipeDTO(int recipe_idx, int ingre_idx, int recipe_amount, int user_ct_idx) {
		super();
		this.recipe_idx = recipe_idx;
		this.ingre_idx = ingre_idx;
		this.recipe_amount = recipe_amount;
		this.user_ct_idx = user_ct_idx;
	}
	public user_recipeDTO() {
		super();
	}
	
}
