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
	
	// ���� ����
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
	
	// �׸� �߰�
	@RequestMapping("/add/{type}/{text}")
	public ModelAndView add(@PathVariable(name="type")String type, @PathVariable(name="text")String text, HttpSession session){
		ModelAndView mav = new ModelAndView("/classList/"+type+"Ajax.jsp");
		cls.add(type, text, session);
		List<HashMap> list = cls.select(type, session);
		mav.addObject("list", list);
		return mav;
	}
	
	// process �׸�
	@RequestMapping("/process/{type}")
	public ModelAndView proc(@PathVariable(name="type")String type, HttpSession session){
		ModelAndView mav = new ModelAndView("/classList/processAjax.jsp");
		mav.addObject("list", cls.process(type));
		session.setAttribute("subject", type);
		return mav;
	}
	
	// book �׸�
	@RequestMapping("/book/{type}")
	public ModelAndView book(@PathVariable(name="type")String type, HttpSession session){
		ModelAndView mav = new ModelAndView("/classList/bookAjax.jsp");
		mav.addObject("list", cls.book(type));
		session.setAttribute("subject", type);
		return mav;
	}
	
	// �׸� ����
	@RequestMapping("/delete/{name}/{subject}")
	@ResponseBody
	public boolean delete(@PathVariable(name="name")String name, @PathVariable(name="subject")String subject){
		return cls.delete(name, subject);
	}
	
	// �׸� ����
	@RequestMapping("/delete/{name}")
	@ResponseBody
	public boolean delete(@PathVariable(name="name")String name){
		return cls.delete(name, null);
	}
	
	// �׸� ����
	@RequestMapping("/modify/{name}/{newName}")
	@ResponseBody
	public boolean modify(@PathVariable(name="name")String name, @PathVariable(name="newName")String newName){
		return cls.modify(name, newName, null);
	}
	
	// �׸� ����
	@RequestMapping("/modify/{name}/{newName}/{subject}")
	@ResponseBody
	public boolean modify(@PathVariable(name="name")String name, @PathVariable(name="newName")String newName,
										@PathVariable(name="subject")String subject){
		return cls.modify(name, newName, subject);
	}
	
	// �� �����
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
	
	// �� ����� ���� �� �ð�
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
	
	// �� ����� ����
	@RequestMapping("/create/process/{subject}")
	public ModelAndView createProcess(@PathVariable(name="subject")String subject){
		ModelAndView mav = new ModelAndView("/classList/createSPAjax.jsp");
		mav.addObject("process", cls.process(subject));
		return mav;
	}
	
	// �� ����� ����
	@RequestMapping("/create/book/{subject}")
	public ModelAndView createBook(@PathVariable(name="subject")String subject){
		ModelAndView mav = new ModelAndView("/classList/createSBAjax.jsp");
		mav.addObject("book", cls.book(subject));
		return mav;
	}
	
	// �� ����� ���� �߰�
	@RequestMapping("/create/book/{subject}/{num}")
	public ModelAndView createBook(@PathVariable(name="subject")String subject, @PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/classList/createSBPAjax.jsp");
		mav.addObject("book", cls.book(subject));
		mav.addObject("num", num+1);
		return mav;
	}
	
	// �� ����� ����
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
	
	// ������ �˻�
	@RequestMapping("/search")
	public ModelAndView search(@RequestParam(name="date")String date, @RequestParam(name="subject")String subject){
		ModelAndView mav = new ModelAndView("/classList/searchAjax.jsp");
		mav.addObject("studyList", cls.search(date, subject));
		return mav;
	}
}
