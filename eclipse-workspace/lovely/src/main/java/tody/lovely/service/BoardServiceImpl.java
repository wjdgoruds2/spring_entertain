package tody.lovely.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import tody.prjdoo.common.common.CommandMap;
import tody.lovely.dao.BoardDAO;
import tody.lovely.util.FileUtils;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;
	@Resource(name = "boardDAO")
	private BoardDAO boardDAO;

	@Override
	public List<Map<String, Object>> selectBoardList(CommandMap commandMap) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardList(commandMap);
	}

	@Override
	public List<Map<String, Object>> selectBoardTypeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardTypeList(map);
	}
	@Override
	public List<Map<String, Object>> selectBoardAreaList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardAreaList(map);
	}
	@Override
	public List<Map<String, Object>> selectMyBoardList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDAO.selectMyBoardList(map);
	}
	@Override
	public List<Map<String, Object>> selectMyReplyList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDAO.selectMyReplyList(map);
	}
	@Override
	public List<Map<String, Object>> selectMyReservationList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDAO.selectMyReservationList(map);
	}


	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.insertBoard(map);
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for (int i = 0, size = list.size(); i < size; i++) {
			boardDAO.insertFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> viewBoardDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardDAO.updateHitBoard(map);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = boardDAO.detailBoard(map);
		resultMap.put("map", tempMap);
		List<Map<String, Object>> list = boardDAO.selectFileList(map);
		resultMap.put("list", list);
		return resultMap;
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return boardDAO.detailBoard(map);

	}

	@Override
	public void updateBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardDAO.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardDAO.deleteBoard(map);
	}

	@Override
	public void insertReply(CommandMap commandMap) {
		// TODO Auto-generated method stub
		boardDAO.insertReply(commandMap);
	}

	@Override
	public List<Map<String, Object>> viewBoardReplydetail(Map<String, Object> map) {
		return boardDAO.viewBoardReplydetail(map);
	}

	@Override
	public Map<String, Object> selectReplydDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDAO.detailReply(map);
	}

	@Override
	public void updateReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardDAO.updateReply(map);
	}

	@Override
	public void deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardDAO.deleteReply(map);
	}
	@Override
    public Map<String, Object> viewBoardReservation(Map<String, Object> map) {
        // TODO Auto-generated method stub
        Map<String, Object> detail = boardDAO.detailReservation(map);
        return detail;
    }
	@Override
	public void insertReservation(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardDAO.insertReservation(map);
	}
	@Override
	public void deleteReservation(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardDAO.deleteReservation(map);
	}

}
