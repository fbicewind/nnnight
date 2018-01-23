package cn.nnnight.service.blog.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.nnnight.dao.blog.BlogVisitorDao;
import cn.nnnight.entity.blog.Blog;
import cn.nnnight.entity.blog.BlogVisitor;
import cn.nnnight.service.blog.BlogService;
import cn.nnnight.service.blog.BlogVisitorService;
import cn.nnnight.service.common.impl.BaseServiceImpl;

@Service
public class BlogVisitorServiceImpl extends BaseServiceImpl<BlogVisitor> implements BlogVisitorService {

	@Autowired
	private BlogVisitorDao blogVisitorDao;
	@Autowired
	private BlogService blogService;

	@Override
	public void addViewRecord(Integer blogId, Integer userId, String ipAddr) {
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("blogId", blogId);
		values.put("userId", userId);
		BlogVisitor entity = blogVisitorDao.getRecord(blogId, userId, ipAddr);
		if (entity != null) {
			entity.setCreateTime(new Date());
			entity.setClearFlag(0);
			entity.setIpAddress(ipAddr);
		} else {
			entity = new BlogVisitor();
			entity.setCreateTime(new Date());
			entity.setBlogId(blogId);
			entity.setUserId(userId);
			entity.setIpAddress(ipAddr);
			Blog blog = blogService.get(blogId);
			blog.setReadCount(blog.getReadCount() + 1);
			blogService.update(blog);
		}
		blogVisitorDao.saveOrUpdate(entity);
	}

}
