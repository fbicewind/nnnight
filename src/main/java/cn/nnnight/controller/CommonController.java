package cn.nnnight.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.nnnight.entity.blog.Blog;
import cn.nnnight.entity.common.User;
import cn.nnnight.service.blog.BlogService;
import cn.nnnight.service.common.UserExtInfoService;
import cn.nnnight.service.common.UserService;
import cn.nnnight.util.AuthUtil;
import cn.nnnight.util.Constants;
import cn.nnnight.util.IPUtil;
import cn.nnnight.vo.RegisterVo;

@Controller
public class CommonController {

	public static final Logger LOGGER = LoggerFactory.getLogger(CommonController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private UserExtInfoService userExtInfoService;
	@Autowired
	private BlogService blogService;

	@RequestMapping(value = "/u/{userId}", method = RequestMethod.GET)
	public ModelAndView index(@PathVariable("userId") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("userInfo", userExtInfoService.getInfo(userId));// 用户信息
		Blog blog = new Blog();
		blog.setUserId(userId);
		mv.addObject("blogs", blogService.selectIndexBlogs(userId));// 首页日志
		mv.addObject("newBlogs", blogService.selectPageByVo(1, 10, blog, "createTime", true));// 最近日志
		mv.addObject("visitors", userService.findIndexVisitor(userId));
		mv.addObject("self", AuthUtil.getId() == userId ? true : false);
		session.setAttribute(Constants.WHOLE_USER_ID, userId);
		return mv;
	}

	@RequestMapping(value = "/resume", method = RequestMethod.GET)
	public ModelAndView resume(HttpSession session) {
		session.setAttribute(Constants.WHOLE_USER_ID, 1);
		return new ModelAndView("resume");
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {
		return new ModelAndView("register");
	}

	@RequestMapping(value = "/login/{status}")
	@ResponseBody
	public ModelMap success(@PathVariable String status) {
		ModelMap map = new ModelMap();
		map.put("status", status);
		return map;
	}

	@RequestMapping(value = "/logout/exit")
	@ResponseBody
	public ModelMap exit() {
		ModelMap map = new ModelMap();
		map.put("status", "success");
		return map;
	}

	@RequestMapping(value = "/doRegister")
	@ResponseBody
	public ModelMap doRegister(RegisterVo vo, HttpServletRequest request) {
		ModelMap map = new ModelMap();
		vo.setRegisterIp(IPUtil.getRemoteIp(request));
		User entity = userService.getUniqueResult("username", vo.getUsername());
		if (entity == null) {
			try {
				User user = userService.addUser(vo);
				map.put("status", "success");
				map.put("user", user);
			} catch (ParseException e) {
				e.printStackTrace();
				map.put("status", "failure");
			}
		} else {
			map.put("status", "error");
		}
		return map;
	}

	@RequestMapping(value = "/toIndex")
	public ModelAndView toIndex() {
		int userId = AuthUtil.getId();
		if (userId == 0) {
			userId = 1;
		}
		return new ModelAndView("redirect:/u/" + userId);
	}
	
	@RequestMapping(value = "/lt/{id}")
	public ModelAndView loveletter(@PathVariable("id") String id) {
		return new ModelAndView("loveletter/" + id);
	}
}
