package com.billy.VO;

public class BillyMemberVO {

	private String id;
	private String pwd;
	private String pwdChk;
	private String tel;
	private String name;
	private String loc;
	private String email;
	//private String photoName;
	private String pwdQuiz;
	private String pwdAnswer;
	
	public String getPwdChk() {
		return pwdChk;
	}
	public void setPwdChk(String pwdChk) {
		this.pwdChk = pwdChk;
	}
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	
	/*
	 * public String getPhotoName() { return photoName; }
	 * 
	 * public void setPhotoName(String photoName) { this.photoName = photoName; }
	 */
	
	public String getPwdQuiz() {
		return pwdQuiz;
	}
	public void setPwdQuiz(String pwdQuiz) {
		this.pwdQuiz = pwdQuiz;
	}
	public String getPwdAnswer() {
		return pwdAnswer;
	}
	public void setPwdAnswer(String pwdAnswer) {
		this.pwdAnswer = pwdAnswer;
	}
	
	
}
