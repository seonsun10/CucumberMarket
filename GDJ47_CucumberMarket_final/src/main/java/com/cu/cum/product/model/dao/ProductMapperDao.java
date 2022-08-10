package com.cu.cum.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.cum.product.model.vo.Files;
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
	
	//전체 리뷰 수 조회
	public int selectReviewCount(SqlSessionTemplate session, String userId) {
		return session.selectOne("product.selectReviewCount",userId);
	}
	
	//상품 리뷰 리스트 조회
	public List<Review> selectReviewList(SqlSessionTemplate session, Map page){
		int cPage = (int)page.get("cPage");
		int numPerpage = (int)page.get("numPerpage");
		String userId = (String)page.get("userId");
		return session.selectList("product.selectReviewList",userId,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	
	//테스트용
	public List<Product> selectall(SqlSessionTemplate session){
		return session.selectList("product.selectall");
	}
	public Product selectProduct(SqlSessionTemplate session,int id) {
		return session.selectOne("product.selectproduct",id);
	}


	public List<Product> selectUserProductList(SqlSessionTemplate session, Map page, String userId) {
		int cPage = (int)page.get("cPage");
		int numPerpage = (int)page.get("numPerpage");
		return session.selectList("product.selectUserProductList",userId,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	//찜목록 페이징처리
	public List<Product> selectWishList(SqlSessionTemplate session,Map page){
		int cPage = (int)page.get("cPage");
		int numPerpage = (int)page.get("numPerpage");
		String userId = (String)page.get("userId");
		return session.selectList("product.selectWishList", userId, new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	//찜목록 카운트
	public int selectWishCount(SqlSessionTemplate session,String id) {
		return session.selectOne("product.selectWishCount",id);
		
	}
	//방번호로 상품가져오기
	public Product selectProduct(SqlSessionTemplate session,String roomid) {
		return session.selectOne("product.selectproductroomid",roomid);
	}
	//판매상태변경
	public int updateProductSolve(SqlSessionTemplate session,int no) {
		return session.update("product.updateproductsolve",no );
	}
	//판매완료개수
	public int selectSolveCount(SqlSessionTemplate session,String userId) {
		return session.selectOne("product.selectsolvecount",userId);
	}

	public List<Product> mainProductList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("product.mainProductList");
	}

//	public List<Files> mainFilesList(SqlSessionTemplate session) {
//		return session.selectList("product.mainFilesList");
//		
//	}

	
	//카테고리 상품 개수
	public int selectCategoryCount(SqlSessionTemplate session, String tag) {
		return session.selectOne("product.selectCategoryCount",tag);
	}
	
	
	

}
