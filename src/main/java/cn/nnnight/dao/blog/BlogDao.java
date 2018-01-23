package cn.nnnight.dao.blog;

import java.util.Map;

import cn.nnnight.dao.common.BaseDao;
import cn.nnnight.entity.blog.Blog;
import cn.nnnight.util.Pager;

public interface BlogDao extends BaseDao<Blog> {

	public Pager<Blog> selectBlogs(Integer pageNo, Integer pageSize, Map<String, Object> values);

	public Blog getPrev(Map<String, Object> values);

	public Blog getTopPrev(Map<String, Object> values);

	public Blog getNext(Map<String, Object> values);

	public Blog getNoTopNext(Map<String, Object> values);

	public Pager<Blog> selectFavorableBlogs(Integer pageNo, Integer pageSize, Map<String, Object> values);

}
