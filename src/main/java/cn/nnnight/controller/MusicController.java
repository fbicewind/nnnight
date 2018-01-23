package cn.nnnight.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.nnnight.entity.blog.BlogMusic;
import cn.nnnight.service.blog.BlogMusicService;
import cn.nnnight.util.AuthUtil;
import cn.nnnight.util.Constants;

@Controller
@RequestMapping("/music")
public class MusicController {

	@Autowired
	private BlogMusicService blogMusicService;

	@RequestMapping(value = "/{userId}", method = RequestMethod.GET)
	public ModelAndView index(@PathVariable("userId") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView("music");
		mv.addObject("self", AuthUtil.getId() == userId ? true : false);
		session.setAttribute(Constants.WHOLE_USER_ID, userId);
		return mv;
	}

	@RequestMapping(value = "getList", method = RequestMethod.GET)
	@ResponseBody
	public List<BlogMusic> getList(int userId) {
		return blogMusicService.getList(userId);
	}

}
