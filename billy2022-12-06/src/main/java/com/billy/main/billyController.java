package com.billy.main;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.billy.Service.IF_billyService;
import com.billy.VO.BillyGoodsAttachVO;
import com.billy.VO.BillyGoodsLikeVO;
import com.billy.VO.BillyGoodsRentVO;
import com.billy.VO.BillyGoodsVO;
import com.billy.util.FileDataUtil1;

@Controller
public class billyController {

	@Inject // 서비스인터페이스 객체 주입
	private IF_billyService bsrv;	
	

	@Inject // 파일저장, 로드를 위한 객체 주입
	private FileDataUtil1 fileDataUtil1;

	@RequestMapping(value = "/billyForm", method = RequestMethod.GET) 
	public String billyForm(Locale locale, Model model) throws Exception {
		int billyGnum = bsrv.selectMaxCnt();
		model.addAttribute("billyGnum", billyGnum);
		System.out.println(billyGnum + "--billyForm 컨트롤러단 디버깅");
		return "billy/billyForm";
	}

	@RequestMapping(value = "/billeyAction", method = RequestMethod.POST)
	public String billeyAction(Locale locale, Model model, BillyGoodsVO bvo, MultipartFile[] file) throws Exception {			
		String[] fileNames = fileDataUtil1.fileUpload(file); //파일이름을 String[]에 넣는 작업
		bvo.setFiles(fileNames); //vo에넣기
		bsrv.insertBilly(bvo);
		System.out.println(bvo.getgEndDate() + "---billeyAction 디버깅용도");		
		return "redirect:/home";
	}

	@RequestMapping(value = "/billyViewAll", method = RequestMethod.GET) 
	public String billyViewAll(Locale locale, Model model) throws Exception {
		List<BillyGoodsVO> bList = bsrv.selectBillyAll();
		System.out.println(bList.get(0).getgName() + "----컨트롤러단 billyViewAll 디버깅");
		model.addAttribute("bList", bList);
		return "billy/billyViewAll";
	}

	@RequestMapping(value = "/billyViewOne", method = RequestMethod.GET) 
	public String billyViewOne(Locale locale, Model model, @RequestParam("vno") String vno,
			@RequestParam("vid") String vid, MultipartFile[] file) throws Exception {
		BillyGoodsLikeVO blvo = new BillyGoodsLikeVO(); 
		int v = Integer.parseInt(vno);
		blvo.setgNum(v);
		blvo.setId(vid);
		String rDate = bsrv.selectBillyRentdate(vno); // 이미 대여된날짜
		int like = bsrv.selectCntBillyLike(blvo); // 접속한 아이디의 해당글 좋아요 유무		
		BillyGoodsVO bvo = bsrv.selectBillyOne(vno); //해당글의 정보들
		System.out.println(like + "---컨트롤러단 빌리자세히보기(좋아요유무) 디버깅");
		System.out.println(bvo.getgPrice() + "---컨트롤러단 빌리자세히보기 디버깅");
		
		model.addAttribute("like", like);
		model.addAttribute("bvo", bvo);
		model.addAttribute("rDate", rDate);
		return "billy/billyViewOne";
	}

	@RequestMapping(value = "/likeUp", method = RequestMethod.POST)	 
	public void likeUp(Locale locale, Model model, @RequestParam("id") String id, @RequestParam("gNum") int gNum ) throws Exception {
		BillyGoodsLikeVO blvo=new BillyGoodsLikeVO();
		blvo.setgNum(gNum);
		blvo.setId(id);	
		System.out.println(id);
		System.out.println(gNum);
		System.out.println(id+"/"+gNum+"/"+"--컨트롤러단 likeUp 디버깅");
		bsrv.billyLikeUp(blvo);		
	}
	@RequestMapping(value = "/likeDown", method = RequestMethod.POST) 
	public void likeDown(Locale locale, Model model, @RequestParam("id") String id, @RequestParam("gNum") int gNum) throws Exception {
		System.out.println("컨트롤러 연결 성공");		
		BillyGoodsLikeVO blvo=new BillyGoodsLikeVO();
		blvo.setgNum(gNum);
		blvo.setId(id);	
		System.out.println(id+"/"+gNum+"/"+"--컨트롤러단 likeUp 디버깅");
		bsrv.billyLikeDown(blvo);
	}

	@RequestMapping(value = "/billyModForm", method = RequestMethod.GET) 
	public String billyMod(Locale locale, Model model, @RequestParam("vno") String vno) throws Exception {
		BillyGoodsVO bvo = bsrv.selectBillyOne(vno);
		List<BillyGoodsAttachVO> List = bsrv.selectOneBillyAttach(vno);
		System.out.println(bvo.getCateNum() + "---컨트롤러단 빌리수정하기(form) 디버깅");
		ArrayList<String> attachList = new ArrayList<>();
		for(int i = 0; i<List.size(); i++) {
			attachList.add(List.get(i).getfName());  
		}
		model.addAttribute("bvo", bvo);
		model.addAttribute("attachList",attachList);
		return "billy/billyModForm"; 
	}

	@RequestMapping(value = "/billeyModAction", method = RequestMethod.POST) 
	public String billeyModAction(Locale locale, Model model, BillyGoodsVO bvo, MultipartFile[] file, String[] delFiles) throws Exception {
		bsrv.updateBilly(bvo); 
		String[] fileNames = fileDataUtil1.fileUpload(file);
		bvo.setFiles(fileNames); 
		bvo.setDelFiles(delFiles);
		if(bvo.getDelFiles() != null) {  //입력받은 파일이 없다면
			bsrv.deleteBillyAttach(bvo);
		}
		if(bvo.getFiles().length != 0) { //입력받은 파일이 있다면
			if(fileNames[0] != null) {
				bsrv.updateBillyAttach(bvo);
			}
		}
		System.out.println(bvo.getCateNum() + "---컨트롤러단 빌리수정하기(action) 디버깅");
		return "redirect:/billyViewOne?vno=" + bvo.getgNum()+"&vid="+bvo.getId();
	}
	
	@RequestMapping(value = "/billyDeleteAction", method = RequestMethod.GET) 
	public String billyDeleteAction(Locale locale, Model model, @RequestParam("vno") String vno) throws Exception {		
		System.out.println(vno + "---컨트롤러단 빌리삭제하기 디버깅");
		bsrv.deleteBillyOne(vno);		
		return "redirect:/billyViewAll";		
	}
	
	@RequestMapping(value = "/billeyGoodsRentAction", method = RequestMethod.POST) 
	public String billeyGoodsRentAction(Locale locale, Model model, BillyGoodsRentVO brvo) throws Exception {		
		System.out.println(brvo.gettPrice()+ "---컨트롤러단 빌리기액션(Rentaction) 디버깅");
		System.out.println(brvo.getgNum()+ "---컨트롤러단 빌리기액션(Rentaction) 디버깅");
		System.out.println(brvo.getId()+ "---컨트롤러단 빌리기액션(Rentaction) 디버깅");
		System.out.println(brvo.gettIndate()+ "---컨트롤러단 빌리기액션(Rentaction) 디버깅");
		bsrv.insertBilleyTransaction(brvo);
		
		return "redirect:/billyViewAll";
	}

	@RequestMapping(value = "/member", method = RequestMethod.GET) //개발진사진 
	public String member(Locale locale, Model model) {
	
		return "billy/member";
	}
}