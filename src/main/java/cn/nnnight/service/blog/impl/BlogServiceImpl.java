package cn.nnnight.service.blog.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.nnnight.dao.blog.BlogDao;
import cn.nnnight.entity.blog.Blog;
import cn.nnnight.entity.blog.BlogFavorite;
import cn.nnnight.entity.blog.BlogPraise;
import cn.nnnight.entity.blog.BlogType;
import cn.nnnight.entity.common.UserExtInfo;
import cn.nnnight.service.blog.BlogFavoriteService;
import cn.nnnight.service.blog.BlogPraiseService;
import cn.nnnight.service.blog.BlogService;
import cn.nnnight.service.blog.BlogTypeService;
import cn.nnnight.service.common.UserExtInfoService;
import cn.nnnight.service.common.impl.BaseServiceImpl;
import cn.nnnight.util.AuthUtil;
import cn.nnnight.util.Constants;
import cn.nnnight.util.MyBeanUtils;
import cn.nnnight.util.Pager;
import cn.nnnight.vo.BlogVo;

@Service
public class BlogServiceImpl extends BaseServiceImpl<Blog> implements BlogService {

	@Autowired
	private BlogDao blogDao;
	@Autowired
	private BlogTypeService blogTypeService;
	@Autowired
	private BlogPraiseService blogPraiseService;
	@Autowired
	private BlogFavoriteService blogFavoriteService;
	@Autowired
	private UserExtInfoService userExtInfoService;

	@Override
	public Pager<Blog> selectPageByVo(Integer pageNo, Integer pageSize, Blog vo, String order, boolean desc) {
		Map<String, Object> values = new HashMap<String, Object>();
		if (vo.getUserId() != 0) {
			values.put("userId", vo.getUserId());
		}
		values.put("deleteFlag", 0);
		values.put("draftFlag", 0);
		values.put("publicFlag", 0);
		return blogDao.selectPageByProterties(pageNo, pageSize, values, order, desc);
	}

	@Override
	public Blog saveBlog(Blog vo) {
		Blog blog = null;
		Date now = new Date();
		if (vo.getBlogId() == 0) {
			blog = new Blog();
			MyBeanUtils.copyProperties(vo, blog);
			blog.setCreateTime(now);
		} else {
			blog = blogDao.get(vo.getBlogId());
			MyBeanUtils.copyProperties(vo, blog);
			blog.setUpdateTime(now);
		}
		blog.setUserId(AuthUtil.getId());
		blogDao.saveOrUpdate(blog);
		if(blog.getPublicFlag() == 0 && blog.getDraftFlag() == 0){
			UserExtInfo userExtInfo = userExtInfoService.get(blog.getUserId());
			userExtInfo.setBlogCount(userExtInfo.getBlogCount() + 1);
			userExtInfoService.update(userExtInfo);
		}
		return blog;
	}

	@Override
	public List<BlogVo> selectIndexBlogs(Integer userId) {
		List<BlogVo> vos = new ArrayList<BlogVo>();
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("recommendFlag", 1);
		values.put("draftFlag", 0);
		values.put("deleteFlag", 0);
		values.put("userId", userId);
		Pager<Blog> blogs = blogDao.selectPageByProterties(1, 20, values, "createTime", true);
		if (blogs.getDatalist() != null) {
			for (Blog blog : blogs.getDatalist()) {
				BlogVo vo = new BlogVo();
				MyBeanUtils.copyProperties(blog, vo);
				BlogType type = blogTypeService.getType(blog.getTypeId());
				vo.setTypeName(type.getTypeName());
				vos.add(vo);
			}
		}
		return vos;
	}

	@Override
	public Pager<BlogVo> selectBlogs(Integer pageNo, Integer pageSize, Integer userId, String type, Integer typeId) {
		List<BlogVo> vos = new ArrayList<BlogVo>();
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("userId", userId);
		if (type.equals(Constants.DRAFTDIARY)) {
			values.put("draftFlag", 1);
		} else {
			values.put("draftFlag", 0);
		}
		if (type.equals(Constants.PRIVATEDIARY)) {
			values.put("publicFlag", 1);
		} else {
			values.put("publicFlag", 0);
		}
		values.put("deleteFlag", 0);
		if (typeId != 0) {
			values.put("typeId", typeId);
		}
		Pager<Blog> blogs = null;
		if (type.equals(Constants.FAVORABLEDIARY)) {
			blogs = blogDao.selectFavorableBlogs(pageNo, pageSize, values);
		} else {
			blogs = blogDao.selectBlogs(pageNo, pageSize, values);
		}
		if (blogs.getDatalist() != null) {
			for (Blog blog : blogs.getDatalist()) {
				BlogVo vo = new BlogVo();
				MyBeanUtils.copyProperties(blog, vo);
				BlogType blogType = blogTypeService.getType(blog.getTypeId());
				vo.setTypeName(blogType.getTypeName());
				vos.add(vo);
			}
		}
		return new Pager<BlogVo>(pageSize, pageNo, blogs.getTotalSize(), vos);
	}

	@Override
	public BlogVo getBlog(Integer blogId) {
		Blog blog = blogDao.get(blogId);
		BlogVo vo = new BlogVo();
		MyBeanUtils.copyProperties(blog, vo);
		BlogType blogType = blogTypeService.getType(blog.getTypeId());
		vo.setTypeName(blogType.getTypeName());
		int userId = AuthUtil.getId();
		if (userId != 0) {
			Map<String, Object> values = new HashMap<String, Object>();
			values.put("userId", userId);
			values.put("blogId", blogId);
			BlogPraise praise = blogPraiseService.getUniqueResult(values);
			BlogFavorite favorite = blogFavoriteService.getUniqueResult(values);
			if (praise != null) {
				vo.setPraiseFlag(1);
			}
			if (favorite != null) {
				vo.setFavoriteFlag(1);
			}
		}
		return vo;
	}

	@Override
	public Blog getPrevBlog(BlogVo vo, boolean flag) {
		Blog entity = new Blog();
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("draftFlag", 0);
		values.put("publicFlag", vo.getPublicFlag());
		values.put("deleteFlag", 0);
		values.put("userId", vo.getUserId());
		values.put("topFlag", 0);
		values.put("createTime", vo.getCreateTime());
		if (flag) {
			values.put("typeId", vo.getTypeId());
		}
		if (vo.getTopFlag() == 0) {// 不置顶：上一篇可能会置顶
			entity = blogDao.getPrev(values);
			if (entity == null) {
				values.put("topFlag", 1);
				entity = blogDao.getTopPrev(values);
			}
		} else {// 置顶：上一篇肯定置顶
			values.put("topFlag", 1);
			entity = blogDao.getPrev(values);
		}
		return entity;
	}

	@Override
	public Blog getNextBlog(BlogVo vo, boolean flag) {
		Blog entity = new Blog();
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("draftFlag", 0);
		values.put("publicFlag", vo.getPublicFlag());
		values.put("deleteFlag", 0);
		values.put("userId", vo.getUserId());
		values.put("topFlag", 0);
		values.put("createTime", vo.getCreateTime());
		if (flag) {
			values.put("typeId", vo.getTypeId());
		}
		if (vo.getTopFlag() == 0) {// 不置顶：下一篇肯定不置顶
			entity = blogDao.getNext(values);
		} else {// 置顶：下一篇可能置顶
			values.put("topFlag", 1);
			entity = blogDao.getNext(values);
			if (entity == null) {
				values.put("topFlag", 0);
				entity = blogDao.getNoTopNext(values);
			}
		}
		return entity;
	}

	@Override
	public boolean isExistBlog(Integer blogId, Integer isDraft) {
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("deleteFlag", 0);
		values.put("draftFlag", isDraft);
		values.put("blogId", blogId);
		Blog blog = blogDao.getUniqueResult(values);
		return blog != null;
	}

	@Override
	public boolean delBlog(Integer blogId) {
		boolean flag = false;
		Blog blog = blogDao.get(blogId);
		if (blog.getUserId() == AuthUtil.getId()) {
			blog.setDeleteFlag(1);
			blog.setDeleteTime(new Date());
			blogDao.update(blog);
			if(blog.getPublicFlag() == 0){
				UserExtInfo userExtInfo = userExtInfoService.get(blog.getUserId());
				userExtInfo.setBlogCount(userExtInfo.getBlogCount() - 1);
				userExtInfoService.update(userExtInfo);
			}
			flag = true;
		}
		return flag;
	}

}
