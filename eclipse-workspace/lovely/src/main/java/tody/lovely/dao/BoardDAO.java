package tody.lovely.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import tody.prjdoo.common.common.CommandMap;
import tody.lovely.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(CommandMap commandMap) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("board.selectBoardList", commandMap);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardTypeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("board.selectBoardTypeList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardAreaList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("board.selectBoardAreaList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyBoardList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("board.selectMyBoardList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyReplyList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("board.selectMyReplyList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyReservationList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("board.selectMyReservationList", map);
	}

	public void insertBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert("board.insertBoard", map);

	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> detailBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("board.detailBoard", map);
	}

	public void updateHitBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.updateHitBoard", map);
	}

	public void updateBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.updateBoard", map);
	}

	public void updateFile(Map<String, Object> map) throws Exception {
		update("board.updateFile", map);
	}
	public void deleteFileList(Map<String, Object> map) throws Exception{ 
		update("board.deleteFileList", map); 
		}

	

	public void deleteBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.deleteBoard", map);
	}

	public void insertReply(CommandMap commandMap) {
		// TODO Auto-generated method stub
		insert("board.insertReply", commandMap.getMap());
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> viewBoardReplydetail(Map<String, Object> map) {

		return (List<Map<String, Object>>) selectList("board.viewBoardReplydetail", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> detailReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("board.detailReply", map);
	}

	public void updateReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.updateReply", map);
	}

	public void deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.deleteReply", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception {
		insert("board.insertFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("board.selectFileList", map);

	}
	 @SuppressWarnings("unchecked")
	    public Map<String, Object> detailReservation(Map<String, Object> map) {
	        // TODO Auto-generated method stub
	        return (Map<String, Object>) selectOne("board.detailReservation", map);
	    }
	 public void insertReservation(Map<String, Object> map) {
			// TODO Auto-generated method stub
			insert("board.insertReservation", map);

		}
	 public void deleteReservation(Map<String, Object> map) {
			// TODO Auto-generated method stub
			update("board.deleteReservation", map);
		}



}
