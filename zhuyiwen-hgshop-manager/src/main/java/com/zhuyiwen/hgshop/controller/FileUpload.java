package com.zhuyiwen.hgshop.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.multipart.MultipartFile;

@Configuration
@PropertySource("classpath:hgshop.properties")
public class FileUpload {
	
	@Value("${pic.savepath}")
	private String uploadPath;
	
	
	/**
	 * 上传
	 * @param file
	 * @return
	 */
	public String uploadd(MultipartFile file ){
		if(file==null)
			return "";
		
		String oName = file.getOriginalFilename();
		//获取扩展名
		String suffixName =oName.substring(oName.lastIndexOf("."));
		
		//随机生成文件的名称
		String fileName = UUID.randomUUID().toString()+suffixName;
		
		//生成目录
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String format = dateFormat.format(new Date());
		
		// 判断路径是否存在 如果不存在则需要创建
		File subPath = new File(uploadPath + "/" + format);
		if(!subPath.exists()) {
			subPath.mkdirs();
		}
		
		try {
			file.transferTo(new File(uploadPath + "/" + format + "/" + fileName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
		return format + "/" + fileName;
		
		
	}
	
}
