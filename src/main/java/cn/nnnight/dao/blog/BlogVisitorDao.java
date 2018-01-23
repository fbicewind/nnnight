package cn.nnnight.dao.blog;

import cn.nnnight.dao.common.BaseDao;
import cn.nnnight.entity.blog.BlogVisitor;

public interface BlogVisitorDao extends BaseDao<BlogVisitor> {

	public BlogVisitor getRecord(Integer blogId, Integer userId, String ipAddr);
}
