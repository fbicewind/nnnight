package cn.nnnight.dao.common;

import cn.nnnight.entity.common.User;
import cn.nnnight.util.Pager;

public interface UserDao extends BaseDao<User> {

	public Pager<User> findIndexVisitor(Integer indexId);

	public Pager<User> findBlogVisitor(Integer blogId);
}
