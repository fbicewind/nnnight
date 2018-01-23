package cn.nnnight.service.blog;

import java.util.List;

import cn.nnnight.entity.blog.BlogAlbum;
import cn.nnnight.service.common.BaseService;

public interface BlogAlbumService extends BaseService<BlogAlbum> {

	public void saveOrUpdateAlbum(BlogAlbum blogAlbum);
	
	public List<BlogAlbum> findAlbums(int userId);
}
