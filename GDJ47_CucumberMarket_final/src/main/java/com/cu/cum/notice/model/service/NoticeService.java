package com.cu.cum.notice.model.service;

import java.util.List;
import java.util.Map;

import com.cu.cum.notice.model.vo.Notice;

public interface NoticeService {
	
	public int selectNoticeListCnt();	// 게시글 수 조회
	public int insertNotice(Notice vo);	// 공지작성
	public int updateNoticeById(Notice vo);	// 공지수정
	public List<Notice> searchNoticeList(Map<String, String> param); // 공지리스트 조회
	public int deleteNoticeById(String n_id);	// 공지삭제
	public Notice searchNoticeById(String n_id);	// 수정폼 전달

}
