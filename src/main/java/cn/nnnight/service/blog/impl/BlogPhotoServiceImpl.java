package cn.nnnight.service.blog.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.nnnight.dao.blog.BlogAlbumDao;
import cn.nnnight.dao.blog.BlogPhotoDao;
import cn.nnnight.entity.blog.BlogAlbum;
import cn.nnnight.entity.blog.BlogPhoto;
import cn.nnnight.service.blog.BlogPhotoService;
import cn.nnnight.service.common.impl.BaseServiceImpl;
import cn.nnnight.util.AuthUtil;
import cn.nnnight.util.Constants;

@Service
public class BlogPhotoServiceImpl extends BaseServiceImpl<BlogPhoto> implements BlogPhotoService {

	@Autowired
	private BlogPhotoDao blogPhotoDao;
	@Autowired
	private BlogAlbumDao blogAlbumDao;

	@Override
	public void savePhoto(int albumId, String fileName) {
		BlogPhoto entity = new BlogPhoto();
		entity.setAlbumId(albumId);
		entity.setCreateTime(new Date());
		entity.setPhoto(fileName);
		entity.setUserId(AuthUtil.getId());
		blogPhotoDao.save(entity);
		BlogAlbum album = blogAlbumDao.get(albumId);
		album.setPhotoCount(album.getPhotoCount() + 1);
		blogAlbumDao.update(album);
	}

	@Override
	public List<BlogPhoto> findPhotos(int userId, int albumId) {
		Map<String, Object> values = new HashMap<>();
		values.put("deleteFlag", Constants.FALSE_FLAG);
		values.put("userId", userId);
		values.put("albumId", albumId);
		return blogPhotoDao.findListByProperties(values, "createTime", true);
	}

}
