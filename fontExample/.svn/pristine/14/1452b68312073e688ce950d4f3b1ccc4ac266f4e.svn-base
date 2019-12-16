package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.entity.*;

@Service
public class StatisticsService {
	@Autowired
	private StatisticsDao dao;
	
	public List<Statistics> findAllByToday() {
		return dao.findAllByToday();
	}
	public List<Statistics> findAll() {
		return dao.findAll();
	}
	public int AddJoin() {
		if(dao.selectTable()==0) {
			dao.insertTable();
		}
		return dao.addJoin();
	}
	public int AddVisit() {
		if(dao.selectTable()==0) {
			dao.insertTable();
		}
		return dao.addVisit();
	}
	public int AddDealCount() {
		if(dao.selectTable()==0) {
			dao.insertTable();
		}
		return dao.addDealCount();
	}
	public int AddDealAmount(long amount) {
		if(dao.selectTable()==0) {
			dao.insertTable();
		}
		return dao.addDealAmount(amount);
	}
	public ArrayList<String> ChartByMonth(int year,int type){
		boolean isYoon = false;
		if(year%4==0) {
			isYoon = true;
		}
		if(year%100==0) {
			isYoon = false;
		}
		if(year%400==0) {
			isYoon = true;
		}
		Map<String,String> map = new HashMap<String, String>();
		ArrayList<String> returnList = new ArrayList<String>();
		String endrow = null;
		for(int i=1;i<13;i++) {
			switch(i) {
				case 1: case 3: case 5:
				case 7:	case 8:	case 10:
				case 12:
					endrow = "31";
					break;
				case 4:	case 6:
				case 9:	case 11:
					endrow = "30";
					break;
				case 2:
					if(isYoon==false)
						endrow="28";
					else
						endrow="29";
					break;
				default : 
					break;
			}
			String startDay = year + "/" + i +"/01";
			String endDay = year + "/" + i +"/" + endrow;
			String result = "";
			switch(type) {
			case 1 :
				result = dao.findVisitCountByMonth(startDay, endDay);
				break;
			case 2 :
				result = dao.findJoinCountByMonth(startDay, endDay);
				break;
			case 3 :
				result = dao.findDealCountByMonth(startDay, endDay);
				break;
			case 4 :
				result = dao.findDealAmountByMonth(startDay, endDay);
			default :
				break;
			}
			if (result==null)
				returnList.add("0");
			else
				returnList.add(result);
		}
		return returnList;
		
	}
}
