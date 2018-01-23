package cn.nnnight.service.blog;

import cn.nnnight.entity.blog.BlogVisitor;
import cn.nnnight.service.common.BaseService;

public interface BlogVisitorService extends BaseService<BlogVisitor> {

	public void addViewRecord(Integer blogId, Integer userId, String ipAddr);
}
