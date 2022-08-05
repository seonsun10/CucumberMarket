package com.cu.cum.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface MemberMapper {
	@Update("update member set view_count = view_count + 1 where userId=#{writer}")
	int updateViewCount(String writer);
	
	//조회수 가져오기
	@Select("select view_count from member where userId=#{writer}")
	int selectViewCount(String writer);
	//
}
