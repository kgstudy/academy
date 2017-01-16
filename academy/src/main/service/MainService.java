package main.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class MainService {
	@Autowired
	SqlSessionFactory fac;
	
	// TEST ���� ��������
	public List<HashMap> process(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("consult.process");
		ss.close();
		return list;
	}
	
	// �г� ���� ��������
	public List<HashMap> grade(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.grade");
		ss.close();
		return list;
	}
	
	// �� ���� ��������
	public List<HashMap> classList(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.classList");
		ss.close();
		return list;
	}
	
	// �� �� ���� ��������
	public List<HashMap> className(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.className");
		ss.close();
		return list;
	}

	// ���� ���� ��������
	public List<HashMap> teacher(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.teacher");
		ss.close();
		return list;
	}
	
	// ������ ���� ��������
	public List<HashMap> price(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.price");
		ss.close();
		return list;
	}
	
	// ���� ���� ��������
	public List<HashMap> subject(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("classList.subject");
		ss.close();
		return list;
	}
	
	// ������ ����Ʈ ��������
	public List<HashMap> studyList(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("study.studyList");
		ss.close();
		return list;
	}
}
