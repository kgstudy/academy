package classList.service;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class ClassListService {
	@Autowired
	SqlSessionFactory fac;
	
	// 항목 추가
	public boolean add(String type, String text, HttpSession session){
		SqlSession ss = fac.openSession();
		try{
			if(type.equals("process") || type.equals("book")){
				HashMap<String, String> map = new HashMap<>();
				map.put("name", text);
				map.put("subject", (String)session.getAttribute("subject"));
				ss.insert("classList."+type+"Add", map);
			} else {
				ss.insert("classList."+type+"Add", text);
			}
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
	
	// 항목 조회
	public List<HashMap> select(String type, HttpSession session){
		SqlSession ss = fac.openSession();
		List<HashMap> list = new Vector<>();
		if(type.equals("process") || type.equals("book")){
			list = ss.selectList("classList."+type, (String)session.getAttribute("subject"));
		} else {
			list = ss.selectList("classList."+type);
		}
		ss.close();
		return list;
	}
	
	// process 조회
	public List<HashMap> process(String type){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.process", type);
		ss.close();
		return list;
	}
	
	// book 조회
	public List<HashMap> book(String type){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.book", type);
		ss.close();
		return list;
	}
	
	// 항목삭제
	public boolean delete(String name, String subject){
		SqlSession ss = fac.openSession();
		String[] ar = {"grade", "classList", "className", "teacher", "price", "subject", "book", "process"};
		for(int i=0; i<ar.length; i++){
			if(ar[i].equals("book") || ar[i].equals("process")){
				ar[i] += "All";
			}
			List<HashMap> list = ss.selectList("classList."+ar[i]);
			ar = new String[]{"grade", "classList", "className", "teacher", "price", "subject", "book", "process"};
			for(HashMap map : list){
				if(map.containsValue(name)){
					if(ar[i].equals("book") || ar[i].equals("process")){
						HashMap<String, String> map2 = new HashMap<>();
						map2.put("name", name);
						map2.put("subject", subject);
						ss.delete("classList."+ar[i]+"Del", map2);
					} else {
						ss.delete("classList."+ar[i]+"Del", name);
					}
					ss.commit();
					ss.close();
					return true;
				}
			}
		}
		ss.rollback();
		ss.close();
		return false;
	}
	
	// 항목수정
	public boolean modify(String name, String newName, String subject){
		SqlSession ss = fac.openSession();
		String[] ar = {"grade", "classList", "className", "teacher", "price", "subject", "book", "process"};
		HashMap<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("newName", newName);
		map.put("subject", subject);
		for(int i=0; i<ar.length; i++){
			if(ar[i].equals("book") || ar[i].equals("process")){
				ar[i] += "All";
			}
			List<HashMap> list = ss.selectList("classList."+ar[i]);
			ar = new String[]{"grade", "classList", "className", "teacher", "price", "subject", "book", "process"};
			for(HashMap map2 : list){
				if(map2.containsValue(name)){
					ss.update("classList."+ar[i]+"Mod", map);
					ss.commit();
					ss.close();
					return true;
				}
			}
		} 
		ss.rollback();
		ss.close();
		return false;
	}
	
	// 반 만들기 저장
	public boolean save(String className, String grade, String classList, String teacher, String price, String day, String startTime, String endTime,
									String process, String book, String special, String subject, String startDate, String endDate){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("className", className);
		map.put("grade", grade);
		map.put("classList", classList);
		map.put("teacher", teacher);
		map.put("price", price);
		map.put("day", day);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("process", process);
		map.put("book", book);
		map.put("special", special);
		map.put("subject", subject);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		try{
			ss.insert("study.newStudy", map);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return false;
		}
	}
	
	// 수강반 검색
	public List<HashMap> search(String date, String subject){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("date", date);
		map.put("subject", subject);
		List<HashMap> list = new Vector<>();
		if(subject.equals("전체")){
			list = ss.selectList("study.searchAll", map);
		} else {
			list = ss.selectList("study.search", map);
		}
		ss.close();
		return list;
	}
}
