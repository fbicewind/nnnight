package cn.nnnight.service.blog;

import cn.nnnight.entity.blog.BlogComment;
import cn.nnnight.service.common.BaseService;
import cn.nnnight.util.Pager;
import cn.nnnight.vo.BlogCommentVo;

public interface BlogCommentService extends BaseService<BlogComment> {

	Pager<BlogCommentVo> selectComments(Integer blogId, Integer pageNo, Integer pageSize);
	
	public BlogComment saveComment(BlogComment blogComment);
}
