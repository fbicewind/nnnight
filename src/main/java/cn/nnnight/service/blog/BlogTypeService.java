package cn.nnnight.service.blog;

import java.util.List;

import cn.nnnight.entity.blog.BlogType;
import cn.nnnight.service.common.BaseService;

public interface BlogTypeService extends BaseService<BlogType> {

	public BlogType addBlogType(String typeName);

	public List<BlogType> selectByProperties(BlogType vo);

	public BlogType getType(Integer typeId);
}
