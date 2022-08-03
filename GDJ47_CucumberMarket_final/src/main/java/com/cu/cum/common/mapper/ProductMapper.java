package com.cu.cum.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.cu.cum.product.model.vo.Product;

@Mapper
public interface ProductMapper {
	
	@Select("SELECT * FROM (SELECT ROWNUM AS RNUM, P.* FROM (SELECT * FROM PRODUCT)P) WHERE RNUM BETWEEN #{cPage} AND #{numPerpage}")
	List<Product> selectProductList(int cPage, int numPerpage);
	
	@Select("SELECT COUNT(*) FORM PRODUCT")
	int selectProductCount();
}
