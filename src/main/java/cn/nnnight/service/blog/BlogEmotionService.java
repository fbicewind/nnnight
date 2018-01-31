package cn.nnnight.service.blog;

import cn.nnnight.entity.blog.BlogEmotion;
import cn.nnnight.entity.blog.BlogGoal;
import cn.nnnight.service.common.BaseService;
import cn.nnnight.util.Pager;

import java.util.List;

public interface BlogEmotionService extends BaseService<BlogEmotion> {

    public boolean saveEmotion(String text, String type);

    public List<BlogEmotion> getEmotions(int userId);

    public List<BlogGoal> getGoals(int userId);

    public Pager<BlogEmotion> selectEmotions(int userId, int pageNo, int pageSize);

    public boolean updateGoal(String id, String type);
}
