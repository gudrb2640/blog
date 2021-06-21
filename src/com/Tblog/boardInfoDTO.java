package com.Tblog;

import java.sql.Timestamp;


//board.jsp���� ������ ���� 
public class boardInfoDTO {
	// subheading table
	private String subheading; 
	
	//board table
	private int board_num;
	private String title;
	private String content;
	private int subheading_num;
	private Timestamp date;
	private String foname;
	private String frname;
	private int count;
	
	public boardInfoDTO() {

	}
	
	public boardInfoDTO(int subheading_num, String subheading, int board_num, String title, String content, Timestamp date,
			String foname, String frname, int count) {
		this.subheading_num = subheading_num;
		this.subheading = subheading;
		this.board_num = board_num;
		this.title = title;
		this.content = content;
		this.date = date;
		this.foname = foname;
		this.frname = frname;
		this.count = count;
	}
	public String getSubheading() {
		return subheading;
	}
	public void setSubheading(String subheading) {
		this.subheading = subheading;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
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

	public int getSubheading_num() {
		return subheading_num;
	}

	public void setSubheading_num(int subheading_num) {
		this.subheading_num = subheading_num;
	}
	
}
