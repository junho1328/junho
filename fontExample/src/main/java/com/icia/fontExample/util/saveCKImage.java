package com.icia.fontExample.util;

import java.io.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.fasterxml.jackson.databind.*;

@Component
public class saveCKImage {
	@Value("#{config['upload.ckeditor.image']}")
	String ckUpload;
	@Value("#{config['download.ckeditor.uri']}")
	String ckUploadUri;
	@Autowired
	private ObjectMapper objectMapper;
	
	public String saveCKImages(MultipartFile upload) throws IllegalStateException, IOException {
		Map<String,String> map = new HashMap<String,String>();
		if(upload!=null) {
			if(upload.getContentType().toLowerCase().startsWith("image/")) {
				String imageName = UUID.randomUUID().toString() + ".jpg";
				File file = new File(ckUpload,imageName);
				upload.transferTo(file);
				String fileUrl = ckUploadUri + imageName;
				map.put("uploaded","1");
				map.put("fileName",imageName);
				map.put("url",fileUrl);
				return objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);
			}
		}
		return null;
	}
}
