package com.billy.VO;

public class BillyGoodsVO {
   private String id; 
   private int gNum; 
   private String gTitle; 
   private int cateNum; 
   private String gName; 
   private String sido1; //시
   private String gugun1; //군구
   private String gLoc;   //시+군구 (주소)
   private String gStrDate; //시작일
   private String gEndDate; //종료일
   private int gPrice; 
   private String gText;
   private String[] files;   //파일이름 (배열)
   
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