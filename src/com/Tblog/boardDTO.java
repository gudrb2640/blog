package com.Tblog;

import java.sql.Timestamp;

public class boardDTO {
	private int board_num;
	private int member_num;
	private int subheading_num;
	private String title;
	private String content;
	private Timestamp date;
	private String foname;
	private String frname;
	int count;
	
	
	public boardDTO() {

	}
	public boardDTO(int member_num, int subheading_num, String title, String content, int count) {
		this.member_num = member_num;
		this.subheading_num = subheading_num;
		this.title = title;
		this.content = content;
		this.count = count;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getSubheading_num() {
		return subheading_num;
	}
	public void setSubheading_num(int subheading_num) {
		this.subheading_num = subheading_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getFoname() {
		return foname;
	}
	public void setFoname(String foname) {
		this.foname = foname;
	}
	public String getFrname() {
		return frname;
	}
	public void setFrname(String frname) {
		this.frname = frname;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
