package com.billy.main;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.billy.Service.IF_villageService;
import com.billy.VO.VillagePageVO;
import com.billy.VO.VillageReplyVO;
import com.billy.VO.VillageVO;
import com.billy.util.FileDataUtil2;

@Controller
public class villageController {
	
	@Inject
	private IF_villageService ivs;
	
	@Inject
	private FileDataUtil2 fileDataUtil2;
	
	@RequestMapping(value = "/villageBoard", method = RequestMethod.GET)
	public String villageBoard(Locale locale, Model model,@ModelAttribute("pageVO") VillagePageVO vpvo) {
		if(vpvo.getPage() == null) {
			vpvo.setPage(1);
		}
		int totalpageCnt = ivs.selectVillgeBoardCnt();
		vpvo.setTotalCount(totalpageCnt);
		List<VillageVO> list = ivs.selectAllVillage(vpvo);
		model.addAttribute("vList",list);
		model.addAttribute("page",vpvo);
		return "billy/villageBoard";
	}
	
	@RequestMapping(value = "/villageForm", method = RequestMethod.GET)
	public String villageForm(Locale locale, Model model) {
		int num = ivs.selectNum();
		model.addAttribute("vNum",num+1);
		return "village/villageForm";
	}
	
	@RequestMapping(value = "/villageAction", method = RequestMethod.POST)
	public String villageAction(Locale locale, Model model, VillageVO vvo, MultipartFile[] file) throws Exception {
		String[] fileNames = fileDataUtil2.fileUpload(file);
	    vvo.setFiles(fileNames);
		ivs.insertVillage(vvo);
		return "redirect:/villageBoard";
	}
	
	@RequestMapping(value = "/villageView", method = RequestMethod.GET)
	public String villageView(Locale locale, Model model, int vNum) throws Exception {
		ivs.updateVillageCnt(vNum);
		VillageVO vvo = ivs.selectOneVillage(vNum);
		List<String> attach = ivs.selectAttach_v(vNum);
		List<VillageReplyVO> replyList = ivs.selectVillageReply_1(vNum);
		Integer replyNum = ivs.selectReplyNum(vNum);
		model.addAttribute("vvo",vvo);
		model.addAttribute("attach",attach);
		model.addAttribute("replyList",replyList);
		model.addAttribute("replyNum",replyNum+1);
		return "village/villageView";
	}
	
	@RequestMapping(value = "/villageReply_1Action", method = RequestMethod.POST)
	public String villageReply_1Action(Locale locale, Model model, VillageReplyVO vrvo) throws Exception {
		System.out.println(vrvo.getvNum());
		ivs.insertVillageReply_1(vrvo);
		return "redirect:/villageView?vNum="+vrvo.getvNum();
	}
	
	@RequestMapping(value = "/villageBoardDelAction", method = RequestMethod.GET)
	public String villageBoardDelAction(Locale locale, Model model, int vNum) {
		System.out.println(vNum);
		ivs.deleteVillageBoard(vNum);
		return "redirect:/villageBoard";
	}
	
	@RequestMapping(value = "/villageBoardModBtn", method = RequestMethod.GET)
	public String villageBoardModAction(Locale locale, Model model, VillageVO vvo) throws Exception {
		List<String> attach = ivs.selectAttach_v(vvo.getvNum());
		model.addAttribute("vvo", vvo);
		model.addAttribute("file", attach);
		return "village/villageMod";
	}
	
	@RequestMapping(value = "/updateVillageBoardAction", method = RequestMethod.GET)
	public String updateVillageBoardAction(Locale locale, Model model, String[] modFile, MultipartFile[] file, VillageVO vvo) throws Exception {
		System.out.println("11");
		String[] fileNames = fileDataUtil2.fileUpload(file);
	    vvo.setFiles(fileNames);
	    System.out.println("11");
		ivs.updateVillageBoardAction(modFile, vvo);
		return "redirect:/villageBoard";
	}
}
