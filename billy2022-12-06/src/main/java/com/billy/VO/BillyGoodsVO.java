package com.billy.VO;

public class BillyGoodsVO {
   private String id; //아이디
   private int gNum; //글번호
   private String gTitle; //글 제목
   private int cateNum; //카데고리번호
   private String gName; //상품이름
   private String sido1; //지역이름1
   private String gugun1; //지역이름2
   private String gLoc;   //최종 지역이름
   private String gStrDate; //시작일
   private String gEndDate; //종료일
   private int gPrice; //가격 
   private String gText;
   private String[] files;   //클라이언트로부터 파일을 바로 저장하는것이 아니라, 컨트롤러가 작업해서 세팅한다.
   
   public String[] getFiles() {
      return files;
   }
   public void setFiles(String[] files) {
      this.files = files;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public int getgNum() {
      return gNum;
   }
   public void setgNum(int gNum) {
      this.gNum = gNum;
   }
   public String getgTitle() {
      return gTitle;
   }
   public void setgTitle(String gTitle) {
      this.gTitle = gTitle;
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

   public String getSido1() {
      return sido1;
   }
   public void setSido1(String sido1) {
      this.sido1 = sido1;
   }
   public String getGugun1() {
      return gugun1;
   }
   public void setGugun1(String gugun1) {
      this.gugun1 = gugun1;
   }
   public String getgLoc() {
      return gLoc;
   }
   public void setgLoc(String gLoc) {
      this.gLoc = gLoc;
   }
   public String getgStrDate() {
      return gStrDate;
   }
   public void setgStrDate(String gStrDate) {
      this.gStrDate = gStrDate;
   }
   public String getgStrdate() {
      return gStrDate;
   }
   public void setgStrdate(String gStrdate) {
      this.gStrDate = gStrdate;
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
   
}