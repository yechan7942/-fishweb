package global.sesoc.good.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.good.HomeController;
import global.sesoc.good.dao.GuestBookDAO;
import global.sesoc.good.vo.GuestBook;

@Controller
@RequestMapping("guestbook")
public class GuestBookController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	public GuestBookDAO dao;

	// 방명록 보기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		//테이블의 모든 데이터 ArrayList에 저장
		//Model에 결과 저장
		
		ArrayList<GuestBook> list = dao.list();
		model.addAttribute("list", list);		
		return "guestbook/listView";
	}

	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "guestbook/writeForm";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(GuestBook gb, Model model) {
		int cnt = dao.insertGuestbook(gb);
		model.addAttribute("cnt", cnt);
		logger.info("글이 등록 되었습니다 {}:",model);
		return "redirect:/guestbook/list";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(GuestBook gb) {
		
		dao.deleteGuestbook(gb);
		logger.info("등록된 글이 삭제 되었습니다{}:",gb.getNum(),gb.getPassword());
		return "redirect:/guestbook/list";
	}
}
