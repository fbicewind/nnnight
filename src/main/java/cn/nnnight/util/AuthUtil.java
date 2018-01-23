package cn.nnnight.util;

import org.springframework.security.core.context.SecurityContextHolder;

public class AuthUtil {

	public static Integer getId() {
		try {
			CustomUser userDetails = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			return userDetails.getId();
		} catch (Exception e) {
			return 0;
		}
	}
}
