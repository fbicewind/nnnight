package cn.nnnight.service.blog;

import java.util.List;

import cn.nnnight.entity.blog.BlogMusic;
import cn.nnnight.service.common.BaseService;

public interface BlogMusicService extends BaseService<BlogMusic> {

	public void saveMusic(BlogMusic vo);

	public List<BlogMusic> getList(int userId);
	
	public boolean deleteMusic(String musicId);
}
