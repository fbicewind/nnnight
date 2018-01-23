package cn.nnnight.service.common.impl;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.nnnight.dao.common.UserDao;
import cn.nnnight.dao.common.UserExtInfoDao;
import cn.nnnight.entity.common.User;
import cn.nnnight.entity.common.UserExtInfo;
import cn.nnnight.service.common.UserExtInfoService;
import cn.nnnight.vo.UserInfoVo;

@Service
public class UserExtInfoServiceImpl extends BaseServiceImpl<UserExtInfo> implements UserExtInfoService {

	@Autowired
	private UserExtInfoDao userExtInfoDao;
	@Autowired
	private UserDao userDao;

	@Override
	public UserInfoVo getInfo(Integer userId) {
		UserInfoVo vo = new UserInfoVo();
		UserExtInfo extInfo = userExtInfoDao.get(userId);
		User user = userDao.get(userId);
		BeanUtils.copyProperties(extInfo, vo);
		BeanUtils.copyProperties(user, vo);
		return vo;
	}

}
