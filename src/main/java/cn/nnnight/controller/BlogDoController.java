package cn.nnnight.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.nnnight.entity.blog.Blog;
import cn.nnnight.entity.blog.BlogAlbum;
import cn.nnnight.entity.blog.BlogComment;
import cn.nnnight.entity.blog.BlogMusic;
import cn.nnnight.entity.blog.BlogType;
import cn.nnnight.service.blog.BlogAlbumService;
import cn.nnnight.service.blog.BlogCommentService;
import cn.nnnight.service.blog.BlogFavoriteService;
import cn.nnnight.service.blog.BlogMusicService;
import cn.nnnight.service.blog.BlogPhotoService;
import cn.nnnight.service.blog.BlogPraiseService;
import cn.nnnight.service.blog.BlogService;
import cn.nnnight.service.blog.BlogTypeService;
import cn.nnnight.service.common.UserService;
import cn.nnnight.util.Constants;
import cn.nnnight.util.UploadUtil;
import cn.nnnight.vo.AvatarVo;
import cn.nnnight.vo.RegisterVo;

@Controller
@RequestMapping("/blogDo")
public class BlogDoController {

	public static final Logger LOGGER = LoggerFactory.getLogger(BlogDoController.class);

	@Autowired
	private BlogService blogService;
	@Autowired
	private BlogTypeService blogTypeService;
	@Autowired
	private BlogCommentService blogCommentService;
	@Autowired
	private BlogPraiseService blogPraiseService;
	@Autowired
	private BlogFavoriteService blogFavoriteService;
	@Autowired
	private UserService userService;
	@Autowired
	private BlogAlbumService blogAlbumService;
	@Autowired
	private BlogPhotoService blogPhotoService;
	@Autowired
	private BlogMusicService blogMusicService;
	@Autowired
	private UploadUtil uploadUtil;

	@RequestMapping("/upload")
	public void upload(@RequestParam("image") MultipartFile image, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		// 文件类型限制
		String[] allowedType = { "image/bmp", "image/gif", "image/jpeg", "image/png" };
		boolean allowed = Arrays.asList(allowedType).contains(image.getContentType());
		if (!allowed) {
			response.getWriter().write("error|不支持的类型");
			return;
		}
		// 图片大小限制
		if (image.getSize() > 5 * 1024 * 1024) {
			response.getWriter().write("error|图片大小不能超过5M");
			return;
		}
		String returnPath = uploadUtil.uploadBlogImage(image);
		response.getWriter().write(returnPath);
	}

	@RequestMapping("/saveType")
	@ResponseBody
	public BlogType saveType(@RequestParam String typeName) {
		BlogType entity = blogTypeService.addBlogType(typeName);
		return entity;
	}

	@RequestMapping("/saveBlog")
	@ResponseBody
	public ModelMap saveBlog(Blog blog) {
		ModelMap map = new ModelMap();
		if (blogService.isExistBlog(blog.getBlogId(), 1)) {
			blog.setBlogId(0);
		}
		Blog entity = blogService.saveBlog(blog);
		map.put("blogId", entity.getBlogId());
		return map;
	}

	@RequestMapping("/saveDraftBlog")
	@ResponseBody
	public ModelMap saveDraftBlog(Blog blog) {
		ModelMap map = new ModelMap();
		blog.setDraftFlag(1);
		if (blogService.isExistBlog(blog.getBlogId(), 0)) {
			blog.setBlogId(0);
		}
		Blog entity = blogService.saveBlog(blog);
		map.put("blogId", entity.getBlogId());
		return map;
	}

	@RequestMapping("/saveComment")
	@ResponseBody
	public ModelMap saveComment(BlogComment blogComment) {
		ModelMap map = new ModelMap();
		map.put("comment", blogCommentService.saveComment(blogComment));
		return map;
	}

	@RequestMapping("/praiseBlog")
	@ResponseBody
	public ModelMap praiseBlog(@RequestParam("state") Integer state, @RequestParam("blogId") Integer blogId,
			@RequestParam("userId") Integer userId) {
		ModelMap map = new ModelMap();
		blogPraiseService.praiseBlog(userId, blogId, state);
		map.put("status", 1);
		return map;
	}

	@RequestMapping("/favoriteBlog")
	@ResponseBody
	public ModelMap favoriteBlog(@RequestParam("state") Integer state, @RequestParam("blogId") Integer blogId,
			@RequestParam("userId") Integer userId) {
		ModelMap map = new ModelMap();
		blogFavoriteService.favoriteBlog(userId, blogId, state);
		map.put("status", 1);
		return map;
	}

	@RequestMapping("/delBlog")
	@ResponseBody
	public ModelMap delBlog(@RequestParam("blogId") Integer blogId) {
		ModelMap map = new ModelMap();
		boolean flag = blogService.delBlog(blogId);
		if (flag) {
			map.put("status", 1);
		}
		return map;
	}

	@RequestMapping("/modifyPwd")
	@ResponseBody
	public ModelMap modifyPwd(@RequestParam("oldPassword") String oldPassword,
			@RequestParam("password") String password) {
		ModelMap map = new ModelMap();
		map.put("status", userService.modifyPassword(password, oldPassword));
		return map;
	}

	@RequestMapping("/modifyInfo")
	@ResponseBody
	public ModelMap modifyInfo(RegisterVo vo) {
		ModelMap map = new ModelMap();
		boolean flag = userService.modifyInfo(vo);
		map.put("status", flag ? 1 : 0);
		return map;
	}

	@RequestMapping("/uploadTempAvatar")
	@ResponseBody
	public ModelMap uploadTempAvatar(@RequestParam("avatar") MultipartFile avatar) {
		ModelMap map = new ModelMap();
		String[] allowedType = { "image/bmp", "image/gif", "image/jpeg", "image/png" };
		boolean allowed = Arrays.asList(allowedType).contains(avatar.getContentType());
		if (!allowed) {
			map.put("status", 0);
		} else {
			String url = uploadUtil.uploadTempAvatar(avatar);
			map.put("status", 1);
			map.put("url", url);
		}
		return map;
	}

	@RequestMapping("/saveAvatar")
	@ResponseBody
	public ModelMap saveAvatar(@RequestBody AvatarVo vo) {
		ModelMap map = new ModelMap();
		String avatar = uploadUtil.uploadAvatar(vo);
		if (userService.modifyAvatar(avatar)) {
			map.put("status", 1);
		}
		return map;
	}

	@RequestMapping("/saveAlbum")
	@ResponseBody
	public ModelMap saveAlbum(BlogAlbum blogAlbum) {
		ModelMap map = new ModelMap();
		try {
			blogAlbumService.saveOrUpdateAlbum(blogAlbum);
			map.put("status", 1);
		} catch (Exception e) {
			map.put("status", 0);
		}
		return map;
	}

	@RequestMapping("/uploadPhoto")
	@ResponseBody
	public ModelMap uploadPhoto(@RequestParam("photo") MultipartFile photo, @RequestParam("albumId") int albumId) {
		ModelMap map = new ModelMap();
		String fileName = uploadUtil.uploadPhotos(photo);
		if (StringUtils.isNotBlank(fileName)) {
			blogPhotoService.savePhoto(albumId, fileName);
		}
		map.put("stauts", Constants.TRUE_FLAG);
		return map;
	}

	@RequestMapping(value = "/saveMusic", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap saveMusic(@RequestParam(value = "urlfile", required = false) MultipartFile urlfile,
			@RequestParam(value = "lrcfile", required = false) MultipartFile lrcfile,
			@RequestParam(value = "coverfile", required = false) MultipartFile coverfile, BlogMusic vo) {
		ModelMap map = new ModelMap();
		if(urlfile != null){
			String url = uploadUtil.uploadMusicFile(urlfile);
			vo.setUrl(url);
		}
		if(lrcfile != null){
			String lrcurl = uploadUtil.uploadMusicFile(lrcfile);
			vo.setLrcurl(lrcurl);
		}
		if(coverfile != null){
			String cover = uploadUtil.uploadMusicCover(coverfile);
			vo.setCover(cover);
		}
		blogMusicService.saveMusic(vo);
		map.put("stauts", Constants.TRUE_FLAG);
		return map;
	}
	
	@RequestMapping(value = "deleteMusic", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap deleteMusic(@RequestParam String musicId){
		ModelMap map = new ModelMap();
		boolean flag = blogMusicService.deleteMusic(musicId);
		map.put("status", flag ? Constants.TRUE_FLAG : Constants.FALSE_FLAG);
		return map;
	}

}
