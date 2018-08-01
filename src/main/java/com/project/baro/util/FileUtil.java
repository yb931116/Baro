package com.project.baro.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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

	public static String getNewFileName(String fileName) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSS");
		return fileName.substring(0, fileName.lastIndexOf(".")) + "_" + dateFormat.format(System.currentTimeMillis());
	}

	public List<Object> setMultipartList(MultipartHttpServletRequest multipartRequest) {
		List<Object> fileList = new ArrayList<Object>();
		Iterator<String> multiFileList = multipartRequest.getFileNames();
		String multiFileName = null;
		while (multiFileList.hasNext()) {
			Map<Object, Object> fileMap = new HashMap<Object, Object>();
			String fileName = multiFileList.next();
			MultipartFile multiFile = multipartRequest.getFile(fileName);
			multiFileName = FileUtil.getNewFileName(multiFile.getOriginalFilename());
			String attachFileName = "c://temp//" + multiFileName;
			String fileSize = multiFile.getSize() + ""; // 1KByte -> 1048)
			String fileContentType = multiFile.getContentType(); // jpg ->images/JPEG
			try { // DB information
				multiFile.transferTo(new File(attachFileName));
				fileMap.put("ATTACHFILE_SEQ", commonUtil.getUniqueSequence());
				fileMap.put("PHYSICALFILE_NAME", multiFileName);
				fileList.add(fileMap);
			} catch (Exception e) {
				File file = new File(attachFileName);
				file.delete();
				e.printStackTrace();
			}
		}
		return fileList;
	}

}
