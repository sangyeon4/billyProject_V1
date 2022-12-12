package com.billy.main;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.billy.Service.IF_billyService;
import com.billy.VO.BillyGoodsVO;
import com.billy.VO.BillyGoods_likeVO;
import com.billy.VO.BillyMemberVO;
import com.billy.util.FileDataUtil1;

@Controller
public class billyController {

	@Inject // 나 서비스 주입
	private IF_billyService bsrv;

	@Inject
	private FileDataUtil1 fileDataUtil1;

	@RequestMapping(value = "/billyForm", method = RequestMethod.GET)
	public String billyForm(Locale locale, Model model) throws Exception {
		int billyGnum = bsrv.selectMaxCnt();
		model.addAttribute("billyGnum", billyGnum);
		System.out.println(billyGnum + "--글번호 컨트롤러단 디버깅");// 등록된 글중 마지막번호에서 +1
		return "billy/billyForm";
	}

	@RequestMapping(value = "/billeyAction", method = RequestMethod.POST)
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

	@RequestMapping(value = "/billyViewAll", method = RequestMethod.GET)
	public String billyViewAll(Locale locale, Model model) throws Exception {
		List<BillyGoodsVO> bList = bsrv.selectBillyAll();
		System.out.println(bList.get(0).getgName() + "----컨트롤러단 빌리전체보기 디버깅");
		model.addAttribute("bList", bList);
		return "billy/billyViewAll";
	}

	@RequestMapping(value = "/billyViewOne", method = RequestMethod.GET)
	public String billyViewOne(Locale locale, Model model, @RequestParam("vno") String vno,
			@RequestParam("vid") String vid, MultipartFile[] file) throws Exception {
		// 객체로 받을 때는 파라미터 이름과 객체의 변수의 이름이 일치하고 getter,setter가 있어야한다.>>자동매핑
		BillyGoods_likeVO blvo =new BillyGoods_likeVO();
		int v=Integer.parseInt(vno);
		blvo.setgNum(v);
		blvo.setId(vid);
		int like=bsrv.selectCntBilly_like(blvo);
		System.out.println(like+"---컨트롤러단 빌리자세히보기(좋아요유무) 디버깅");
		
		
		BillyGoodsVO bvo = bsrv.selectBillyOne(vno);
		System.out.println(bvo.getgLoca() + "---컨트롤러단 빌리자세히보기 디버깅");
		model.addAttribute("like", like);
		model.addAttribute("bvo", bvo);
		return "billy/billyViewOne";
	}
	
//	@RequestMapping(value = "/likeUp", method = RequestMethod.POST)
//	@ResponseBody
//	public void likeUp(Locale locale, Model model, @RequestParam("gNum") int gNum, @RequestParam("id") String id)
//			throws Exception {
//		System.out.println("컨트롤러 연결 성공");
//		BillyGoods_likeVO blvo = new BillyGoods_likeVO();
//		blvo.setgNum(gNum);
//		blvo.setId(id);
//		bsrv.billyLikeUp(blvo);
//		System.out.println(blvo.getgNum() + "----컨트롤러단 빌리likeUp 디버깅");
//
//	}
	
 
//	@PostMapping("/likeUp")
//	public void likeup(Locale locale, Model model, @RequestBody String id,  @RequestBody String gNum) throws Exception {
//		System.out.println("컨트롤러 연결 성공");
//		System.out.println(id+"/"+gNum);
////		System.out.println(blvo.getgNum()+"---컨트롤러단 빌리 likeUp 디버깅");
////		bsrv.billyLikeUp(blvo);
//	
//	}
	@RequestMapping(value = "/likeUp", method = RequestMethod.POST)	
	public void likeUp(Locale locale, Model model, @RequestParam("id") String id, @RequestParam("gNum") int gNum ) throws Exception {
		BillyGoods_likeVO blvo=new BillyGoods_likeVO();
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
		BillyGoods_likeVO blvo=new BillyGoods_likeVO();
		blvo.setgNum(gNum);
		blvo.setId(id);	
		System.out.println(id+"/"+gNum+"/"+"--컨트롤러단 likeUp 디버깅");
		bsrv.billyLikeDown(blvo);
	}

	@RequestMapping(value = "/billyModForm", method = RequestMethod.GET)
	public String billyMod(Locale locale, Model model, @RequestParam("vno") String vno) throws Exception {
		BillyGoodsVO bvo = bsrv.selectBillyOne(vno);
		System.out.println(bvo.getCateNum() + "---컨트롤러단 빌리수정하기(form) 디버깅");
		model.addAttribute("bvo", bvo);
		return "billy/billyModForm";
	}

	@RequestMapping(value = "/billeyModAction", method = RequestMethod.POST)
	public String billeyModAction(Locale locale, Model model, BillyGoodsVO bvo, MultipartFile[] file) throws Exception {
		bsrv.updateBilly(bvo);
		System.out.println(bvo.getCateNum() + "---컨트롤러단 빌리수정하기(action) 디버깅");

		return "redirect:/billyViewOne?vno=" + bvo.getgNum();
	}

	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member(Locale locale, Model model) {

		return "billy/member";
	}
}