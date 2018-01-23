package cn.nnnight.service.blog.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.nnnight.dao.blog.BlogPraiseDao;
import cn.nnnight.entity.blog.Blog;
import cn.nnnight.entity.blog.BlogPraise;
import cn.nnnight.service.blog.BlogPraiseService;
import cn.nnnight.service.blog.BlogService;
import cn.nnnight.service.common.impl.BaseServiceImpl;

@Service
public class BlogPraiseServiceImpl extends BaseServiceImpl<BlogPraise> implements BlogPraiseService {

	@Autowired
	private BlogPraiseDao blogPraiseDao;
	@Autowired
	private BlogService blogService;

	@Override
	public void praiseBlog(Integer userId, Integer blogId, Integer state) {
		Date now = new Date();
		Blog blog = blogService.get(blogId);
		blog.setUpdateTime(now);
		if (state == 1) {// 赞
			BlogPraise entity = new BlogPraise();
			entity.setBlogId(blogId);
			entity.setUserId(userId);
			entity.setCreateTime(now);
			blogPraiseDao.save(entity);
			blog.setPraiseCount(blog.getPraiseCount() + 1);
		} else {// 取消赞
			Map<String, Object> values = new HashMap<String, Object>();
			values.put("userId", userId);
			values.put("blogId", blogId);
			BlogPraise entity = blogPraiseDao.getUniqueResult(values);
			blogPraiseDao.delete(entity);
			blog.setPraiseCount(blog.getPraiseCount() - 1);
		}
		blogService.update(blog);
	}

}
