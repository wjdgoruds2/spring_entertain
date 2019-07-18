package tody.lovely.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tody.prjdoo.common.common.CommandMap;
import tody.lovely.service.BoardService;

@Controller
public class BoardController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "boardService")
	private BoardService boardServcie;

	@RequestMapping(value = "/board/boardList")
	public ModelAndView openBoardList(CommandMap commandMap) throws Exception {

		ModelAndView mav = new ModelAndView("board/boardList");

		List<Map<String, Object>> list = boardServcie.selectBoardList(commandMap);
		mav.addObject("list", list);
		System.out.println(mav);

		return mav;

	}

	@RequestMapping(value = "/board/boardtypeList")
	public ModelAndView openBoardtypeList(CommandMap commandMap) throws Exception {

		ModelAndView mav = new ModelAndView("/board/boardtypeList");

		mav.addObject("type", commandMap.get("type"));
		List<Map<String, Object>> list = boardServcie.selectBoardTypeList(commandMap.getMap());
		mav.addObject("list", list);

		return mav;

	}

	@RequestMapping(value = "/board/boardareaList")
	public ModelAndView openBoardareaList(CommandMap commandMap) throws Exception {

		ModelAndView mav = new ModelAndView("/board/boardareaList");

		mav.addObject("area", commandMap.get("area"));
		List<Map<String, Object>> list = boardServcie.selectBoardAreaList(commandMap.getMap());
		mav.addObject("list", list);

		return mav;

	}

	@RequestMapping(value = "/board/myboardList")
	public ModelAndView openMyBoardList(CommandMap commandMap) throws Exception {

		ModelAndView mav = new ModelAndView("/board/myboardList");

		mav.addObject("id", commandMap.get("id"));
		List<Map<String, Object>> list = boardServcie.selectMyBoardList(commandMap.getMap());
		mav.addObject("list", list);

		return mav;

	}

	@RequestMapping(value = "/board/myreplyList")
	public ModelAndView openMyReplyList(CommandMap commandMap) throws Exception {

		ModelAndView mav = new ModelAndView("/board/myreplyList");

		mav.addObject("id", commandMap.get("id"));
		List<Map<String, Object>> list = boardServcie.selectMyReplyList(commandMap.getMap());
		mav.addObject("list", list);

		return mav;

	}
	@RequestMapping(value = "/board/myreservationList")
	public ModelAndView openMyReservationList(CommandMap commandMap) throws Exception {

		ModelAndView mav = new ModelAndView("/board/myreservationList");

		mav.addObject("id", commandMap.get("id"));
		System.out.println(mav);
		List<Map<String, Object>> list = boardServcie.selectMyReservationList(commandMap.getMap());
		mav.addObject("list", list);

		return mav;

	}

	@RequestMapping(value = "/board/boardWrite")
	public String boardWrite() throws Exception {
		return "/board/boardWrite";
	}

	@RequestMapping(value = "/board/boardInsert")
	public ModelAndView boardInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/boardList");
		mav.addObject("title", commandMap.get("title"));
		mav.addObject("id", commandMap.get("crea_id"));
		boardServcie.insertBoard(commandMap.getMap(), request);
		return mav;

	}

	@RequestMapping(value = "/board/boardDetail")
	public ModelAndView boardDetail(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/board/boardDetail");
		Map<String, Object> map = boardServcie.viewBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		return mv;
	}

	@RequestMapping(value = "/board/boardUpdate")
	public ModelAndView boardUpdate(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/board/boardUpdate");
		mv.addObject("idx", commandMap.get("idx"));
		Map<String, Object> map = boardServcie.viewBoardDetail(commandMap.getMap());
		System.out.println(map);
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		System.out.println(mv);
		return mv;
	}

	@RequestMapping(value = "/board/boardUpdate", method = RequestMethod.POST)
	public ModelAndView boardUpdatePOST(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/boardDetail");
		mv.addObject("idx", commandMap.get("IDX"));
		mv.addObject("title", commandMap.get("TITLE"));
		boardServcie.updateBoard(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/board/boardDelete")
	public ModelAndView boardDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/boardList");
		log.debug(commandMap.getMap());
		boardServcie.deleteBoard(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/board/boardReply")
	public ModelAndView boardReply(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/boardReplydetail");
		mav.addObject("title", commandMap.get("title"));
		boardServcie.insertReply(commandMap);
		return mav;
	}

	@RequestMapping(value = "/board/boardReplydetail")
	public ModelAndView boardReplydetail(CommandMap commandMap) throws Exception {

		ModelAndView mav = new ModelAndView("/board/boardReplydetail");

		List<Map<String, Object>> list = boardServcie.viewBoardReplydetail(commandMap.getMap());
		mav.addObject("list", list);

		return mav;

	}

	@RequestMapping(value = "/board/ReplyUpdate")
	public ModelAndView ReplyUpdate(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/board/ReplyUpdate");
		Map<String, Object> detail = boardServcie.selectReplydDetail(commandMap.getMap());
		mv.addObject("detail", detail);
		return mv;
	}

	@RequestMapping(value = "/board/ReplyUpdate", method = RequestMethod.POST)
	public ModelAndView ReplyUpdatePOST(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/board/boardReplydetail");
		mv.addObject("title", commandMap.get("title"));
		boardServcie.updateReply(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/board/ReplyDelete")
	public ModelAndView ReplyDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/boardReplydetail");
		mv.addObject("title", commandMap.get("title"));
		boardServcie.deleteReply(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/board/boardReservation")
	public ModelAndView boardReservation(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/board/boardReservation");
		mv.addObject("title", commandMap.get("title"));
		Map<String, Object> detail = boardServcie.viewBoardReservation(commandMap.getMap());
		mv.addObject("detail", detail);

		return mv;
	}
	@RequestMapping(value = "/board/boardReservation", method = RequestMethod.POST)
	public ModelAndView boardReservationPOST(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/board/myreservationList");
		mv.addObject("id", commandMap.get("id"));
		boardServcie.insertReservation(commandMap.getMap());
		return mv;
	}
	@RequestMapping(value = "/board/deletereservation")
	public ModelAndView ReservationDelete(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("redirect:/board/myreservationList");
		mv.addObject("id", commandMap.get("id"));
		mv.addObject("num", commandMap.get("num"));
		boardServcie.deleteReservation(commandMap.getMap());
		return mv;
	}


}
