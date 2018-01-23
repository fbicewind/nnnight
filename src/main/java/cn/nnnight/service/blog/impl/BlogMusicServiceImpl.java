package cn.nnnight.service.blog.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.nnnight.dao.blog.BlogMusicDao;
import cn.nnnight.entity.blog.BlogMusic;
import cn.nnnight.service.blog.BlogMusicService;
import cn.nnnight.service.common.impl.BaseServiceImpl;
import cn.nnnight.util.AuthUtil;

@Service
public class BlogMusicServiceImpl extends BaseServiceImpl<BlogMusic> implements BlogMusicService {

	@Autowired
	private BlogMusicDao blogMusicDao;

	@Override
	public void saveMusic(BlogMusic vo) {
		BlogMusic entity = null;
		if (vo.getMusicId() == null || "".equals(vo.getMusicId())) {
			entity = new BlogMusic();
			BeanUtils.copyProperties(vo, entity);
			entity.setMusicId(UUID.randomUUID().toString());
			entity.setCreateTime(new Date());
			entity.setUserId(AuthUtil.getId());
			if (entity.getCover() == null || "".equals(entity.getCover())) {
				entity.setCover("/static/upload/music/cover/0.jpg");
			}
			blogMusicDao.save(entity);
		} else {
			entity = blogMusicDao.get(vo.getMusicId());
			if (entity.getCover() == null || "".equals(entity.getCover())) {
				entity.setCover("/static/upload/music/cover/0.jpg");
			} else {
				entity.setCover(vo.getCover());
			}
			entity.setLrcurl(vo.getLrcurl());
			entity.setSinger(vo.getSinger());
			entity.setTitle(vo.getTitle());
			entity.setType(vo.getType());
			entity.setUrl(vo.getUrl());
			blogMusicDao.update(entity);
		}
	}

	@Override
	public List<BlogMusic> getList(int userId) {
		return blogMusicDao.findListByProperty("userId", userId, "createTime", false);
	}

	@Override
	public boolean deleteMusic(String musicId) {
		BlogMusic entity = blogMusicDao.get(musicId);
		if (entity.getUserId() != AuthUtil.getId()) {
			return false;
		}
		blogMusicDao.delete(entity);
		return true;
	}

}
