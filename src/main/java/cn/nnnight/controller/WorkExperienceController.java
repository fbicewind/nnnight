package cn.nnnight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cn.nnnight.service.common.WorkExperienceService;
import cn.nnnight.vo.WorkExperienceVo;

@RestController
@RequestMapping("/experience")
public class WorkExperienceController {

	@Autowired
	private WorkExperienceService workExperienceService;

	@RequestMapping("/list")
	public List<WorkExperienceVo> list() {
		return workExperienceService.findAllList();
	}
}
