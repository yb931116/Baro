package com.project.baro.util;

import java.util.UUID;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class CommonUtil {
	public String getUniqueSequence(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replaceAll("-", "");
	}
	
		public String encodePassword(String password) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String cryptPassword =encoder.encode(password);
			return cryptPassword;
		}
	
}
