package cn.nnnight.service.blog;

import cn.nnnight.entity.blog.BlogPraise;
import cn.nnnight.service.common.BaseService;

public interface BlogPraiseService extends BaseService<BlogPraise> {

	public void praiseBlog(Integer userId, Integer blogId, Integer state);
}
