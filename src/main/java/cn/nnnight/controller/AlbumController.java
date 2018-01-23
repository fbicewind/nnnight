package cn.nnnight.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.nnnight.entity.blog.BlogAlbum;
import cn.nnnight.service.blog.BlogAlbumService;
import cn.nnnight.service.blog.BlogPhotoService;
import cn.nnnight.util.AuthUtil;
import cn.nnnight.util.Constants;

@Controller
@RequestMapping("/album")
public class AlbumController {

	public static final Logger LOGGER = LoggerFactory.getLogger(AlbumController.class);

	@Autowired
	private BlogAlbumService blogAlbumService;
	@Autowired
	private BlogPhotoService blogPhotoService;

	@RequestMapping(value = "/{userId}", method = RequestMethod.GET)
	public ModelAndView index(@PathVariable("userId") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView("album");
		mv.addObject("self", AuthUtil.getId() == userId ? true : false);
		mv.addObject("albumList", blogAlbumService.findAlbums(userId));
		session.setAttribute(Constants.WHOLE_USER_ID, userId);
		return mv;
	}

	@RequestMapping(value = "/detail/{albumId}", method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable("albumId") int albumId, HttpSession session) {
		ModelAndView mv = new ModelAndView("albumDetail");
		BlogAlbum blogAlbum = blogAlbumService.get(albumId);
		int userId = blogAlbum.getUserId();
		mv.addObject("self", AuthUtil.getId() == userId ? true : false);
		mv.addObject("photoList", blogPhotoService.findPhotos(userId, albumId));
		session.setAttribute(Constants.WHOLE_USER_ID, userId);
		return mv;
	}

	@RequestMapping("/getAlbum")
	@ResponseBody
	public BlogAlbum getAlbum(@RequestParam("albumId") int albumId) {
		return blogAlbumService.get(albumId);
	}
}
