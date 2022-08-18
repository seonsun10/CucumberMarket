package com.cu.cum.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cu.cum.notice.model.vo.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {


	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int selectNoticeListCnt() {
		return sqlSession.selectOne("notice.selectNoticeListCnt");
	}

	@Override
	public int insertNotice(Notice vo) {
		return sqlSession.insert("notice.insertNotice", vo);
	}

	@Override
	public int updateNoticeById(Notice vo) {
		return sqlSession.update("notice.updateNoticeById", vo);
	}

	@Override
	public List<Notice> searchNoticeList(Map<String, String> param) {
		return sqlSession.selectList("notice.selectNoticeList", param);
	}

	@Override
	public int deleteNoticeById(String n_id) {
		return sqlSession.delete("notice.deleteNoticeById", n_id);
	}

	@Override
	public Notice searchNoticeById(String n_id) {
		return sqlSession.selectOne("notice.selectNoticeById", n_id);
	}

}
