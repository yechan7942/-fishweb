package global.sesoc.good.controller;

import java.io.Reader;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.good.HomeController;
import global.sesoc.good.dao.ReplyDao;
import global.sesoc.good.vo.Reply;


@Controller
@RequestMapping("reply")
public class ReplyController {
	
		
		private final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
		@Autowired
		public ReplyDao dao;
		
		
		@ResponseBody
		@RequestMapping (value="insert", method=RequestMethod.POST)
		public void insert(Reply  rp) {
			logger.info("전달된 객체 : {}", rp);
			dao.insert(rp);
		}
		@ResponseBody
		@RequestMapping (value="list", method=RequestMethod.GET)
		public ArrayList<Reply> list() {
			ArrayList<Reply> list = dao.list();
			
			return list;
		}
		
		
		
		
		@ResponseBody
		@RequestMapping (value="delete", method=RequestMethod.POST)
		public String delete(int num) {
			logger.info("전달된 번호 : {}", num);
			int res = dao.delete(num);
			if (res == 1) {
				return "삭제되었습니다.";
			} else {
				return "삭제 실패했습니다.";
			}
		}
		
		/**
		 * 댓글 수정
		 */
		@ResponseBody
		@RequestMapping (value="update", method=RequestMethod.POST)
		public String update(Reply c) {
			logger.info("전달된 객체 : {}", c);
			int res = 0; 
			if (res == 1) {
				return "수정되었습니다.";
			} else {
				return "수정 실패했습니다.";
			}
		}
	}

