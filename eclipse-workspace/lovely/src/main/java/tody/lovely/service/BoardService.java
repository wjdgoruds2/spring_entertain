package tody.lovely.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import tody.prjdoo.common.common.CommandMap;

public interface BoardService {
	List<Map<String, Object>> selectBoardList(CommandMap commandMap);
	List<Map<String, Object>> selectBoardTypeList(Map<String, Object> map);
	List<Map<String, Object>> selectBoardAreaList(Map<String, Object> map);
	List<Map<String, Object>> selectMyBoardList(Map<String, Object> map);
	List<Map<String, Object>> selectMyReplyList(Map<String, Object> map);
	List<Map<String, Object>> selectMyReservationList(Map<String, Object> map);
	void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> viewBoardDetail(Map<String, Object> map);

	Map<String, Object> selectBoardDetail(Map<String, Object> map);

	void updateBoard(Map<String, Object> map);

	void deleteBoard(Map<String, Object> map);

	// 댓글 쓰기
	void insertReply(CommandMap commandMap);

	// 댓글 보기
	List<Map<String, Object>> viewBoardReplydetail(Map<String, Object> map);

	// 댓글 수정
	Map<String, Object> selectReplydDetail(Map<String, Object> map);

	void updateReply(Map<String, Object> map);

	// 댓글 삭제
	void deleteReply(Map<String, Object> map);
	//예약
	 Map<String, Object> viewBoardReservation(Map<String, Object> map);
	 //예약하기
	 void insertReservation(Map<String, Object> map);
	 //예약 취소
	 void deleteReservation(Map<String, Object> map);

}
