package com.cu.cum.alert.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.alert.model.dao.CommonDao;
@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	CommonDao dao;
	
	@Override
	public int selectCompareTime(String regTime) {
		// TODO Auto-generated method stub
		return dao.selectCompareTime(regTime);
	}
	
}
