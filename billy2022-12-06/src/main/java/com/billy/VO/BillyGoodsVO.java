package com.billy.VO;

public class BillyGoodsVO {
	private String id;
	private String name; //빌리를 등록한 회원이름
	private int gNum;
	private int cateNum;
	private String gName; //빌리상품명

	private String gLoca; // 시+군구 (주소)
	private String gStrDate; // 시작일
	private String gEndDate; // 종료일
	private int gPrice;
	private String gText;
	private String[] files; // 파일이름 (배열)
	private int gLike_cnt; // 좋아요

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getgNum() {
		return gNum;
	}

	public void setgNum(int gNum) {
		this.gNum = gNum;
	}

	public int getCateNum() {
		return cateNum;
	}

	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String getgLoca() {
		return gLoca;
	}

	public void setgLoca(String gLoca) {
		this.gLoca = gLoca;
	}

	public String getgStrDate() {
		return gStrDate;
	}

	public void setgStrDate(String gStrDate) {
		this.gStrDate = gStrDate;
	}

	public String getgEndDate() {
		return gEndDate;
	}

	public void setgEndDate(String gEndDate) {
		this.gEndDate = gEndDate;
	}

	public int getgPrice() {
		return gPrice;
	}

	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}

	public String getgText() {
		return gText;
	}

	public void setgText(String gText) {
		this.gText = gText;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public int getgLike_cnt() {
		return gLike_cnt;
	}

	public void setgLike_cnt(int gLike_cnt) {
		this.gLike_cnt = gLike_cnt;
	}

}