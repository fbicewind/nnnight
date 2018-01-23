package cn.nnnight.service.common.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.nnnight.dao.common.WorkExperienceDao;
import cn.nnnight.entity.common.WorkExperience;
import cn.nnnight.service.common.WorkExperienceService;
import cn.nnnight.util.Constants;
import cn.nnnight.vo.WorkExperienceVo;

@Service
public class WorkExperienceServiceImpl extends BaseServiceImpl<WorkExperience> implements WorkExperienceService {

	@Autowired
	private WorkExperienceDao workExperienceDao;

	@Override
	public List<WorkExperienceVo> findAllList() {
		List<WorkExperience> list = workExperienceDao.findAll("startDate", false);
		List<WorkExperienceVo> vos = new ArrayList<WorkExperienceVo>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM");
		for (WorkExperience entity : list) {
			WorkExperienceVo vo = new WorkExperienceVo();
			StringBuilder workTechnology = new StringBuilder("");
			BeanUtils.copyProperties(entity, vo);
			for (String tech : vo.getWorkTechnology().split(",")) {
				workTechnology.append("<span class='resume-inline'>").append(tech).append("</span>").append(" + ");
			}
			vo.setWorkTechnology(workTechnology.substring(0, workTechnology.length() - 3));
			vo.setStartDate(sdf.format(entity.getStartDate()));
			if (entity.getEndDate() != null && !"".equals(entity.getEndDate())) {
				vo.setEndDate(sdf.format(entity.getEndDate()));
			} else {
				vo.setEndDate(Constants.NOW);
			}
			vos.add(vo);
		}
		return vos;
	}

}
