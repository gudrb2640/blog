package com.Tblog;

public class subheadingDTO {
	int subheading_num;
	int member_num;
	String category;
	String subheading;
	
	
	
	public subheadingDTO() {
	}
	
	public subheadingDTO(int subheading_num, int member_num, String category, String subheading) {
		this.subheading_num = subheading_num;
		this.member_num = member_num;
		this.category= category;
		this.subheading = subheading;
	}

	public int getSubheading_num() {
		return subheading_num;
	}

	public void setSubheading_num(int subheading_num) {
		this.subheading_num = subheading_num;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	public String getSubheading() {
		return subheading;
	}
	public void setSubheading(String subheading) {
		this.subheading = subheading;
	}
	
}
