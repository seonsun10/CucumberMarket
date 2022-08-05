package com.cu.cum.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.cum.product.model.vo.Files;

@Repository
public class FilesMapper {

	public List<Files> selectUserFiles(SqlSessionTemplate session, String userId) {
		return session.selectList("product.selectUserFiles",userId);
	}

}
