package com.billy.main;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.billy.Service.IF_villageService;
import com.billy.VO.VillageVO;

@Controller
public class villageController {
	
	@Inject
	private IF_villageService ivs;
	
	@RequestMapping(value = "/villageBoard", method = RequestMethod.GET)
	public String villageBoard(Locale locale, Model model) {
		List<VillageVO> list = ivs.selectAll();
		model.addAttribute("vList",list);
		return "billy/villageBoard";
	}
	
	@RequestMapping(value = "/villageForm", method = RequestMethod.GET)
	public String villageForm(Locale locale, Model model) {
		int num = ivs.selectNum();
		model.addAttribute("num",num+1);
		return "village/villageForm";
	}
	
	@RequestMapping(value = "/villageAction", method = RequestMethod.POST)
	public String villageAction(Locale locale, Model model, VillageVO vvo) {
		ivs.insertOne(vvo);
		return "redirect:/villageBoard";
	}
	
	@RequestMapping(value = "/villageView", method = RequestMethod.GET)
	public String villageView(Locale locale, Model model, int vNum) {
		VillageVO vvo = ivs.selectOne(vNum);
		model.addAttribute("vvo",vvo);
		return "village/villageView";
	}
}
