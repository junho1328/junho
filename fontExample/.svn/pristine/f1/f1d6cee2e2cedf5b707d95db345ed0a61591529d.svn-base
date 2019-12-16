package com.icia.fontExample.Service;

import java.io.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.util.*;
import org.springframework.web.client.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import com.icia.fontExample.Dao.*;
import com.icia.fontExample.Dto.*;
import com.icia.fontExample.date.dto.*;
import com.icia.fontExample.entity.*;

@Service
public class PaymentService {
	@Autowired
	private PointDao dao;
	@Autowired
	private PaymentDao payDao;
	ObjectMapper mapper = new ObjectMapper();
	public int increasePoint(String username,long point) {
		return dao.increasePoint(username, point);
	}
	public int decreasePoint(String username,long point) {
		return dao.decreasePoint(username, point);
	}
	public long findPointByUsername(String username) {
		return dao.findPointByUsername(username);
	}
	public PaymentPage findAllByPage(int pageno,int pagesize){
		int count = payDao.findCount();
		int startRowNum = (pageno-1) * pagesize + 1;
		int endRowNum = pageno * pagesize;
		if(endRowNum==count) {
			endRowNum=count;
		}
		List<Payment> result = payDao.findByPage(startRowNum, endRowNum);
		return PaymentPage.builder().pageno(pageno).pagesize(pagesize).totalcount(count).payment(result).build();
	}
	public PaymentPage findAllByPageByUsername(int pageno,int pagesize,String username){
		int count = payDao.findCountByUsername(username);
		int startRowNum = (pageno-1) * pagesize + 1;
		int endRowNum = pageno * pagesize;
		if(endRowNum==count) {
			endRowNum=count;
		}
		List<Payment> result = payDao.findByPageByUsername(startRowNum, endRowNum, username);
		return PaymentPage.builder().pageno(pageno).pagesize(pagesize).totalcount(count).payment(result).build();
	}
	public PaymentDto loadPayInfo(String imp_uid,String statue) throws JsonParseException, JsonMappingException, IOException {
		HttpHeaders header = new HttpHeaders();
		PaymentDto value = null;
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		header.add("Accept", "application/json");
		header.add("Connection","keep-alive");
		header.add("Content-Type", "application/json");
		header.add("Authorization", getToken());
		if(statue.equals("check")) {
			final HttpEntity<String> entity = new HttpEntity<String>(header);
			String url = "https://api.iamport.kr/payments/" + imp_uid;
			RestTemplate tpl = new RestTemplate();
			ResponseEntity<String> response = tpl.exchange(url,HttpMethod.GET,entity, String.class);
			value = mapper.readValue(response.getBody(), PaymentDto.class);
		} else {
			String url = "https://api.iamport.kr/payments/cancel";
			map.add("imp_uid",imp_uid);
			RestTemplate tpl = new RestTemplate();
			final HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<MultiValueMap<String, String>>(map,header);
			String results = tpl.postForObject(url, entity, String.class);
			value = mapper.readValue(results, PaymentDto.class);
		}
		return value;
	}
	public Map<String,Object> paymentCheck(String imp_uid,long amount,String username) throws JsonParseException, JsonMappingException, IOException{
		Map<String,Object> maps = new HashMap<String,Object>();
		PaymentDto value = loadPayInfo(imp_uid,"check");
		if(amount==value.getResponse().getAmount()) {
			if(value.getResponse().getStatus().equals("paid")) {
				increasePoint(username, amount);
				maps.put("msg","payment success");
				WritePayment(value.getResponse(), username);
			} else if(value.getResponse().getStatus().equals("ready")) {
				maps.put("msg","vbank ready");
				maps.put("bank",value.getResponse().getVbank_name());
				maps.put("access",value.getResponse().getVbank_num());
				maps.put("name",value.getResponse().getVbank_name());
				WritePayment(value.getResponse(), username);
			} else {
				maps.put("msg","Error");
			}
		} else {
			maps.put("msg","Error");
		}
		return maps;
	}
	public String paidCheck(long no) throws JsonParseException, JsonMappingException, IOException {
		String imp_uid = payDao.findImpByNo(no);
		PaymentDto value = loadPayInfo(imp_uid,"check");
		String statue = value.getResponse().getStatus();
		String statueInDB = payDao.findStatueByNo(no);
		if(statueInDB.equals("ready")) {
			if(statue.equals("paid")) {
				long addpoint = value.getResponse().getAmount();
				String username = payDao.findUsernameByNo(no);
				increasePoint(username, addpoint);
				payDao.updateStatue(no, statue);
				return "가상계좌 입금이 확인되었습니다.";
			} else {
				return "입금대기 상태입니다.";
			}
		} else if (statueInDB.equals("paid"))
			return "결제완료 상태입니다.";
		else 
			return "취소하거나 결제실패된 상품입니다.";
	}
	public String getToken() throws JsonParseException, JsonMappingException, IOException {
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("imp_key", "6790520257564565");
		map.add("imp_secret", "oIB9RoAu9xxKLA1ikBWO6AnEeLyIVu3jcEt423ycA6XlGYE1ABQGbdkqZT9UnceAQHFTLe6lk3H11m3B");
		RestTemplate tpl = new RestTemplate();
		String getToken = tpl.postForObject("https://api.iamport.kr/users/getToken", map, String.class);
		PayAuthDto result = mapper.readValue(getToken,PayAuthDto.class);
		return result.getResponse().getAccess_token();
	}
	public int WritePayment(PaymentInfoDto dto,String username) {
		Payment payment = new Payment();
		payment.setUsername(username);
		payment.setAmount(dto.getAmount());
		payment.setStatue(dto.getStatus());
		payment.setImpAid(dto.getImp_uid());
		payment.setVBankAccount(dto.getVbank_num());
		payment.setVBankBank(dto.getVbank_name());
		payment.setVBankName(dto.getVbank_holder());
		return payDao.insert(payment);
	}
	public String paymentCancel(long no) throws JsonParseException, JsonMappingException, IOException{
		String imp_uid = payDao.findImpByNo(no);
		PaymentDto value = loadPayInfo(imp_uid, "cancel");
		if(value.getResponse().getStatus().equals("cancelled")) {
			String username = payDao.findUsernameByNo(no);
			long point = payDao.findAmountByNo(no);
			dao.decreasePoint(username, point);
			payDao.delete(imp_uid);
			return "정상적으로 취소되었습니다.";
		}
		return "취소 과정 중에 문제가 발생하였습니다.";
	}
	public String checkFinalPayment(String username, String finalPayment) {
		long point = dao.findPointByUsername(username);
		int payment = Integer.parseInt(finalPayment);
		if(point <= payment) {
			return "1";
		}else {
			return "0";
		}
	}
	public Object waitingPoint(String username,long product_no, long point, String sellerUsername) {
		Purchase purchase = new Purchase();
		purchase.setProduct_no(product_no);
		purchase.setUsername(username);
		purchase.setMethod(0);
		purchase.setState(0);
		return null;
	}
}
