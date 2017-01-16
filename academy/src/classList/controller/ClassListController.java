package classList.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.fasterxml.jackson.annotation.JsonSubTypes.*;

import classList.service.*;
import main.service.*;

@Controller
@RequestMapping("/class")
public class ClassListController {
	@Autowired
	ClassListService cls;
	@Autowired
	MainService ms;
	
	// 수업 셋팅
	@RequestMapping("/set")
	public ModelAndView set(){
		ModelAndView mav = new ModelAndView("/classList/classSet.jsp");
		mav.addObject("grade", ms.grade());
		mav.addObject("classList", ms.classList());
		mav.addObject("className", ms.className());
		mav.addObject("teacher", ms.teacher());
		mav.addObject("price", ms.price());
		mav.addObject("subject", ms.subject());
//		mav.addObject("process", ms.process());
//		mav.addObject("book", ms.book());
		return mav;
	}
	
	// 항목 추가
	@RequestMapping("/add/{type}/{text}")
	public ModelAndView add(@PathVariable(name="type")String type, @PathVariable(name="text")String text, HttpSession session){
		ModelAndView mav = new ModelAndView("/classList/"+type+"Ajax.jsp");
		cls.add(type, text, session);
		List<HashMap> list = cls.select(type, session);
		mav.addObject("list", list);
		return mav;
	}
	
	// process 항목
	@RequestMapping("/process/{type}")
	public ModelAndView proc(@PathVariable(name="type")String type, HttpSession session){
		ModelAndView mav = new ModelAndView("/classList/processAjax.jsp");
		mav.addObject("list", cls.process(type));
		session.setAttribute("subject", type);
		return mav;
	}
	
	// book 항목
	@RequestMapping("/book/{type}")
	public ModelAndView book(@PathVariable(name="type")String type, HttpSession session){
		ModelAndView mav = new ModelAndView("/classList/bookAjax.jsp");
		mav.addObject("list", cls.book(type));
		session.setAttribute("subject", type);
		return mav;
	}
	
	// 항목 삭제
	@RequestMapping("/delete/{name}/{subject}")
	@ResponseBody
	public boolean delete(@PathVariable(name="name")String name, @PathVariable(name="subject")String subject){
		return cls.delete(name, subject);
	}
	
	// 항목 삭제
	@RequestMapping("/delete/{name}")
	@ResponseBody
	public boolean delete(@PathVariable(name="name")String name){
		return cls.delete(name, null);
	}
	
	// 항목 수정
	@RequestMapping("/modify/{name}/{newName}")
	@ResponseBody
	public boolean modify(@PathVariable(name="name")String name, @PathVariable(name="newName")String newName){
		return cls.modify(name, newName, null);
	}
	
	// 항목 수정
	@RequestMapping("/modify/{name}/{newName}/{subject}")
	@ResponseBody
	public boolean modify(@PathVariable(name="name")String name, @PathVariable(name="newName")String newName,
										@PathVariable(name="subject")String subject){
		return cls.modify(name, newName, subject);
	}
	
	// 반 만들기
	@RequestMapping("/create")
	public ModelAndView create(){
		ModelAndView mav = new ModelAndView("/classList/createClass.jsp");
		mav.addObject("grade", ms.grade());
		mav.addObject("classList", ms.classList());
		mav.addObject("className", ms.className());
		mav.addObject("teacher", ms.teacher());
		mav.addObject("price", ms.price());
		mav.addObject("subject", ms.subject());
		return mav;
	}
	
	// 반 만들기 요일 및 시간
	@RequestMapping("/time/{startH}/{startM}/{endH}/{endM}/{day}/{title}")
	@ResponseBody
	public ModelAndView time(@PathVariable(name="startH")int startH, @PathVariable(name="startM")int startM, @PathVariable(name="endH")int endH,
									@PathVariable(name="endM")int endM, @PathVariable(name="day")int day, @PathVariable(name="title")int title){
		ModelAndView mav = new ModelAndView("/classList/timeAjax.jsp");
		mav.addObject("startH", startH+1);
		mav.addObject("startM", startM+1);
		mav.addObject("endH", endH+1);
		mav.addObject("endM", endM+1);
		mav.addObject("day", day+1);
		mav.addObject("title", title+1);
		return mav;
	}
	
	// 반 만들기 과정
	@RequestMapping("/create/process/{subject}")
	public ModelAndView createProcess(@PathVariable(name="subject")String subject){
		ModelAndView mav = new ModelAndView("/classList/createSPAjax.jsp");
		mav.addObject("process", cls.process(subject));
		return mav;
	}
	
	// 반 만들기 교재
	@RequestMapping("/create/book/{subject}")
	public ModelAndView createBook(@PathVariable(name="subject")String subject){
		ModelAndView mav = new ModelAndView("/classList/createSBAjax.jsp");
		mav.addObject("book", cls.book(subject));
		return mav;
	}
	
	// 반 만들기 교재 추가
	@RequestMapping("/create/book/{subject}/{num}")
	public ModelAndView createBook(@PathVariable(name="subject")String subject, @PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/classList/createSBPAjax.jsp");
		mav.addObject("book", cls.book(subject));
		mav.addObject("num", num+1);
		return mav;
	}
	
	// 반 만들기 저장
	@RequestMapping("/save/{className}/{grade}/{classList}/{teacher}/{price}/{day}/{startH}/{startM}/{endH}/{endM}/{process}/{book}/{special}/{subject}/{startDate}/{endDate}")
	@ResponseBody
	public boolean save(@PathVariable(name="className")String className, @PathVariable(name="grade")String grade, @PathVariable(name="classList")String classList,
									@PathVariable(name="teacher")String teacher, @PathVariable(name="price")String price, @PathVariable(name="day")String[] day,
									@PathVariable(name="startH")String[] startH, @PathVariable(name="startM")String[] startM, @PathVariable(name="endH")String[] endH,
									@PathVariable(name="endM")String[] endM, @PathVariable(name="process")String process, @PathVariable(name="book")String[] book,
									@PathVariable(name="special")String special, @PathVariable(name="subject")String subject, @PathVariable(name="startDate")String startDate,
									@PathVariable(name="endDate")String endDate){
		String books = "";
		for(int i=0; i<book.length; i++){
			books += book[i];
			if(i!=book.length-1){
				books += ",";
			}
		}
		String days = "";
		for(int i=0; i<day.length; i++){
			days += day[i];
			if(i!=day.length-1){
				days += ",";
			}
		}
		String startTime = startH[0]+":"+startM[0];
		String endTime = endH[0]+":"+endM[0];
		boolean b = cls.save(className, grade, classList, teacher, price, days, startTime, endTime, process, books, special, subject, startDate, endDate);
		if(b){
			return true;
		} else {
			return false;
		}
	}
	
	// 수강반 검색
	@RequestMapping("/search")
	public ModelAndView search(@RequestParam(name="date")String date, @RequestParam(name="subject")String subject){
		ModelAndView mav = new ModelAndView("/classList/searchAjax.jsp");
		mav.addObject("studyList", cls.search(date, subject));
		return mav;
	}
}
