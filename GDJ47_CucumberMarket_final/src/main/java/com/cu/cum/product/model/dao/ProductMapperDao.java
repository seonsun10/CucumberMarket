package com.cu.cum.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.cum.product.model.vo.Product;
import com.cu.cum.product.model.vo.Review;

@Repository
public class ProductMapperDao {

	public List<Product> selectProductList(SqlSessionTemplate session, Map page){
		int cPage = (int)page.get("cPage");
		int numPerpage = (int)page.get("numPerpage");
		String userId = (String)page.get("userId");
		return session.selectList("product.selectProductList",userId,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	
	public int selectProductCount(SqlSessionTemplate session, String userId) {
		return session.selectOne("product.selectProductCount",userId);
	}
	
	public Product selectProduct(SqlSessionTemplate session, int proNo) {
		return session.selectOne("product.selectProduct");
	}
	
	public int insertReview(SqlSessionTemplate session, Review review) {
		return session.insert("product.insertReview",review);
	}
		
}
