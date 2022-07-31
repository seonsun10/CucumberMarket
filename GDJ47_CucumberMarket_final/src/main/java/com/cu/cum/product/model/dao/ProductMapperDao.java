package com.cu.cum.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.cum.product.model.vo.Product;

@Repository
public class ProductMapperDao {

	public List<Product> selectProductList(SqlSessionTemplate session, Map page){
		int cPage = (int)page.get("cPage");
		int numPerpage = (int)page.get("numPerpage");
		
		return session.selectList("product.selectProductList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	
	public int selectProductCount(SqlSessionTemplate session) {
		return session.selectOne("product.selectProductCount");
	}
	
}
