package com.spring.workout.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "C:\\Users\\IBK\\eclipse-workspace\\workout_login2_RealFinal_190130\\src\\main\\webapp\\WEB-INF\\views\\images\\";
	
	public String parseInsertFileInfo(MultipartHttpServletRequest multipartRequest) throws Exception{
		
		Iterator<String> iterator = multipartRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = multipartRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				
				originalFileName = multipartFile.getOriginalFilename();
				file = new File(filePath + originalFileName);
				multipartFile.transferTo(file);
				
			}
		}
		return originalFileName;
	}
}
