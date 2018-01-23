package cn.nnnight.service.common;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import cn.nnnight.util.Pager;

public interface BaseService<T> {

	public T get(Serializable id);

	public T load(Serializable id);

	// 添加实体
	public void save(T entity);

	// 更新实体
	public void update(T entity);

	// 实体存在时更新，不存在则添加
	public void saveOrUpdate(T entity);

	// 根据实体删除实体
	public void delete(T entity);

	// 根据ID删除实体
	public void delete(Serializable id);

	// 根据多个ID删除多个实体
	public void delete(Serializable... ids);

	// 根据单个参数查找唯一结果
	public T getUniqueResult(String param, Object value);

	// 根据Map查找唯一结果
	public T getUniqueResult(Map<String, ?> values);

	// 全部list
	public List<T> findAll();

	// 排序全部list
	public List<T> findAll(String order, boolean desc);

	// 根据单个参数查找list
	public List<T> findListByProterty(String param, Object value);

	// 根据Map查找list
	public List<T> findListByProterties(Map<String, ?> values);

	// 根据单个参数查找list，并排序
	public List<T> findListByProterty(String param, Object value, String order, boolean desc);

	// 根据Map查找list，并排序
	public List<T> findListByProterties(Map<String, ?> values, String order, boolean desc);

	// 简单分页查找
	public Pager<T> selectPage(int pageNo, int pageSize);

	// 简单排序分页查找
	public Pager<T> selectPage(int pageNo, int pageSize, String order, boolean desc);

	// 根据某个参数分页查找
	public Pager<T> selectPageByProterty(int pageNo, int pageSize, String param, Object value);

	// 根据参数Map分页查找
	public Pager<T> selectPageByProterties(int pageNo, int pageSize, Map<String, ?> values);

	// 根据某个参数分页查找，并排序
	public Pager<T> selectPageByProterty(int pageNo, int pageSize, String param, Object value, String order,
			boolean desc);

	// 根据参数Map分页查找，并排序
	public Pager<T> selectPageByProterties(int pageNo, int pageSize, Map<String, ?> values, String order, boolean desc);

	// 计数
	public long countResult();

	// 根据某个参数计数
	public int countByProperty(String param, Object value);

	// 根据Map计数
	public int countByProperties(Map<String, ?> values);

}