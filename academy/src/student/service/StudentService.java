package student.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class StudentService {
	@Autowired
	SqlSessionFactory fac;
	
	// 학생 검색
	public List<HashMap> info(String name){
//		SqlSession ss = fac.openSession();
//		List<HashMap> list = ss.selectList("student.info", name);
//		ss.close();
		return new Vector<>();
	}
}
