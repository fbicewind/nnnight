package cn.nnnight.service.blog.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.nnnight.dao.blog.BlogFavoriteDao;
import cn.nnnight.entity.blog.Blog;
import cn.nnnight.entity.blog.BlogFavorite;
import cn.nnnight.service.blog.BlogFavoriteService;
import cn.nnnight.service.blog.BlogService;
import cn.nnnight.service.common.impl.BaseServiceImpl;

@Service
public class BlogFavoriteServiceImpl extends BaseServiceImpl<BlogFavorite> implements BlogFavoriteService {

	@Autowired
	private BlogFavoriteDao blogFavoriteDao;
	@Autowired
	private BlogService blogService;

	@Override
	public void favoriteBlog(Integer userId, Integer blogId, Integer state) {
		Date now = new Date();
		Blog blog = blogService.get(blogId);
		blog.setUpdateTime(now);
		if (state == 1) {// 赞
			BlogFavorite entity = new BlogFavorite();
			entity.setBlogId(blogId);
			entity.setUserId(userId);
			entity.setCreateTime(now);
			blogFavoriteDao.save(entity);
			blog.setFavoriteCount(blog.getFavoriteCount() + 1);
		} else {// 取消赞
			Map<String, Object> values = new HashMap<String, Object>();
			values.put("userId", userId);
			values.put("blogId", blogId);
			BlogFavorite entity = blogFavoriteDao.getUniqueResult(values);
			blogFavoriteDao.delete(entity);
			blog.setFavoriteCount(blog.getFavoriteCount() - 1);
		}
		blogService.update(blog);
	}

}
