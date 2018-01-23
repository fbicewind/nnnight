package cn.nnnight.dao.blog.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.nnnight.dao.blog.BlogDao;
import cn.nnnight.dao.common.impl.BaseDaoImpl;
import cn.nnnight.entity.blog.Blog;
import cn.nnnight.util.Pager;

@Repository
public class BlogDaoImpl extends BaseDaoImpl<Blog> implements BlogDao {

	@Override
	public Pager<Blog> selectBlogs(Integer pageNo, Integer pageSize, Map<String, Object> values) {
		StringBuilder hql = new StringBuilder("from Blog where userId=:userId and draftFlag=:draftFlag");
		hql.append(" and publicFlag=:publicFlag and deleteFlag=:deleteFlag");
		if(values.containsKey("typeId")){
			hql.append(" and typeId=:typeId");
		}
		hql.append(" order by topFlag desc,createTime desc");
		return super.selectPageByHql(pageNo, pageSize, hql.toString(), values);
	}

	@Override
	public Blog getNext(Map<String, Object> values) {
		StringBuilder hql = new StringBuilder("from Blog where userId=:userId and topFlag=:topFlag");
		hql.append(" and draftFlag=:draftFlag and publicFlag=:publicFlag");
		hql.append(" and deleteFlag=:deleteFlag and createTime<:createTime");
		if(values.containsKey("typeId")){
			hql.append(" and typeId=:typeId");
		}
		hql.append(" order by topFlag desc,createTime desc");
		Pager<Blog> pager = super.selectPageByHql(1, 1, hql.toString(), values);
		return pager.getDatalist() == null ? null : pager.getDatalist().get(0);
	}

	@Override
	public Blog getPrev(Map<String, Object> values) {
		StringBuilder hql = new StringBuilder("from Blog where userId=:userId and topFlag=:topFlag");
		hql.append(" and draftFlag=:draftFlag and publicFlag=:publicFlag");
		hql.append(" and deleteFlag=:deleteFlag and createTime>:createTime");
		if(values.containsKey("typeId")){
			hql.append(" and typeId=:typeId");
		}
		hql.append(" order by topFlag asc,createTime asc");
		Pager<Blog> pager = super.selectPageByHql(1, 1, hql.toString(), values);
		return pager.getDatalist() == null ? null : pager.getDatalist().get(0);
	}

	@Override
	public Blog getTopPrev(Map<String, Object> values) {
		StringBuilder hql = new StringBuilder("from Blog where userId=:userId and topFlag=:topFlag");
		hql.append(" and draftFlag=:draftFlag and publicFlag=:publicFlag");
		hql.append(" and deleteFlag=:deleteFlag");
		if(values.containsKey("typeId")){
			hql.append(" and typeId=:typeId");
		}
		hql.append(" order by topFlag asc,createTime asc");
		Pager<Blog> pager = super.selectPageByHql(1, 1, hql.toString(), values);
		return pager.getDatalist() == null ? null : pager.getDatalist().get(0);
	}

	@Override
	public Blog getNoTopNext(Map<String, Object> values) {
		StringBuilder hql = new StringBuilder("from Blog where userId=:userId and topFlag=:topFlag");
		hql.append(" and draftFlag=:draftFlag and publicFlag=:publicFlag");
		hql.append(" and deleteFlag=:deleteFlag");
		if(values.containsKey("typeId")){
			hql.append(" and typeId=:typeId");
		}
		hql.append(" order by topFlag desc,createTime desc");
		Pager<Blog> pager = super.selectPageByHql(1, 1, hql.toString(), values);
		return pager.getDatalist() == null ? null : pager.getDatalist().get(0);
	}

	@Override
	public Pager<Blog> selectFavorableBlogs(Integer pageNo, Integer pageSize, Map<String, Object> values) {
		StringBuilder hql = new StringBuilder("select b from Blog b inner join BlogFavorite bf on b.blogId=bf.blogId");
		hql.append(" and b.draftFlag=:draftFlag and b.publicFlag=:publicFlag");
		hql.append(" and b.deleteFlag=:deleteFlag and bf.userId=:userId");
		hql.append(" order by bf.createTime desc");
		return super.selectPageByHql(pageNo, pageSize, hql.toString(), values);
	}

}
