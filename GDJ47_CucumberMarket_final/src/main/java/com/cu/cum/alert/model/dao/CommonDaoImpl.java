package com.cu.cum.alert.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDaoImpl implements CommonDao {
	@Autowired
	SqlSession sqlSession;
	

	@Override
	public int selectCompareTime(String regTime) {
		return sqlSession.selectOne("alert.selectCompareTime", regTime);
	}
}
