package com.project.baro.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUtil {

	@Autowired
	CommonUtil commonUtil;

	/**
	 * 생성자
	 */
	public FileUtil() {
		// default Constructor
	}


	public List<Object> setMultipartList(HttpServletRequest req) {
		List<Object> fileList = new ArrayList<Object>();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)req;
		Iterator<String> multiFileList = multipartRequest.getFileNames();
		String multiFileName = null;
		
		while (multiFileList.hasNext()) {
			Map<Object, Object> fileMap = new HashMap<Object, Object>();
			String fileName = multiFileList.next();
			MultipartFile multiFile = multipartRequest.getFile(fileName);
			multiFileName = multiFile.getOriginalFilename();
			String fileDirectory = req.getSession().getServletContext().getRealPath("resources/upload/") + multiFileName;
			String fileType =  FilenameUtils.getExtension(multiFile.getOriginalFilename()); // 
			try { // DB information
				multiFile.transferTo(new File(fileDirectory));
				fileMap.put("ATTACHED_FILE_NO", commonUtil.getUniqueSequence());
				fileMap.put("ATTACHED_FILE_NAME", multiFileName);
				fileMap.put("ATTACHED_FILE_DIRECTORY", fileDirectory);
				fileMap.put("ATTACHED_FILE_TYPE", fileType);
				fileList.add(fileMap);
			} catch (Exception e) {
				File file = new File(fileDirectory);
				file.delete();
				e.printStackTrace();
			}
		}
		return fileList;
	}

}
