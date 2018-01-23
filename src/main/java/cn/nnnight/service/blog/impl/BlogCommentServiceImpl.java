package cn.nnnight.service.blog.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.nnnight.dao.blog.BlogCommentDao;
import cn.nnnight.entity.blog.Blog;
import cn.nnnight.entity.blog.BlogComment;
import cn.nnnight.entity.common.User;
import cn.nnnight.service.blog.BlogCommentService;
import cn.nnnight.service.blog.BlogService;
import cn.nnnight.service.common.UserService;
import cn.nnnight.service.common.impl.BaseServiceImpl;
import cn.nnnight.util.Pager;
import cn.nnnight.vo.BlogCommentVo;

@Service
public class BlogCommentServiceImpl extends BaseServiceImpl<BlogComment> implements BlogCommentService {

	@Autowired
	private BlogCommentDao blogCommentDao;
	@Autowired
	private UserService userService;
	@Autowired
	private BlogService blogService;

	@Override
	public Pager<BlogCommentVo> selectComments(Integer blogId, Integer pageNo, Integer pageSize) {
		List<BlogCommentVo> list = new ArrayList<BlogCommentVo>();
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("blogId", blogId);
		Pager<BlogComment> comments = blogCommentDao.selectPageByProterties(pageNo, pageSize, values, "createTime",
				false);
		if (comments.getDatalist() != null) {
			for (BlogComment comment : comments.getDatalist()) {
				BlogCommentVo vo = new BlogCommentVo();
				BeanUtils.copyProperties(comment, vo);
				User user = userService.get(comment.getUserId());
				vo.setAvatar(user.getAvatar());
				vo.setNickname(user.getNickname());
				list.add(vo);
			}
		}
		return new Pager<>(pageSize, pageNo, comments.getTotalSize(), list);
	}

	@Override
	public BlogComment saveComment(BlogComment blogComment) {
		BlogComment entity = new BlogComment();
		BeanUtils.copyProperties(blogComment, entity);
		entity.setCreateTime(new Date());
		blogCommentDao.save(entity);
		Blog blog = blogService.get(blogComment.getBlogId());
		blog.setCommentCount(blog.getCommentCount() + 1);
		blogService.update(blog);
		return entity;
	}

}
