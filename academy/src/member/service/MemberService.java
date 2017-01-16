package member.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class MemberService {
	@Autowired
	SqlSessionFactory fac;
	
	// 회원가입
	public boolean join(String id, String pass, String name, String phone, String type){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		map.put("name", name);
		map.put("phone", phone);
		map.put("type", type);
		try{
			ss.insert("member.join", map);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			ss.rollback();
			ss.close();
			e.printStackTrace();
			return false;
		}
	}
	
	// 아이디 중복체크
	public boolean idCheck(String id){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.member", id);
		if(list.size()!=0){
			ss.close();
			return false;
		} else {
			ss.close();
			return true;
		}
	}
	
	// 로그인
	public List<HashMap> login(String id, String pass){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		List<HashMap> list = ss.selectList("member.login", map);
		ss.close();
		return list;
	}
}
