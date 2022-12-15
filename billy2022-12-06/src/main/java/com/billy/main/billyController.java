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
import com.billy.VO.BillyGoodsRentVO;
import com.billy.VO.BillyGoodsVO;
import com.billy.VO.BillyGoods_attachVO;
import com.billy.VO.BillyGoods_likeVO;
import com.billy.util.FileDataUtil1;

@Controller
public class billyController {

	@Inject // 나 서비스 주입
	private IF_billyService bsrv;

	@Inject
	private FileDataUtil1 fileDataUtil1;

	@RequestMapping(value = "/billyForm", method = RequestMethod.GET) //빌리등록폼
	public String billyForm(Locale locale, Model model) throws Exception {
		int billyGnum = bsrv.selectMaxCnt();
		model.addAttribute("billyGnum", billyGnum);
		System.out.println(billyGnum + "--글번호 컨트롤러단 디버깅");// 등록된 글중 마지막번호에서 +1
		return "billy/billyForm";
	}

	@RequestMapping(value = "/billeyAction", method = RequestMethod.POST) //빌리등록액션
	public String billeyAction(Locale locale, Model model, BillyGoodsVO bvo, MultipartFile[] file) throws Exception {
		// 객체로 받을 때는 파라미터 이름과 객체의 변수의 이름이 일치하고 getter,setter가 있어야한다.>>자동매핑
		System.out.println(bvo.getgEndDate() + "---디버깅용도");
		System.out.println(bvo.getId());
		System.out.println(bvo.getgLoca());
		System.out.println(bvo.getgLoca());
		System.out.println(bvo.getCateNum());
		System.out.println(bvo.getgPrice());
		String[] fileNames = fileDataUtil1.fileUpload(file);
		bvo.setFiles(fileNames);
		bsrv.insertBilly(bvo);
//      return "redirect:/billyViewAll";
		return "redirect:/home";
	}

	@RequestMapping(value = "/billyViewAll", method = RequestMethod.GET) //빌리게시판
	public String billyViewAll(Locale locale, Model model) throws Exception {
		List<BillyGoodsVO> bList = bsrv.selectBillyAll();
		System.out.println(bList.get(0).getgName() + "----컨트롤러단 빌리전체보기 디버깅");
		model.addAttribute("bList", bList);
		return "billy/billyViewAll";
	}

	@RequestMapping(value = "/billyViewOne", method = RequestMethod.GET) //빌리자세히보기
	public String billyViewOne(Locale locale, Model model, @RequestParam("vno") String vno,
			@RequestParam("vid") String vid, MultipartFile[] file) throws Exception {
		// 객체로 받을 때는 파라미터 이름과 객체의 변수의 이름이 일치하고 getter,setter가 있어야한다.>>자동매핑
		BillyGoods_likeVO blvo =new BillyGoods_likeVO();
		int v=Integer.parseInt(vno);
		blvo.setgNum(v);
		blvo.setId(vid);
		String rDate=bsrv.selectBillyRentdate(vno); //이미 대여된날짜
		int like=bsrv.selectCntBilly_like(blvo);//접속한 아이디의 해당글 좋아요 유무
		System.out.println(like+"---컨트롤러단 빌리자세히보기(좋아요유무) 디버깅");		
		
		BillyGoodsVO bvo = bsrv.selectBillyOne(vno);
		System.out.println(bvo.getgLoca() + "---컨트롤러단 빌리자세히보기 디버깅");
		model.addAttribute("like", like);
		model.addAttribute("bvo", bvo);
		model.addAttribute("rDate",rDate);
		return "billy/billyViewOne";
	}	

	@RequestMapping(value = "/likeUp", method = RequestMethod.POST)	 //좋아요
	public void likeUp(Locale locale, Model model, @RequestParam("id") String id, @RequestParam("gNum") int gNum ) throws Exception {
		BillyGoods_likeVO blvo=new BillyGoods_likeVO();
		blvo.setgNum(gNum);
		blvo.setId(id);	
		System.out.println(id);
		System.out.println(gNum);
		System.out.println(id+"/"+gNum+"/"+"--컨트롤러단 likeUp 디버깅");
		bsrv.billyLikeUp(blvo);		
	}
	@RequestMapping(value = "/likeDown", method = RequestMethod.POST) //좋아요취소
	public void likeDown(Locale locale, Model model, @RequestParam("id") String id, @RequestParam("gNum") int gNum) throws Exception {
		System.out.println("컨트롤러 연결 성공");		
		BillyGoods_likeVO blvo=new BillyGoods_likeVO();
		blvo.setgNum(gNum);
		blvo.setId(id);	
		System.out.println(id+"/"+gNum+"/"+"--컨트롤러단 likeUp 디버깅");
		bsrv.billyLikeDown(blvo);
	}

	@RequestMapping(value = "/billyModForm", method = RequestMethod.GET) //빌리수정폼
	public String billyMod(Locale locale, Model model, @RequestParam("vno") String vno) throws Exception {
		BillyGoodsVO bvo = bsrv.selectBillyOne(vno);
		List<BillyGoods_attachVO> List = bsrv.selectOneBilly_attach(vno);
		System.out.println(bvo.getCateNum() + "---컨트롤러단 빌리수정하기(form) 디버깅");
		ArrayList<String> attachList = new ArrayList<>();
		for(int i = 0; i<List.size(); i++) {
			attachList.add(List.get(i).getfName());
		}
		model.addAttribute("bvo", bvo);
		model.addAttribute("attachList",attachList);
		return "billy/billyModForm"; 
	}

	@RequestMapping(value = "/billeyModAction", method = RequestMethod.POST) //빌리수정요청
	public String billeyModAction(Locale locale, Model model, BillyGoodsVO bvo, MultipartFile[] file, String[] delFiles) throws Exception {
		bsrv.updateBilly(bvo);
		String[] fileNames = fileDataUtil1.fileUpload(file);
		bvo.setFiles(fileNames);
		bvo.setDelFiles(delFiles);
		if(bvo.getDelFiles() != null) {
			bsrv.deleteBillyAttach(bvo);
		}
		if(bvo.getFiles().length != 0) {
			if(fileNames[0] != null) {
				bsrv.updateBillyAttach(bvo);
			}
		}
		System.out.println(bvo.getCateNum() + "---컨트롤러단 빌리수정하기(action) 디버깅");
		return "redirect:/billyViewOne?vno=" + bvo.getgNum()+"&vid="+bvo.getId();
	}
	
	@RequestMapping(value = "/billeyGoodsRentAction", method = RequestMethod.POST) //빌리기 액션
	public String billeyGoodsRentAction(Locale locale, Model model, BillyGoodsRentVO brvo) throws Exception {		
		System.out.println(brvo.gettPrice()+ "---컨트롤러단 빌리기액션(Rentaction) 디버깅");
		System.out.println(brvo.getgNum()+ "---컨트롤러단 빌리기액션(Rentaction) 디버깅");
		System.out.println(brvo.getId()+ "---컨트롤러단 빌리기액션(Rentaction) 디버깅");
		System.out.println(brvo.gettIndate()+ "---컨트롤러단 빌리기액션(Rentaction) 디버깅");
		bsrv.insertBilleyTransaction(brvo);
		
		return "redirect:/billyViewAll";
	}

	@RequestMapping(value = "/member", method = RequestMethod.GET) //빌리개발진사진
	public String member(Locale locale, Model model) {
	
		return "billy/member";
	}
}