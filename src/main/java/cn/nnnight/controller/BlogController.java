package cn.nnnight.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.nnnight.entity.blog.Blog;
import cn.nnnight.entity.blog.BlogType;
import cn.nnnight.service.blog.BlogCommentService;
import cn.nnnight.service.blog.BlogService;
import cn.nnnight.service.blog.BlogTypeService;
import cn.nnnight.service.blog.BlogVisitorService;
import cn.nnnight.service.common.UserExtInfoService;
import cn.nnnight.service.common.UserService;
import cn.nnnight.util.AuthUtil;
import cn.nnnight.util.Constants;
import cn.nnnight.util.IPUtil;
import cn.nnnight.vo.BlogVo;

@Controller
@RequestMapping("/blog")
public class BlogController {

	public static final Logger LOGGER = LoggerFactory.getLogger(BlogController.class);

	@Autowired
	private BlogService blogService;
	@Autowired
	private BlogTypeService blogTypeService;
	@Autowired
	private UserExtInfoService userExtInfoService;
	@Autowired
	private UserService userService;
	@Autowired
	private BlogCommentService blogCommentService;
	@Autowired
	private BlogVisitorService blogVisitorService;

	@RequestMapping(value = "/{userId}", method = RequestMethod.GET)
	public ModelAndView index(@PathVariable("userId") int userId,
			@RequestParam(value = "t", defaultValue = "a") String type, // 日志类型
			@RequestParam(value = "i", defaultValue = "0") Integer typeId, // 日志分类
			@RequestParam(value = "n", defaultValue = "1") Integer pageNo,
			@RequestParam(value = "s", defaultValue = "10") Integer pageSize, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (AuthUtil.getId() == userId) {
			mv.setViewName("myBlog");
			mv.addObject("type", type);
			mv.addObject("blogs", blogService.selectBlogs(pageNo, pageSize, userId, type, typeId));
		} else {
			mv.setViewName("blog");
			mv.addObject("blogs", blogService.selectBlogs(pageNo, pageSize, userId, Constants.MYDIARY, typeId));
		}
		mv.addObject("ti", typeId);
		mv.addObject("userInfo", userExtInfoService.getInfo(userId));// 用户信息
		BlogType blogType = new BlogType();
		blogType.setUserId(userId);
		mv.addObject("types", blogTypeService.selectByProperties(blogType));
		Blog blog = new Blog();
		blog.setUserId(userId);
		mv.addObject("newBlogs", blogService.selectPageByVo(1, 10, blog, "createTime", true));
		mv.addObject("viewBlogs", blogService.selectPageByVo(1, 10, blog, "readCount", true));
		mv.addObject("userId", userId);
		session.setAttribute(Constants.WHOLE_USER_ID, userId);
		return mv;
	}

	@RequestMapping(value = "/detail/{blogId}", method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable("blogId") int blogId,
			@RequestParam(value = "i", defaultValue = "0") String isType,
			@RequestParam(value = "t", defaultValue = "a") String diaryType, HttpServletRequest request,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("blogDetail");
		blogVisitorService.addViewRecord(blogId, AuthUtil.getId(), IPUtil.getRemoteIp(request));
		BlogVo vo = blogService.getBlog(blogId);
		mv.addObject("blog", vo);
		int userId = vo.getUserId();
		mv.addObject("userInfo", userExtInfoService.getInfo(userId));// 用户信息
		BlogType blogType = new BlogType();
		blogType.setUserId(userId);
		mv.addObject("types", blogTypeService.selectByProperties(blogType));
		Blog blog = new Blog();
		blog.setUserId(userId);
		mv.addObject("newBlogs", blogService.selectPageByVo(1, 10, blog, "createTime", true));
		mv.addObject("viewBlogs", blogService.selectPageByVo(1, 10, blog, "readCount", true));
		boolean flag = !"0".equals(isType);
		mv.addObject("prev", blogService.getPrevBlog(vo, flag));
		mv.addObject("next", blogService.getNextBlog(vo, flag));
		mv.addObject("visitors", userService.findBlogVisitor(blogId));
		mv.addObject("self", AuthUtil.getId() == userId ? true : false);
		mv.addObject("isType", isType);
		mv.addObject("comments", blogCommentService.selectComments(blogId, 1, 10));
		mv.addObject("diaryType", diaryType);
		session.setAttribute(Constants.WHOLE_USER_ID, userId);
		return mv;
	}

	@RequestMapping(value = "/mark", method = RequestMethod.GET)
	public ModelAndView mark(@RequestParam(value = "blogId", defaultValue = "0") Integer blogId, HttpSession session) {
		ModelAndView mv = new ModelAndView("blogPublish");
		BlogType blogType = new BlogType();
		blogType.setUserId(AuthUtil.getId());
		mv.addObject("userInfo", userExtInfoService.getInfo(AuthUtil.getId()));// 用户信息
		mv.addObject("types", blogTypeService.selectByProperties(blogType));
		Blog blog = new Blog();
		blog.setUserId(AuthUtil.getId());
		mv.addObject("newBlogs", blogService.selectPageByVo(1, 10, blog, "createTime", true));
		mv.addObject("viewBlogs", blogService.selectPageByVo(1, 10, blog, "readCount", true));
		if (blogId != 0) {
			mv.addObject("blog", blogService.getBlog(blogId));
		}
		session.setAttribute(Constants.WHOLE_USER_ID, AuthUtil.getId());
		return mv;
	}

}
