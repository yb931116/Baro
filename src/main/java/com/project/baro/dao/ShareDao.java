package com.project.baro.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShareDao{

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Object getList(String sqlMapId, Object dataMap) {	// list select query 실행 함수
		Object result = sqlSession.selectList(sqlMapId, dataMap);

		return result;
	}

	public Object getObject(String sqlMapId, Object dataMap) {  // one select query 실행 함수
		Object result = sqlSession.selectOne(sqlMapId, dataMap);
		
		return result;
	}

	public Object saveObject(String sqlMapId, Object dataMap) {  // insert query 실행 함수
		Integer result = sqlSession.insert(sqlMapId, dataMap);
		
		return result;
	}
	
	public Object updateObject(String sqlMapId, Object dataMap) {  // update query 실행 함수
		Integer result = sqlSession.update(sqlMapId, dataMap);
		
		return result;
	}

	public Object deleteObject(String sqlMapId, Object dataMap) {  // delete query 실행 함수
		
		Integer result = sqlSession.delete(sqlMapId,dataMap);
		return result;
	}

}
