package main.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class MainService {
	@Autowired
	SqlSessionFactory fac;
	
	// TEST 과목 가져오기
	public List<HashMap> process(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("consult.process");
		ss.close();
		return list;
	}
	
	// 학년 정보 가져오기
	public List<HashMap> grade(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.grade");
		ss.close();
		return list;
	}
	
	// 반 정보 가져오기
	public List<HashMap> classList(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.classList");
		ss.close();
		return list;
	}
	
	// 반 명 정보 가져오기
	public List<HashMap> className(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.className");
		ss.close();
		return list;
	}

	// 담임 정보 가져오기
	public List<HashMap> teacher(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.teacher");
		ss.close();
		return list;
	}
	
	// 수강료 정보 가져오기
	public List<HashMap> price(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.price");
		ss.close();
		return list;
	}
	
	// 과목 정보 가져오기
	public List<HashMap> subject(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.subject");
		ss.close();
		return list;
	}
	
	// 수강반 리스트 가져오기
	public List<HashMap> studyList(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("study.studyList");
		ss.close();
		return list;
	}
}
