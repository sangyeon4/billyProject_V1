package com.billy.main;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model){		
		
		
		System.out.println("컨트롤러처리");
		return "home";
	}
}
