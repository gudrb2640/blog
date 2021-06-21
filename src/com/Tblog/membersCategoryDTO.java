package com.Tblog;

public class membersCategoryDTO {
	int category_num;
	int member_num;
	String category;
	
	
	public membersCategoryDTO() {
	}
	
	public membersCategoryDTO(int category_num, int member_num, String category) {
		this.category_num = category_num;
		this.member_num = member_num;
		this.category = category;
	}
	
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	public int getCategory_num() {
		return category_num;
	}

	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}

	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
