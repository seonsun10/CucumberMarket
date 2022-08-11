package com.cu.cum.wishlist.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.wishlist.model.dao.WishListDao;
import com.cu.cum.wishlist.model.dao.WishMapper;
import com.cu.cum.wishlist.model.vo.WishList;

@Service
public class WishListServiceImpl implements WishListService {

	@Autowired
	private WishListDao dao;
	

	@Autowired WishMapper mdao;
	
	@Override
	public WishList checkWishlist(Member m, Product p) {
		return dao.findByMemberAndProduct(m,p);
	}

	@Override
	public WishList insertWishlist(WishList wl) {
		return dao.save(wl);
	}
	
	@Override
	public int deleteWishlist(String id, int no) {
		return dao.deleteWishList(id,no);
	}
	
	@Override
	public int checkidWishlist(SqlSessionTemplate session,WishList wl) {
		return session.selectOne("wish.checkwish",wl);
	}
	
	//찜 객체 조회
	@Override
	public WishList findByWishId(int wishNo) {
		// TODO Auto-generated method stub
		return dao.findByWishId(wishNo);
	}
	
	//찜 목록 조회
	@Override
	public List<WishList> selectWishList(Member m) {
		// TODO Auto-generated method stub
//		return mdao.selectWishList(userId);
		return dao.findAllByMember(m);
	}

	//찜 선택 삭제
	@Override
	public void deleteWishListAll(List<WishList> dibsList) {
		// TODO Auto-generated method stub
		dao.deleteAll(dibsList);
	}

}
