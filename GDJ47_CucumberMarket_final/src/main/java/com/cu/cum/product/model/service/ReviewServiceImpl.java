package com.cu.cum.product.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.product.model.dao.ReviewDao;
import com.cu.cum.product.model.vo.Review;
@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao dao;
	
	@Override
	public Review insertReview(Review rv) {
		// TODO Auto-generated method stub
		return dao.save(rv);
	}

}
