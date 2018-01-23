package cn.nnnight.service.blog;

import java.util.List;

import cn.nnnight.entity.blog.Blog;
import cn.nnnight.service.common.BaseService;
import cn.nnnight.util.Pager;
import cn.nnnight.vo.BlogVo;

public interface BlogService extends BaseService<Blog> {

	public Pager<Blog> selectPageByVo(Integer pageNo, Integer pageSize, Blog vo, String order, boolean desc);

	public Blog saveBlog(Blog vo);

	public List<BlogVo> selectIndexBlogs(Integer userId);

	public Pager<BlogVo> selectBlogs(Integer pageNo, Integer pageSize, Integer userId, String type, Integer typeId);

	public BlogVo getBlog(Integer blogId);

	public Blog getPrevBlog(BlogVo vo, boolean flag);

	public Blog getNextBlog(BlogVo vo, boolean flag);
	
	public boolean isExistBlog(Integer blogId, Integer isDraft);
	
	public boolean delBlog(Integer blogId);
}
