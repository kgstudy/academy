package member.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import member.service.*;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService ms;
	
	// ȸ������
	@RequestMapping("/join/{id}/{password}/{name}/{phone}/{type}")
	@ResponseBody
	public boolean join(@PathVariable(name="id")String id, @PathVariable(name="password")String pass, @PathVariable(name="name")String name,
									@PathVariable(name="phone")String phone, @PathVariable(name="type")String type){
		return ms.join(id, pass, name, phone, type);
	}
	
	// ���̵� �ߺ�üũ
	@RequestMapping("/idCheck/{id}")
	@ResponseBody
	public boolean idCheck(@PathVariable(name="id")String id){
		return ms.idCheck(id);
	}
	
	// �α���
	@RequestMapping("/login/{id}/{password}")
	@ResponseBody
	public boolean login(@PathVariable(name="id")String id, @PathVariable(name="password")String pass, HttpSession session){
		List<HashMap> list = ms.login(id, pass);
		if(list.size()!=0){
			session.setAttribute("login", list.get(0));
			return true;
		} else {
			return false;
		}
	}
	
	// �α׾ƿ�
	@RequestMapping("/logout")
	@ResponseBody
	public boolean logout(HttpSession session){
		session.removeAttribute("login");
		return true;
	}
}
