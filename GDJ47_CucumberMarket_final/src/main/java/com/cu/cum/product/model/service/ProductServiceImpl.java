package com.cu.cum.product.model.service;



import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.dao.FilesDao;
import com.cu.cum.product.model.dao.ProductDao;
import com.cu.cum.product.model.dao.ProductMapperDao;
import com.cu.cum.product.model.dao.ProductWishListDao;
import com.cu.cum.product.model.vo.Files;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.product.model.vo.Review;
import com.cu.cum.wishlist.model.vo.WishList;


@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao dao;
	

	@Autowired
	private ProductMapperDao pmdao;
	
	@Autowired
	private ProductWishListDao wdao;
	
	@Autowired
	private SqlSessionTemplate session;

	
	@Autowired
	private FilesDao fDao;
	
	@Override
	public Product insertProduct(Product p) {
		Product result = dao.saveAndFlush(p);
		return result;
	}
	

	@Override
	public int selectProductCount(String userId) {
		// TODO Auto-generated method stub
		return pmdao.selectProductCount(session, userId);
	}
	
	@Override
	public List<Product> selectProductList(Map page) {
		// TODO Auto-generated method stub
		return pmdao.selectProductList(session, page);
	}
	
	//거래후기
	@Override
	public Product insertReview(Product p) {
		// TODO Auto-generated method stub
		return dao.save(p);
	}
	
	//상품 조회
	@Override
	public Product selectProduct(int proNo) {
		// TODO Auto-generated method stub
		return dao.findById(proNo);
	}
	
	//상품 삭제
	@Override
	public Product deleteProduct(int proNo) {
		// TODO Auto-generated method stub
		return dao.deleteById(proNo);
	}
	
	//리뷰 수 조회
	@Override
	public int selectReviewCount(String userId) {
		// TODO Auto-generated method stub
		return pmdao.selectReviewCount(session, userId);
	}
	
	//상품 리뷰 리스트 조회
	public List<Review> selectReviewList(Map map){
		return pmdao.selectReviewList(session, map);
	}



	//유저가 가지고 있는 상품 조회
	public List<Product> selectUserProductList(Map page, String userId) {
		return pmdao.selectUserProductList(session,page,userId);
	}
	//ㅉ리스트
	public List<Product> selectWishList(Map map){
		return pmdao.selectWishList(session, map);
	}
	//ㅉ카운트
	public int selectWishCount(String id) {
		return pmdao.selectWishCount(session, id);

	}

	//방번호로 상품정보가져오기
	public Product selectProduct(String roomid) {
		return pmdao.selectProduct(session, roomid);
	}
	//상품상태 변경 
	public int updateProductSolve(int no) {
		return pmdao.updateProductSolve(session,no);
	}
	//판매완료상품개수
	public int selectSolveCount(String userId) {
		return pmdao.selectSolveCount(session,userId);
	}



	
	
	@Override
	public List<Product> mainProductList() {
		
		return pmdao.mainProductList(session);
	}


//	@Override
//	public List<Files> mainFilesList() {
//		return pmdao.mainFilesList(session);
//	}

	public List<Product> findAllByCategoryName(Pageable p,String tag){
		return dao.findAllByCategoryName(p,tag).getContent();
	}
	
	//카테고리 상품 개수
	@Override
	public int selectCategoryCount(String tag) {
		// TODO Auto-generated method stub
		return pmdao.selectCategoryCount(session,tag);
	}

	
	//위시리스트
	@Override
	public WishList checkWishlist(Member m, Product p) {
		return wdao.findByMemberAndProduct(m,p);
	}

	
	//상품상제페이지
	@Override
	public Product productCheck(int no) {
		return dao.findById(no);
	}


	@Override
	public List<Product> relProduct(Map param) {
		return pmdao.relProduct(session,param);
	}





	@Override
	public List<Files> selectFiles(Product p) {
		return fDao.findByProduct(p);
	}



}

	

