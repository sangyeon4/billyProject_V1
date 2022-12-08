package com.billy.main;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.billy.Service.IF_billyMemberService;
import com.billy.Service.IF_billyService;
import com.billy.VO.BillyGoodsVO;
import com.billy.VO.BillyMemberVO;
import com.billy.util.FileDataUtil1;

@Controller
public class billyController {
   
   @Inject      // 나 서비스 주입
   private IF_billyService bsrv;

   @Inject      // 나 서비스 주입
   private IF_billyMemberService bmsv;
   

   @Inject
   private FileDataUtil1 fileDataUtil1;

   @RequestMapping(value = "/joinForm", method = RequestMethod.GET)
   public String joinForm(Locale locale, Model model) {
      
      return "billy/joinForm";
   }
   
   @RequestMapping(value = "/joinAction", method = RequestMethod.POST)
   public String joinAction(Locale locale, Model model,BillyMemberVO bmvo, MultipartFile[] file) throws Exception{
      //객체로 받을 때는 파라미터 이름과 객체의 변수의 이름이 일치하고  getter,setter가 있어야한다.>>자동매핑
      System.out.println(bmvo.getName()+"---디버깅용도");
      
      bmsv.insertMember(bmvo);
      return "redirect:/home";
   }
    
   @RequestMapping(value = "/idChk", method = RequestMethod.POST)
      @ResponseBody
      public String idChk(Locale locale, Model model,@RequestParam("id") String id) throws Exception {
        System.out.println(id);         
         int result = bmsv.chkId(id);
         if(result != 0) {            
            return "fail";   // 중복 아이디가 존재            
         } else {            
            return "success";   // 중복 아이디 x            
         }
      }
   
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public String login(Locale locale, Model model) throws Exception{
      
      return "billy/login";
   }
   

   @RequestMapping(value = "/billyForm", method = RequestMethod.GET)
   public String billyForm(Locale locale, Model model) throws Exception {
      int billyGnum=bsrv.selectMaxCnt();
      model.addAttribute("billyGnum", billyGnum);
      System.out.println(billyGnum+"--글번호 컨트롤러단 디버깅");//등록된 글중 마지막번호에서 +1
      return "billy/billyForm";
   }

   @RequestMapping(value = "/billeyAction", method = RequestMethod.POST)
   public String billeyAction(Locale locale, Model model, BillyGoodsVO bvo, MultipartFile[] file) throws Exception{
      //객체로 받을 때는 파라미터 이름과 객체의 변수의 이름이 일치하고  getter,setter가 있어야한다.>>자동매핑
      System.out.println(bvo.getgEndDate()+"---디버깅용도"); 
      System.out.println(bvo.getId());
      bvo.setgLoc(bvo.getSido1()+"/"+bvo.getGugun1());
      System.out.println(bvo.getgLoc());
      System.out.println(bvo.getCateNum());
      System.out.println(bvo.getgPrice());
      String[] fileNames = fileDataUtil1.fileUpload(file);
      bvo.setFiles(fileNames);
      bsrv.insertBilly(bvo);         
//      return "redirect:/billyViewAll";
      return "billy/login";
   }

   
   @RequestMapping(value = "/billyViewAll", method = RequestMethod.GET)
   public String billyViewAll(Locale locale, Model model) {
	  List<BillyGoodsVO> bList=bsrv.selectBillyAll();
	  System.out.println(bList+"----컨트롤러단 빌리전체보기 디버깅");
	  model.addAttribute("bList",bList);	  
      return "billy/billyViewAll";
   }
   
   @RequestMapping(value = "/member", method = RequestMethod.GET)
   public String member(Locale locale, Model model) {

      return "billy/member";
   }
}