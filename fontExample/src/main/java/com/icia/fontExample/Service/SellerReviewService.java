package com.icia.fontExample.Service;

import java.io.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.entity.*;

@Service
public class SellerReviewService {
	@Autowired
	private SellerReviewDao dao;
//	@Autowired
//	private SellerDao sellerDao;
	@Value("#{config['upload.sajin.folder']}")
	private String PROFILE_FOLDER;
	@Value("#{config['download.sajin.uri']}")
	private String PROFILE_URI;
	
	
//	public SellerReview writeSellerReview(SellerReview sellerReview) {
//		dao.insertSR(sellerReview);
//		return sellerReview;
//	}
	
	public String insert(SellReviewInfo sellReviewInfo, MultipartFile productImage, String writer) throws IllegalStateException, IOException {
		System.out.println("서비스 : " + sellReviewInfo);
		
//		Seller seller = new Seller();
//		seller.setUsername(sellReviewInfo.getUsername());
//		seller.setImage(sellReviewInfo.getImage());
		
		SellerReview sellerReview = new SellerReview();
		sellerReview.setUsername(writer);
		sellerReview.setSeller(sellReviewInfo.getUsername());
		sellerReview.setTrust(sellReviewInfo.getTrust());
		sellerReview.setProduct(sellReviewInfo.getProduct());
		sellerReview.setContent(sellReviewInfo.getContent());
		if(productImage !=null) {
			// 업로드한 파일의 contentType이 image인지 확인
			if(productImage.getContentType().toLowerCase().startsWith("image/" )) {
				// 프사의 파일명은 사용자 아이디와 같지만 이미지의 확장자는 여러 종류가 있다
				// 즉 아이디가 hasaway일 경우 프사는 hasaway.jpg일 수도 hasaway.png 일 수도 있다
				// 확장자를 잘라내자
				// 1. 파일이름에서 마지막 . 의 위치를 찾는다
				int lastIndexOfDot = productImage.getOriginalFilename().lastIndexOf('.');
				// 2. 파일 이름에서 마지막 . 뒷 부분을 잘라낸다
				String extension = productImage.getOriginalFilename().substring(lastIndexOfDot);
				// 3. 아이디 뒤에 잘라낸 확장자를 붙인다
				String imageName = sellerReview.getProduct() + extension;
				File file = new File(PROFILE_FOLDER, imageName);
				productImage.transferTo(file);
				String fileUrl = PROFILE_URI + imageName;
				sellerReview.setImage(fileUrl);
			}
		}
		System.out.println(sellerReview);
		dao.insert(sellerReview);
		
//		sellerDao.insert(seller);
		return sellerReview.getNo()+"";
	}
	
//	public int trustUp(long no, String username) {
//		dao.updateTrustUp(no);
//		return dao.findTrustUpDownCnt(no);
//	}
//	
//	public int trustDown(long no, String username) {
//		dao.updateTrustDown(no);
//		return dao.findTrustUpDownCnt(no);
//	}
	
}