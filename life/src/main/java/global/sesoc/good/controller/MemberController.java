package global.sesoc.good.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.good.vo.Member;
import global.sesoc.good.HomeController;
import global.sesoc.good.dao.MemberDao;


@Controller
@RequestMapping("member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	public MemberDao dao;
	
	@RequestMapping(value = "/insert1", method =RequestMethod.GET)
	public String insert() {
		
		return "member/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert1(Member mb) {
		logger.info("가입되었습니다{}:", mb);
		dao.insertMember(mb);
		return "redirect:/";
	}
		@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
		public String idcheck() {

			return "member/idcheck";
		}
		@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
		public String idcheck(String searchId, Model model)
	
		{
			Member vo= dao.getMember(searchId);
			
			model.addAttribute("searchId", searchId);
			if(vo==null) {
				model.addAttribute("result", "yes");
				}
			else {
				model.addAttribute("result", "no");
			}
			return "member/idcheck";
		}
	@RequestMapping(value = "/login", method =RequestMethod.GET)
	public String login() {
		
		return "member/login";
	}
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Boolean login(String id, String password, Model model, HttpSession session) {
		
		Member vo = dao.getMember(id);
		logger.info("vo{}:", vo);
		if(vo!=null && password.equals(vo.getPassword())) {
			session.setAttribute("loginId", id);
			session.setAttribute("loginName", vo.getName());
			logger.info("로그인 성공");
		
			return true;
		}else {
			logger.info("로그인 실패");	
			return false;
		}		
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("loginName");
		return "redirect:/";
	}

	@RequestMapping (value="update", method=RequestMethod.GET)
	public String update(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		Member member = dao.getMember(loginId);
		model.addAttribute("member", member);
		return "member/updateForm";
	}

	@RequestMapping (value="update", method=RequestMethod.POST)
	public String update(Model model, HttpSession session, Member member) {
		String loginId = (String) session.getAttribute("loginId");
		member.setId(loginId);;
		
		int res = dao.update(member);
		if (res != 0) {
			return "redirect:/";
		}
		else {
			return "memberView/updateForm";
		}
	}

}
