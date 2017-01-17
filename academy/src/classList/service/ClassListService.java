package classList.service;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class ClassListService {
	@Autowired
	SqlSessionFactory fac;
	
	// �׸� �߰�
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
	
	// �׸� ��ȸ
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
	
	// process ��ȸ
	public List<HashMap> process(String type){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.process", type);
		ss.close();
		return list;
	}
	
	// book ��ȸ
	public List<HashMap> book(String type){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.book", type);
		ss.close();
		return list;
	}
	
	// �׸����
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
	
	// �׸����
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
	
	// �� ����� ����
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
	
	// ������ �˻�
	public List<HashMap> search(String date, String subject){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("date", date);
		map.put("subject", subject);
		List<HashMap> list = new Vector<>();
		if(subject.equals("��ü")){
			list = ss.selectList("study.searchAll", map);
		} else {
			list = ss.selectList("study.search", map);
		}
		ss.close();
		return list;
	}
	
	// ������ ����
	public boolean studyMod(String cn, String gr, String cl, String te, String pr, String da, String st, String et, String pro, String bo, int num){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("cn", cn);
		map.put("gr", gr);
		map.put("cl", cl);
		map.put("te", te);
		map.put("pr", pr);
		map.put("da", da);
		map.put("st", st);
		map.put("et", et);
		map.put("pro", pro);
		map.put("bo", bo);
		map.put("num", num);
		int a = ss.update("study.modifyCn", map);
		int b = ss.update("study.modifyGr", map);
		int c = ss.update("study.modifyCl", map);
		int d = ss.update("study.modifyTe", map);
		int e = ss.update("study.modifyPr", map);
		int f = ss.update("study.modifySt", map);
		int g = ss.update("study.modifyEt", map);
		int h = ss.update("study.modifyPro", map);
		int i = ss.update("study.modifyBo", map);
		if(a+b+c+d+e+f+g+h+i>0){
			ss.commit();
			ss.close();
			return true;
		}
		ss.rollback();
		ss.close();
		return false;
	}
	
	// ������ ���� �̷�
	public boolean studyMod2(String before, String after, int num){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("before", before);
		map.put("after", after);
		map.put("studyNum", num);
		try{
			ss.insert("study.studyModify", map);
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
	
	// ���� ���� view
	public List<HashMap> modifyView(int num){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("study.modifyView", num);
		for(int i=0; i<list.size(); i++){
			Date date = (Date)list.get(i).get("DAY");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String day = sdf.format(date);
			list.get(i).put("DAY", day);
		}
		ss.close();
		return list;
	}
	
	// ����
	public boolean finish(int num){
		SqlSession ss = fac.openSession();
		int n = ss.update("study.finish", num);
		if(n>0){
			ss.commit();
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}
	
	// ������ ����
	public boolean deleteStudy(int num){
		SqlSession ss = fac.openSession();
		int n = ss.delete("study.deleteStudy", num);
		if(n>0){
			ss.delete("study.deleteModify", num);
			ss.commit();
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}
}
