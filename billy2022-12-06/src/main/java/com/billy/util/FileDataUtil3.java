package com.billy.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileDataUtil3 {
	//BillyMember 첨부파일
   
	//확장자 저 3개만 가능하게 하겠다고 정의한거임. 
	//허용하는 확장자 정의를 한 것.(실제 실습에서는 사용하지 않겠습니다~)
   private ArrayList<String> extNameArray = new ArrayList<String>() 
   {
      {
         add("gif");
         add("jpg");
         add("png");
      }
   };   //<-- 현재 코드에서는 활용하지않는다. 선언만 했을뿐, 동작하지 않는다. 절대 미리 예측금지!!! 
   
   //첨부파일 업로드 경로 변수값으로 가져옴 servlet-context.xml
   @Resource(name="uploadPath3")
   private String uploadPath3;
   
   public String getuploadPath3() {
      return uploadPath3;
   }

   public void setuploadPath3(String uploadPath3) {
      this.uploadPath3 = uploadPath3;
   }
   /**
    * 게시물 상세보기에서 첨부파일 다운로드 메서드 구현(공통)
    */
   @RequestMapping(value="/download3", method=RequestMethod.GET)
   @ResponseBody  //어떤 데이터를 body에 포함하여 전송하고자할때 씀. view 지정하지않고 바로 클라이언트요청으로 응답/
   public FileSystemResource fileDownload(@RequestParam("filename") String fileName, HttpServletResponse response) {
      File file = new File(uploadPath3 + "/" + fileName);
      response.setContentType("application/download3; utf-8");
      response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
      return new FileSystemResource(file);
   }
   
   /**
    * 파일 업로드 메서드(공통)
    * @throws IOException 
    */
   public String fileUpload(MultipartFile file) throws IOException {
	   //String[] files = new String[file.length];
	   String files = null;
	   //for(int i = 0 ; i < file.length ; i++) {
		  if(file.getOriginalFilename()!="") {	//실제 file객체가 존재한다면
			  String originalName = file.getOriginalFilename();//확장자를 가져오기위해 전체 파일명을 가져옴
		      UUID uid = UUID.randomUUID();//랜덤문자 구하기(같은파일명가진 파일을 다르게 저장하기 위해)
		      String saveName = uid.toString() + "." + originalName.split("\\.")[1];//한글 파일명 처리 때문에...  
		      //String[] files = new String[] {saveName};//형변환 files[0]에 파일명이 들어간다.
		      byte[] fileData = file.getBytes();
		      File target = new File(uploadPath3, saveName);
		      FileCopyUtils.copy(fileData, target);	// /tmp로 카피했다
		      files=saveName; 
		  }		  
	  //}      
      return files;	//컨트롤러로 넘겨라
   }

   public ArrayList<String> getExtNameArray() {
      return extNameArray;
   }

   public void setExtNameArray(ArrayList<String> extNameArray) {
      this.extNameArray = extNameArray;
   }
}