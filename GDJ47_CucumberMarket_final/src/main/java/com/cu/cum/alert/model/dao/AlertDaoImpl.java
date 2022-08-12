package com.cu.cum.alert.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cu.cum.alert.model.vo.Alert;
import com.cu.cum.test.model.vo.MessageContent;

@Repository
public class AlertDaoImpl implements AlertDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int selectNewNotifyCnt(String userId) {
		return sqlSession.selectOne("alert.selectNewNotifyCnt", userId);
	}
	@Override
	public int selectNewChatCnt(String userId) {
		return sqlSession.selectOne("alert.selectNewChatCnt", userId);
	}
	@Override
	public int selectOldNotifyCnt(String userId) {
		return sqlSession.selectOne("alert.selectOldNotifyCnt", userId);
	}

	@Override
	public List<Alert> searchNewNotifyList(String userId) {
		return sqlSession.selectList("alert.searchNewNotifyList", userId);
	}

	@Override
	public List<Alert> searchOldNotifyList(String userId) {
		return sqlSession.selectList("alert.searchOldNotifyList", userId);
	}

	@Override
	public List<MessageContent> searchNewChatList(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("alert.searchNewChatList", userid);
	}
	@Override
	public List<MessageContent> searchOldChatList(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("alert.searchOldChatList", userid);
	}
	@Override
	public int updateNotifyChecked(Map<String, String> param) {
		return sqlSession.update("alert.updateNotifyChecked", param);
	}

	@Override
	public int insertNotify(Alert vo) {
		return sqlSession.insert("alert.insertNotify", vo);
	}

}
