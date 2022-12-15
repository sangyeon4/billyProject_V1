package com.billy.main;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.billy.Service.IF_billyService;
import com.billy.VO.BillyGoodsVO;

@Controller
public class HomeController {
	
	@Inject 
	private IF_billyService bsrv;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception{	
		List<BillyGoodsVO> bList = bsrv.selectBillyAll();
		System.out.println(bList.get(0).getgName() + "----컨트롤러단 빌리전체보기 디버깅");
		model.addAttribute("bList", bList);
		return "billy/billyViewAll";
	}
}
