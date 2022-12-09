package com.billy.main;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.billy.Service.IF_billyMemberService;
import com.billy.VO.BillyMemberVO;

@Controller
public class billyMemberController {

	@Inject // 나 서비스 주입
	private IF_billyMemberService bmsv;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) throws Exception {

		return "billyMember/login";
	}

	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(Locale locale, Model model) {

		return "billyMember/joinForm";
	}

	@RequestMapping(value = "/joinAction", method = RequestMethod.POST)
	public String joinAction(Locale locale, Model model, BillyMemberVO bmvo, MultipartFile[] file) throws Exception {
		// 객체로 받을 때는 파라미터 이름과 객체의 변수의 이름이 일치하고 getter,setter가 있어야한다.>>자동매핑
		System.out.println(bmvo.getName() + "---디버깅용도");

		bmsv.insertMember(bmvo);
		return "redirect:/home";
	}

	@RequestMapping(value = "/chkId", method = RequestMethod.POST)
	@ResponseBody
	public String chkId(Locale locale, Model model, @RequestParam("id") String id) throws Exception {
		System.out.println(id);
		int result = bmsv.chkId(id);
		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	}

	@RequestMapping(value = "/chkName", method = RequestMethod.POST)
	@ResponseBody
	public String chkName(Locale locale, Model model, @RequestParam("name") String name) throws Exception {
		System.out.println(name + "--컨트롤러 별명중복체크 넘어감");
		int result = bmsv.chkName(name);
		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	}
	
	@RequestMapping(value="/loginAction", method=RequestMethod.POST)                                                                                                                                                                                                                                                                       
	public String loginAction(HttpSession session,BillyMemberVO bmvo) throws Exception {
		int result = bmsv.memberLoginChk(bmvo);
		System.out.println(result);		
		if(result==1) {	
			if(session.getAttribute("login") != null) {
				session.removeAttribute("login"); 	//이전 로그인 세션 정보 제거
			}		
			session.setAttribute("login", bmvo.getId());
		}
		return "home";		
	}
	
	@RequestMapping(value="/loginChk", method=RequestMethod.POST)
	@ResponseBody                                                                                                                                                                                                                                                                         
	public String loginChk(HttpSession session,BillyMemberVO bmvo,
						@RequestParam("id") String id, 
						@RequestParam("pwd") String pwd) throws Exception {
		System.out.println(id+"dkdiel---");
		System.out.println(pwd+"로그인액션에서 패스워드---");
		bmvo.setId(id);
		bmvo.setPwd(pwd);
		int result = bmsv.memberLoginChk(bmvo);
		System.out.println(result);
		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	}

	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
	
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public String myPage(HttpSession session) {

		return "billyMember/myPage_Member_Info";
	}
	
	
}
