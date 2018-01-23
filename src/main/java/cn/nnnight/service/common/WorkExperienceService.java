package cn.nnnight.service.common;

import java.util.List;

import cn.nnnight.entity.common.WorkExperience;
import cn.nnnight.vo.WorkExperienceVo;

public interface WorkExperienceService extends BaseService<WorkExperience> {

	public List<WorkExperienceVo> findAllList();
}
