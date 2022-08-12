package com.cu.cum.alert.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.alert.model.dao.AlertDao;
import com.cu.cum.alert.model.vo.Alert;
import com.cu.cum.test.dao.ChatDao;
import com.cu.cum.test.model.vo.ChatRoom;
import com.cu.cum.test.model.vo.MessageContent;

@Service
public class AlertServiceImpl implements AlertService {


	@Autowired
	AlertDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	

	@Override
	public int selectNewNotifyCnt(String userid) {
		return dao.selectNewNotifyCnt(userid);
	}
	@Override
	public int selectnewChatCnt(String userid) {
		return dao.selectNewChatCnt(userid);
	}

	@Override
	public int selectOldNotifyCnt(String userid) {
		return dao.selectOldNotifyCnt(userid);
	}

	@Override
	public List<Alert> searchNewNotifyList(String userid) {
		return dao.searchNewNotifyList(userid);
	}
	@Override
	public List<MessageContent> searchNewChatList(String userid) {
		return dao.searchNewChatList(userid);
	}
	

	@Override
	public List<Alert> searchOldNotifyList(String userid) {
		return dao.searchOldNotifyList(userid);
	}
	
	@Override
	public List<MessageContent> searchOldChatList(String userid) {
		return dao.searchOldChatList(userid);
	}

	@Override
	public int updateNotifyChecked(Map<String, String> param) {
		return dao.updateNotifyChecked(param);
	}
	

	@Override
	public int insertNotify(Alert vo) {
		return dao.insertNotify(vo);
	}

	
	
}
