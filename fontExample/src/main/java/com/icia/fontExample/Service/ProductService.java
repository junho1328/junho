package com.icia.fontExample.Service;

import java.io.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.entity.*;

@Service
public class ProductService {
	@Autowired
	private ProductDao dao;
	@Autowired
	private TagDao tagDao;
	@Autowired
	private SellDao SellDao;
	@Value("#{config['upload.sajin.folder']}")
	private String PROFILE_FOLDER;
	@Value("#{config['download.sajin.uri']}")
	private String PROFILE_URI;
	
	public String insert(UploadInfo uploadInfo, MultipartFile productImage) throws IllegalStateException, IOException {
		System.out.println("서비스" + uploadInfo);
		Product product = new Product();
		product.setName(uploadInfo.getName());
		product.setLno(uploadInfo.getLno());
		product.setSno(uploadInfo.getSno());
		product.setPrice(uploadInfo.getPrice());
		product.setQuantity(uploadInfo.getQuantity());
		
		if (productImage != null) {
			// 업로드한 파일의 contentType이 image인지 확인
			if (productImage.getContentType().toLowerCase().startsWith("image/")) {
				// 프사의 파일명은 사용자 아이디와 같지만 이미지의 확장자는 여러 종류가 있다
				// 즉 아이디가 hasaway일 경우 프사는 hasaway.jpg일 수도 hasaway.png 일 수도 있다
				// 확장자를 잘라내자
				// 1. 파일이름에서 마지막 . 의 위치를 찾는다
				int lastIndexOfDot = productImage.getOriginalFilename().lastIndexOf('.');
				// 2. 파일 이름에서 마지막 . 뒷 부분을 잘라낸다
				String extension = productImage.getOriginalFilename().substring(lastIndexOfDot);
				// 3. 아이디 뒤에 잘라낸 확장자를 붙인다
				String imageName = product.getName() + extension;
				File file = new File(PROFILE_FOLDER, imageName);
				productImage.transferTo(file);
				String fileUrl = PROFILE_URI + imageName;
				product.setImage(fileUrl);
			}
		}
		
		dao.insert(product);
		if(uploadInfo.getTag1() != null) {
			Tag tag1 = new Tag();
			tag1.setName(uploadInfo.getTag1());
			if(tagDao.tagCheck(tag1.getName())==null) {
				tagDao.tagInsert(tag1);	
			}
		}
		if(uploadInfo.getTag2() != null) {
			Tag tag2 = new Tag();
			tag2.setName(uploadInfo.getTag2());
			if(tagDao.tagCheck(tag2.getName())==null) {
				tagDao.tagInsert(tag2);	
			}
		}
		if(uploadInfo.getTag3() != null) {
			Tag tag3 = new Tag();
			tag3.setName(uploadInfo.getTag3());	
			if(tagDao.tagCheck(tag3.getName())==null) {
				tagDao.tagInsert(tag3);	
			}
		}
		if(uploadInfo.getTag4() != null) {
			Tag tag4 = new Tag();
			tag4.setName(uploadInfo.getTag4());
			if(tagDao.tagCheck(tag4.getName())==null) {
				tagDao.tagInsert(tag4);	
			}
		}
		if(uploadInfo.getTag5() != null) {
			Tag tag5 = new Tag();
			tag5.setName(uploadInfo.getTag5());
			if(tagDao.tagCheck(tag5.getName())==null) {
				tagDao.tagInsert(tag5);	
			}
		}
		if(uploadInfo.getTag6() != null) {
			Tag tag6 = new Tag();
			tag6.setName(uploadInfo.getTag6());
			if(tagDao.tagCheck(tag6.getName())==null) {
				tagDao.tagInsert(tag6);	
			}
		}
		if(uploadInfo.getTag7() != null) {
			Tag tag7 = new Tag();
			tag7.setName(uploadInfo.getTag7());
			if(tagDao.tagCheck(tag7.getName())==null) {
				tagDao.tagInsert(tag7);	
			}
		}
		if(uploadInfo.getTag8() != null) {
			Tag tag8 = new Tag();
			tag8.setName(uploadInfo.getTag8());
			if(tagDao.tagCheck(tag8.getName())==null) {
				tagDao.tagInsert(tag8);	
			}
		}
		if(uploadInfo.getTag9() != null) {
			Tag tag9 = new Tag();
			tag9.setName(uploadInfo.getTag9());
			if(tagDao.tagCheck(tag9.getName())==null) {
				tagDao.tagInsert(tag9);	
			}
		}
		if(uploadInfo.getTag10() != null) {
			Tag tag10 = new Tag();
			tag10.setName(uploadInfo.getTag10());
			if(tagDao.tagCheck(tag10.getName())==null) {
				tagDao.tagInsert(tag10);	
			}
		}
		Sell sell = new Sell();
		sell.setArea(uploadInfo.getPostcode2());
		sell.setProduct_no(product.getNo());
		sell.setInfomation(uploadInfo.getInformation());
		sell.setUsername(uploadInfo.getUsername());
		sell.setBlock(0);
		SellDao.insert(sell);
		
		return product.getNo()+"";
	}
	public List<Product> findAllProduct() {
		return dao.findAllProduct();
	}
	public Product findProduct(long no) {
		return dao.findProduct(no);
	}
	public long findPriceByProduct(long no) {
		return dao.findPriceByProduct(no);
	}
	//제품 숫자 조정 (제품 추가시 +)
	public String updateQuantity(long no,int quantity) {
		try {
			int productQuantity = dao.findQuantityByProduct(no);
			if(productQuantity>quantity) {
				dao.updateQuantity(no, quantity);
			} else {
				dao.updateStateWhereSoldOut(no);
			}
			return "OK";
		}catch(Exception e) {
			return "제품 주입 중 오류가 발생하였습니다.";
		}
	}
	public void delete(long no) {
		dao.delete(no);
	}

}