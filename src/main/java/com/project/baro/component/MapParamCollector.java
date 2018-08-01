package com.project.baro.component;

import java.util.HashMap;
import java.util.Map;

public class MapParamCollector {

	Map<String,Object> map = new HashMap<String,Object>();
	
	
	public Map<String, Object> getMap(){
		return this.map;
	}
	
	public String get(Object key) {
		return (String)map.get(key);
	}
	
	public void put(String key, Object value) {
		this.map.put(key,value);
	}
}
