package cn.nnnight.dao.blog.impl;

import org.springframework.stereotype.Repository;

import cn.nnnight.dao.blog.BlogCommentDao;
import cn.nnnight.dao.common.impl.BaseDaoImpl;
import cn.nnnight.entity.blog.BlogComment;

@Repository
public class BlogCommentDaoImpl extends BaseDaoImpl<BlogComment> implements BlogCommentDao {

}
