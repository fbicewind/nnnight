package cn.nnnight.service.blog.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.nnnight.dao.blog.BlogAlbumDao;
import cn.nnnight.entity.blog.BlogAlbum;
import cn.nnnight.service.blog.BlogAlbumService;
import cn.nnnight.service.common.impl.BaseServiceImpl;
import cn.nnnight.util.AuthUtil;
import cn.nnnight.util.Constants;

@Service
public class BlogAlbumServiceImpl extends BaseServiceImpl<BlogAlbum> implements BlogAlbumService {

	@Autowired
	private BlogAlbumDao blogAlbumDao;

	@Override
	public void saveOrUpdateAlbum(BlogAlbum blogAlbum) {
		BlogAlbum entity = new BlogAlbum();
		BeanUtils.copyProperties(blogAlbum, entity);
		if (blogAlbum.getAlbumId() == 0) {
			entity.setCreateTime(new Date());
			entity.setUserId(AuthUtil.getId());
			entity.setCoverImg(Constants.DEFAULT_COVER);
		}
		blogAlbumDao.saveOrUpdate(entity);

	}

	@Override
	public List<BlogAlbum> findAlbums(int userId) {
		Map<String, Object> values = new HashMap<>();
		values.put("userId", userId);
		if (userId != AuthUtil.getId()) {
			values.put("publicFlag", Constants.TRUE_FLAG);
		}
		return blogAlbumDao.findListByProperties(values, "createTime", true);
	}

}
