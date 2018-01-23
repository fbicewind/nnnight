package cn.nnnight.service.blog;

import cn.nnnight.entity.blog.BlogFavorite;
import cn.nnnight.service.common.BaseService;

public interface BlogFavoriteService extends BaseService<BlogFavorite> {

	public void favoriteBlog(Integer userId, Integer blogId, Integer state);
}
