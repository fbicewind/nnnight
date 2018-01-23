package cn.nnnight.service.blog;

import java.util.List;

import cn.nnnight.entity.blog.BlogPhoto;
import cn.nnnight.service.common.BaseService;

public interface BlogPhotoService extends BaseService<BlogPhoto> {

	public void savePhoto(int albumId, String fileName);

	public List<BlogPhoto> findPhotos(int userId, int albumId);
}
