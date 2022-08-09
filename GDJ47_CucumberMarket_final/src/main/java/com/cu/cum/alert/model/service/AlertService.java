package com.cu.cum.alert.model.service;

import java.util.List;
import java.util.Map;

import com.cu.cum.alert.model.vo.Alert;

public interface AlertService {

	public int selectNewNotifyCnt(String userid);	// 신규 알림 카운트
	public int selectOldNotifyCnt(String userid);	// 읽은 알림 카운트
	public int selectnewChatCnt(String userid); //신규 채팅 카운트
	public List<Alert> searchNewNotifyList(String userid);					// 신규 알림 리스트 
	public List<Alert> searchOldNotifyList(String userid);	// 읽은 알림 리스트
	public int updateNotifyChecked(Map<String, String> param);					// 읽음 상태 변경
	public int insertNotify(Alert vo);									// 신규 알림 등록
}
