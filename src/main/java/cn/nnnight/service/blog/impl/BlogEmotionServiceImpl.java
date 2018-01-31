package cn.nnnight.service.blog.impl;

import cn.nnnight.dao.blog.BlogEmotionDao;
import cn.nnnight.dao.blog.BlogGoalDao;
import cn.nnnight.entity.blog.BlogEmotion;
import cn.nnnight.entity.blog.BlogGoal;
import cn.nnnight.service.blog.BlogEmotionService;
import cn.nnnight.service.common.impl.BaseServiceImpl;
import cn.nnnight.util.AuthUtil;
import cn.nnnight.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class BlogEmotionServiceImpl extends BaseServiceImpl<BlogEmotion> implements BlogEmotionService {

    @Autowired
    private BlogEmotionDao blogEmotionDao;
    @Autowired
    private BlogGoalDao blogGoalDao;

    @Override
    public boolean saveEmotion(String text, String type) {
        boolean flag = false;
        int userId = AuthUtil.getId();
        try {
            if ("2".equals(type)) {
                BlogGoal entity = new BlogGoal();
                entity.setGoal(text);
                entity.setStartTime(new Date());
                entity.setUserId(userId);
                entity.setStatus("0");
                entity.setId(UUID.randomUUID().toString());
                blogGoalDao.save(entity);
            } else {
                BlogEmotion entity = new BlogEmotion();
                entity.setCreateTime(new Date());
                entity.setEmotion(text);
                entity.setId(UUID.randomUUID().toString());
                entity.setPraiseCount(0);
                entity.setUserId(userId);
                blogEmotionDao.save(entity);
            }
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public List<BlogEmotion> getEmotions(int userId) {
        Map<String, Object> values = new HashMap<>();
        values.put("userId", userId);
        return blogEmotionDao.findListByProperties(values, "createTime", true);
    }

    @Override
    public List<BlogGoal> getGoals(int userId) {
        Map<String, Object> values = new HashMap<>();
        values.put("userId", userId);
        return blogGoalDao.findListByProperties(values, "startTime", true);
    }

    @Override
    public Pager<BlogEmotion> selectEmotions(int userId, int pageNo, int pageSize) {
        Map<String, Object> values = new HashMap<>();
        values.put("userId", userId);
        return blogEmotionDao.selectPageByProterties(pageNo, pageSize, values, "createTime", true);
    }

    @Override
    public boolean updateGoal(String id, String type) {
        boolean flag = false;
        int currentId = AuthUtil.getId();
        BlogGoal blogGoal = blogGoalDao.get(id);
        if (blogGoal.getUserId() == currentId) {
            blogGoal.setStatus(type);
            blogGoal.setEndTime(new Date());
            blogGoalDao.update(blogGoal);
        }
        return flag;
    }
}
