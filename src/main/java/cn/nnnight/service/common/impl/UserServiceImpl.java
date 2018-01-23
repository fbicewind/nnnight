package cn.nnnight.service.common.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import cn.nnnight.dao.common.UserDao;
import cn.nnnight.entity.common.User;
import cn.nnnight.entity.common.UserExtInfo;
import cn.nnnight.service.common.UserExtInfoService;
import cn.nnnight.service.common.UserService;
import cn.nnnight.util.AuthUtil;
import cn.nnnight.util.CustomUser;
import cn.nnnight.util.EncryptUtil;
import cn.nnnight.util.Pager;
import cn.nnnight.vo.RegisterVo;

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private UserExtInfoService userExtInfoService;

	public void addUser() {
		User user = new User();
		user.setUserId(1);
		user.setUsername("user");
		user.setPassword(EncryptUtil.encrypt("1234"));
		userDao.save(user);
	}

	@Override
	public Pager<User> findIndexVisitor(Integer indexId) {
		return userDao.findIndexVisitor(indexId);
	}

	@Override
	public Pager<User> findBlogVisitor(Integer blogId) {
		return userDao.findBlogVisitor(blogId);
	}

	@Override
	public User getUserByParam(User user) {
		Map<String, Object> values = new HashMap<String, Object>();
		if (user.getUsername() != null && !"".equals(user.getUsername())) {
			values.put("username", user.getUsername());
		}
		if (user.getNickname() != null && !"".equals(user.getNickname())) {
			values.put("nickname", user.getNickname());
		}
		return userDao.getUniqueResult(values);
	}

	@Override
	public User addUser(RegisterVo vo) throws ParseException {
		Date now = new Date();
		User user = new User();
		BeanUtils.copyProperties(vo, user);
		user.setCreateTime(now);
		user.setPassword(EncryptUtil.encrypt(vo.getPassword()));
		user.setAvatar("head000.png");
		userDao.save(user);
		UserExtInfo userInfo = new UserExtInfo();
		BeanUtils.copyProperties(vo, userInfo);
		userInfo.setUserId(user.getUserId());
		if (vo.getBirthday() != null && !"".equals(vo.getBirthday())) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date birthday = sdf.parse(vo.getBirthday());
			userInfo.setBirthday(birthday);
		}
		userExtInfoService.save(userInfo);
		return user;
	}

	@Override
	public Integer modifyPassword(String password, String oldPassword) {
		int result = 0;
		User user = userDao.get(AuthUtil.getId());
		if (EncryptUtil.match(oldPassword, user.getPassword())) {
			user.setPassword(EncryptUtil.encrypt(password));
			userDao.update(user);
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}

	@Override
	public boolean modifyInfo(RegisterVo vo) {
		boolean flag = true;
		int userId = AuthUtil.getId();
		Date updateTime = new Date();
		User user = userDao.get(userId);
		UserExtInfo userInfo = userExtInfoService.get(userId);
		try {
			user.setRemark(vo.getRemark());
			user.setUpdateTime(updateTime);
			userInfo.setEmail(vo.getEmail());
			userInfo.setMobile(vo.getMobile());
			userInfo.setProfession(vo.getProfession());
			userInfo.setGender(vo.getGender());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date birthday = sdf.parse(vo.getBirthday());
			userInfo.setBirthday(birthday);
			userDao.update(user);
			userExtInfoService.update(userInfo);
		} catch (ParseException e) {
			flag = false;
		}
		return flag;
	}

	@Override
	public boolean modifyAvatar(String avatar) {
		boolean flag = false;
		User user = userDao.get(AuthUtil.getId());
		user.setAvatar(avatar);
		userDao.update(user);
		CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		userDetails.setAvatar(avatar);
		flag = true;
		return flag;
	}

}
