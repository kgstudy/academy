package student.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import student.service.*;

@Controller
@RequestMapping("/student")
public class StudentController {
	@Autowired
	StudentService ss;
	
	// 학생 검색
	@RequestMapping("/search/{name}")
	public ModelAndView search(@PathVariable(name="name")String name){
		ModelAndView mav = new ModelAndView("/student/info.jsp");
		mav.addObject("info", ss.info(name));
		return mav;
	}
}
