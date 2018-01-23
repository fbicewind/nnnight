package cn.nnnight.service.common.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import cn.nnnight.dao.common.UserDao;
import cn.nnnight.entity.common.User;
import cn.nnnight.util.CustomUser;

public class CustomUserDetailServiceImpl implements UserDetailsService {

	@Autowired
	private UserDao userDao;

	@Transactional
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userDao.getUniqueResult("username", username);
		CustomUser customUser = new CustomUser(user.getUsername(), user.getPassword(), true, true, true, true,
				getAuthorities(user.getRole()));
		customUser.setId(user.getUserId());
		customUser.setNickname(user.getNickname());
		customUser.setAvatar(user.getAvatar());
		return customUser;
	}

	/**
	 * 获取用户权限
	 * 
	 * @param access
	 * @return
	 */
	public Collection<GrantedAuthority> getAuthorities(Integer role) {
		List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>(2);
		// 通用权限
		authList.add(new SimpleGrantedAuthority("ROLE_USER"));
		// 管理权限
		if (role.compareTo(2) == 0) {
			authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		}
		return authList;
	}

}
