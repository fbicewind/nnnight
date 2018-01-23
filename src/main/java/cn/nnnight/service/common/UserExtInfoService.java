package cn.nnnight.service.common;

import cn.nnnight.entity.common.UserExtInfo;
import cn.nnnight.vo.UserInfoVo;

public interface UserExtInfoService extends BaseService<UserExtInfo> {

	public UserInfoVo getInfo(Integer userId);
}
