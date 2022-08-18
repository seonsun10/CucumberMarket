package com.cu.cum.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.notice.model.dao.NoticeDao;
import com.cu.cum.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao dao;
	
	@Override
	public int selectNoticeListCnt() {
		return dao.selectNoticeListCnt();
	}

	@Override
	public int insertNotice(Notice vo) {
		return dao.insertNotice(vo);
	}

	@Override
	public int updateNoticeById(Notice vo) {
		return dao.updateNoticeById(vo);
	}

	@Override
	public List<Notice> searchNoticeList(Map<String, String> param) {
		return dao.searchNoticeList(param);
	}

	@Override
	public int deleteNoticeById(String n_id) {
		return dao.deleteNoticeById(n_id);
	}

	@Override
	public Notice searchNoticeById(String n_id) {
		return dao.searchNoticeById(n_id);
	}
}