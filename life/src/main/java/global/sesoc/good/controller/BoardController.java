package global.sesoc.good.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import global.sesoc.good.HomeController;
import global.sesoc.good.dao.BoardDao;
import global.sesoc.good.util.PageNavigator;
import global.sesoc.good.vo.Board;

@Controller
@RequestMapping("board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	public BoardDao dao;
	
	final int countPerPage = 10;
	final int pagePerGroup = 5;
	
	

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String list(
			@RequestParam(value="page", defaultValue = "1")int page
			,@RequestParam(value="searchText", defaultValue ="")String searchText,
			Model model) {
		
		logger.debug("page:{}, searchText:{}", page, searchText);
		int total = dao.getTotal(searchText);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		ArrayList<Board> list = dao.pagingBoard(searchText, navi.getStartRecord(),navi.getCountPerPage());
		model.addAttribute("list", list);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		
		return "board/insert";
	}
		@RequestMapping(value = "/write", method = RequestMethod.GET)
		public String write() {

		return "board/write";
	}
		@RequestMapping(value = "/write", method = RequestMethod.POST)
		public String write(Board b, HttpSession session) {
			
			b.setId((String) session.getAttribute("loginId"));

			logger.info("제목:{}", b.getTitle());
			
			dao.listBoard(b);
			return "redirect:insert";
		}	
		
		@RequestMapping(value = "/read", method = RequestMethod.GET)
		public String read(int boardnum, Model model) {
			Board b = dao.readOne(boardnum);
			model.addAttribute("b", b);
			
			return "board/boardRead";
		}

}

