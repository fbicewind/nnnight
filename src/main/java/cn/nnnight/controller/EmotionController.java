package cn.nnnight.controller;

import javax.servlet.http.HttpSession;

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
@RequestMapping("/emotion")
public class EmotionController {

	@Autowired
	private UserExtInfoService userExtInfoService;

	@RequestMapping(value = "/{userId}", method = RequestMethod.GET)
	public ModelAndView index(@PathVariable("userId") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView("emotion");
		mv.addObject("userInfo", userExtInfoService.getInfo(userId));// 用户信息
		mv.addObject("self", AuthUtil.getId() == userId ? true : false);
		session.setAttribute(Constants.WHOLE_USER_ID, userId);
		return mv;
	}
}
