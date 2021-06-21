package com.Tblog;

public class subheadingSizeDTO {
	private int subheading_num;
	private int count;
	
	public subheadingSizeDTO() {
		
	}
	
	public subheadingSizeDTO(int subheading_num, int count) {
		this.subheading_num = subheading_num;
		this.count = count;
	}
	public int getSubheading_num() {
		return subheading_num;
	}
	public void setSubheading_num(int subheading_num) {
		this.subheading_num = subheading_num;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
