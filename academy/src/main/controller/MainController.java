package main.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import main.service.*;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	MainService ms;

	// 메인
	@RequestMapping("/")
	public String index(){
		return "/main/main.jsp";
	}
	
	// 신규상담
	@RequestMapping("/consult")
	public ModelAndView consult(){
		ModelAndView mav = new ModelAndView("/consult/consult.jsp");
		mav.addObject("process", ms.process());
		return mav;
	}
	
	// 수강반현황
	@RequestMapping("/classList")
	public ModelAndView classList(){
		ModelAndView mav = new ModelAndView("/classList/classList.jsp");
//		mav.addObject("grade", ms.grade());
//		mav.addObject("classList", ms.classList());
//		mav.addObject("className", ms.className());
//		mav.addObject("teacher", ms.teacher());
//		mav.addObject("price", ms.price());
		mav.addObject("subject", ms.subject());
//		mav.addObject("process", ms.process());
//		mav.addObject("book", ms.book());
		mav.addObject("studyList", ms.studyList());
		return mav;
	}
}
