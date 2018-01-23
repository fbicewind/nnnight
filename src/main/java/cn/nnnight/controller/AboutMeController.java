package cn.nnnight.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.nnnight.service.common.UserExtInfoService;
import cn.nnnight.util.AuthUtil;
import cn.nnnight.util.Constants;

@Controller
@RequestMapping("/aboutMe")
public class AboutMeController {

	public static final Logger LOGGER = LoggerFactory.getLogger(AboutMeController.class);

	@Autowired
	private UserExtInfoService userExtInfoService;

	@RequestMapping(value = "/{userId}", method = RequestMethod.GET)
	public ModelAndView index(@PathVariable("userId") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView("aboutMe");
		mv.addObject("self", AuthUtil.getId() == userId ? true : false);
		mv.addObject("userInfo", userExtInfoService.getInfo(userId));// 用户信息
		session.setAttribute(Constants.WHOLE_USER_ID, userId);
		return mv;
	}

	@RequestMapping(value = "/modifyPwd", method = RequestMethod.GET)
	public ModelAndView changePassword(HttpSession session) {
		ModelAndView mv = new ModelAndView("modifyPassword");
		session.setAttribute(Constants.WHOLE_USER_ID, AuthUtil.getId());
		return mv;
	}

	@RequestMapping(value = "/modifyInfo", method = RequestMethod.GET)
	public ModelAndView modifyInfo(HttpSession session) {
		ModelAndView mv = new ModelAndView("modifyInfo");
		int userId = AuthUtil.getId();
		mv.addObject("userInfo", userExtInfoService.getInfo(userId));// 用户信息
		session.setAttribute(Constants.WHOLE_USER_ID, userId);
		return mv;
	}

	@RequestMapping(value = "/modifyAvatar", method = RequestMethod.GET)
	public ModelAndView modifyAvatar(HttpSession session) {
		ModelAndView mv = new ModelAndView("modifyAvatar");
		int userId = AuthUtil.getId();
		mv.addObject("userInfo", userExtInfoService.getInfo(userId));// 用户信息
		session.setAttribute(Constants.WHOLE_USER_ID, userId);
		return mv;
	}
}
