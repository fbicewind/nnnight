package cn.nnnight.dao.common.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.nnnight.dao.common.UserDao;
import cn.nnnight.entity.common.User;
import cn.nnnight.util.Pager;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@Override
	public Pager<User> findIndexVisitor(Integer indexId) {
		String hql = "from User u inner join BlogIndexVisitor v on v.indexId=u.userId where v.indexId=:indexId and v.clearFlag=0 order by v.createTime desc";
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("indexId", indexId);
		return super.selectPageByHql(1, 8, hql, values);
	}

	@Override
	public Pager<User> findBlogVisitor(Integer blogId) {
		String hql = " select u from User u inner join BlogVisitor v on v.userId=u.userId where v.blogId=:blogId and v.clearFlag=0 order by v.createTime desc";
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("blogId", blogId);
		return super.selectPageByHql(1, 6, hql, values);
	}

}
