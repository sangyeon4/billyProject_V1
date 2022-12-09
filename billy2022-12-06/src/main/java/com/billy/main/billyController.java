package com.billy.main;

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
import com.billy.VO.BillyGoodsVO;
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
	public String billyViewAll(Locale locale, Model model) {
		List<BillyGoodsVO> bList = bsrv.selectBillyAll();

		System.out.println(bList.get(0).getgName() + "----컨트롤러단 빌리전체보기 디버깅");
		model.addAttribute("bList", bList);
		return "billy/billyViewAll";
	}

	@RequestMapping(value = "/billyViewOne", method = RequestMethod.GET)
	public String billyViewOne(Locale locale, Model model, @RequestParam("vno") String vno, MultipartFile[] file)
			throws Exception {
		// 객체로 받을 때는 파라미터 이름과 객체의 변수의 이름이 일치하고 getter,setter가 있어야한다.>>자동매핑
		BillyGoodsVO bvo = bsrv.selectBillyOne(vno);
		System.out.println(bvo.getgLoca() + "---컨트롤러단 빌리자세히보기 디버깅");
		model.addAttribute("bvo", bvo);
		return "billy/billyViewOne";
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

		return "redirect:/billyViewOne?vno="+bvo.getgNum();
	}
	
	

	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member(Locale locale, Model model) {

		return "billy/member";
	}
}