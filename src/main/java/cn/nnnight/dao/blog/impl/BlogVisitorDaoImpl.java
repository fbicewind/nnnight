package cn.nnnight.dao.blog.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.nnnight.dao.blog.BlogVisitorDao;
import cn.nnnight.dao.common.impl.BaseDaoImpl;
import cn.nnnight.entity.blog.BlogVisitor;

@Repository
public class BlogVisitorDaoImpl extends BaseDaoImpl<BlogVisitor> implements BlogVisitorDao {

	@Override
	public BlogVisitor getRecord(Integer blogId, Integer userId, String ipAddr) {
		StringBuilder hql = new StringBuilder("from BlogVisitor where (blogId=:blogId and userId=:userId and userId<>0)");
		hql.append(" or (blogId=:blogId and userId=:userId and ipAddress=:ipAddress)");
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("blogId", blogId);
		values.put("userId", userId);
		values.put("ipAddress", ipAddr);
		List<BlogVisitor> list = super.findListByHql(hql.toString(), values);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

}
