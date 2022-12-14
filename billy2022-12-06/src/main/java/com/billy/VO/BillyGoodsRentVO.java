package com.billy.VO;

public class BillyGoodsRentVO {
	String id; //빌린사람의 id
	String gNum; //대여한 글
	String tIndate; //대여한 날짜들
	int tPrice; //총 가격
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getgNum() {
		return gNum;
	}
	public void setgNum(String gNum) {
		this.gNum = gNum;
	}
	public String gettIndate() {
		return tIndate;
	}
	public void settIndate(String tIndate) {
		this.tIndate = tIndate;
	}
	public int gettPrice() {
		return tPrice;
	}
	public void settPrice(int tPrice) {
		this.tPrice = tPrice;
	}
	
	
	

}
