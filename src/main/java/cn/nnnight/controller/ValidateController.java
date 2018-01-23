package cn.nnnight.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.nnnight.entity.blog.BlogAlbum;
import cn.nnnight.entity.blog.BlogType;
import cn.nnnight.entity.common.User;
import cn.nnnight.service.blog.BlogAlbumService;
import cn.nnnight.service.blog.BlogTypeService;
import cn.nnnight.service.common.UserService;
import cn.nnnight.util.AuthUtil;
import cn.nnnight.util.Constants;

@RestController
@RequestMapping("/validate")
public class ValidateController {

	@Autowired
	private BlogTypeService blogTypeService;
	@Autowired
	private UserService userService;
	@Autowired
	private BlogAlbumService blogAlbumService;

	@RequestMapping("/newType")
	public ModelMap newType(@RequestParam String typeName) {
		ModelMap map = new ModelMap();
		if (typeName.equals(Constants.MYBLOGTYPE)) {
			map.put("status", "0");
		} else {
			BlogType vo = new BlogType();
			vo.setTypeName(typeName);
			vo.setTypeId(AuthUtil.getId());
			List<BlogType> list = blogTypeService.selectByProperties(vo);
			if (list != null && !list.isEmpty()) {
				map.put("status", "0");
			} else {
				map.put("status", "1");
			}
		}
		return map;
	}

	@RequestMapping("/username")
	public ModelMap username(@RequestParam String username) {
		ModelMap map = new ModelMap();
		User vo = new User();
		vo.setUsername(username);
		User user = userService.getUserByParam(vo);
		if (user == null) {
			map.put("status", "0");
		} else {
			map.put("status", "1");
		}
		return map;
	}

	@RequestMapping("/nickname")
	public ModelMap nickname(@RequestParam String nickname) {
		ModelMap map = new ModelMap();
		User vo = new User();
		vo.setNickname(nickname);
		User user = userService.getUserByParam(vo);
		if (user == null) {
			map.put("status", "0");
		} else {
			map.put("status", "1");
		}
		return map;
	}

	@RequestMapping("/albumName")
	public ModelMap albumName(@RequestParam String albumName) {
		ModelMap map = new ModelMap();
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("albumName", albumName);
		BlogAlbum album = blogAlbumService.getUniqueResult(values);
		if (album == null) {
			map.put("status", "0");
		} else {
			map.put("status", "1");
		}
		return map;
	}
}
