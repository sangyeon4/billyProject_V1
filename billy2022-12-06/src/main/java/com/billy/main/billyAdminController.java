package com.billy.main;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.billy.Service.IF_billyAdminService;
import com.billy.VO.BillyNoticeVO;
import com.billy.VO.VillagePageVO;
import com.billy.VO.VillageReplyVO;
import com.billy.VO.VillageVO;

@Controller
public class billyAdminController {
	
	@Inject
	private IF_billyAdminService basv;
	
	@RequestMapping(value="/adminPage", method=RequestMethod.GET)
	public String adminPage(HttpSession session,Model model,@ModelAttribute("pageVO") VillagePageVO vpvo) throws Exception {
		System.out.println("--관리자페이지 컨트롤러단");
		if(vpvo.getPage() == null) {
			vpvo.setPage(1);
		}
		int totalpageCnt = basv.selectBillyNoticeCnt();
		vpvo.setTotalCount(totalpageCnt);
		List<BillyNoticeVO> bnList = basv.selectAllBillyNotice(vpvo);
		System.out.println(bnList.size());
		model.addAttribute("bnList",bnList);
		model.addAttribute("page",vpvo);
		return "billyAdmin/adminPage";
	}
	
	@RequestMapping(value = "/billyNoticeForm", method = RequestMethod.GET)
	public String billyNoticeForm(Locale locale, Model model) {
		int bnNum = basv.selectBillyNotice();
		model.addAttribute("bnNum",bnNum+1);
		
		return "billyAdmin/billyNoticeForm";
	}
	
	
	@RequestMapping(value = "/billyNoticeAction", method = RequestMethod.POST)
	public String billyNoticeAction(Locale locale, Model model, BillyNoticeVO bnvo) throws Exception {
		basv.insertBillyNotice(bnvo);
		List<BillyNoticeVO> bnList = basv.rollingBillyNotice();
		System.out.println(bnList.size()); //5
		model.addAttribute("bnList",bnList);
		
		return "redirect:/adminPage";
	}
	
	@RequestMapping(value = "/billyNoticeView", method = RequestMethod.GET)
	public String villageView(Locale locale, Model model, int bnNum) throws Exception {
		//basv.updateVillageCnt(bnNum);	조회수
		BillyNoticeVO bnvo = basv.selectOneBillyNotice(bnNum);
		model.addAttribute("bnvo",bnvo);
		return "village/villageView";
	}
	
	
	
	

	
}
