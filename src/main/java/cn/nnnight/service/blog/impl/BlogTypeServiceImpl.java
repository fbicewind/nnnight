package cn.nnnight.service.blog.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.nnnight.dao.blog.BlogTypeDao;
import cn.nnnight.entity.blog.BlogType;
import cn.nnnight.service.blog.BlogTypeService;
import cn.nnnight.service.common.impl.BaseServiceImpl;
import cn.nnnight.util.AuthUtil;

@Service
public class BlogTypeServiceImpl extends BaseServiceImpl<BlogType> implements BlogTypeService {

	@Autowired
	private BlogTypeDao blogTypeDao;

	@Override
	public BlogType addBlogType(String typeName) {
		BlogType entity = new BlogType();
		entity.setCreateTime(new Date());
		entity.setTypeName(typeName);
		entity.setUserId(AuthUtil.getId());
		blogTypeDao.save(entity);
		return entity;
	}

	@Override
	public List<BlogType> selectByProperties(BlogType vo) {
		Map<String, Object> values = new HashMap<String, Object>();
		if (vo.getTypeName() != null && !"".equals(vo.getTypeName())) {
			values.put("typeName", vo.getTypeName());
		}
		if (vo.getUserId() != 0) {
			values.put("userId", vo.getUserId());
		}
		return super.findListByProterties(values, "typeName", false);
	}

	@Override
	public BlogType getType(Integer typeId) {
		return super.get(typeId);
	}

}
