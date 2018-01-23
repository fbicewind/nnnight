package cn.nnnight.service.common;

import java.text.ParseException;

import cn.nnnight.entity.common.User;
import cn.nnnight.util.Pager;
import cn.nnnight.vo.RegisterVo;

public interface UserService extends BaseService<User> {

	public void addUser();

	public Pager<User> findIndexVisitor(Integer indexId);

	public Pager<User> findBlogVisitor(Integer blogId);

	public User getUserByParam(User user);

	public User addUser(RegisterVo vo) throws ParseException;

	public Integer modifyPassword(String password, String oldPassword);

	public boolean modifyInfo(RegisterVo vo);
	
	public boolean modifyAvatar(String avatar);

}
