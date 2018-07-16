package com.project.baro.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.baro.dao.ShareDao;

@Service
public class LogicFocusService {

	@Autowired
	ShareDao dao;

	public Object getList(Object dataMap) {
		String sqlMapId;
		Object resultObject = null;

		if (((Map) dataMap).get("search") == null) {
			sqlMapId = "list.list";
			resultObject = dao.getList(sqlMapId, dataMap);
		} else if (((Map) dataMap).get("search").equals("true")) {
			sqlMapId = "list.search";
			resultObject = dao.getList(sqlMapId, dataMap);
		}

		return resultObject;
	}

	public Object saveObject(Map<String, Object> dataMap) {

		String sqlMapId = "list.insert";
		Object resultObject = dao.saveObject(sqlMapId, dataMap);

		return resultObject;
	}

	public Object getProject(Object dataMap) {
		String SqlMapId = "read.list";
		List resultObject = (List) dao.getList(SqlMapId, dataMap);
		List ProList = new ArrayList<>();
		List AnsList = new ArrayList<>();
		Boolean insert = false;

		for (int i = 0; i < resultObject.size(); i++) {
			Map temp_Pro = new HashMap<>();
			if (((String) ((temp_Pro = (Map) resultObject.get(i)).get("category"))).equalsIgnoreCase("problem")) {
				for (int j = 0; j < resultObject.size(); j++) {
					Map temp_Ans = new HashMap<>();
					if (((String) ((temp_Ans = (Map) resultObject.get(j)).get("category"))).equalsIgnoreCase("answer")) {
						if(((String)(temp_Pro.get("original_no"))).equalsIgnoreCase((String)(temp_Ans.get("source_no")))) {
							ProList.add(temp_Pro);
							AnsList.add(temp_Ans);
							insert = true;
						}
					}
				}
				if(insert == false) {
					ProList.add(temp_Pro);
					AnsList.add("nothing");
				}
			}
			insert = false;
		}

		Map resultMap = new HashMap<>();

		resultMap.put("business_no", ((Map) dataMap).get("business_no"));
		resultMap.put("business_name", ((Map) dataMap).get("business_name"));
		resultMap.put("ProList", ProList);
		resultMap.put("AnsList", AnsList);

		return resultMap;
	}
}
