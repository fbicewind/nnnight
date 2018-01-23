package cn.nnnight.service.common.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import cn.nnnight.dao.common.BaseDao;
import cn.nnnight.service.common.BaseService;
import cn.nnnight.util.Pager;

public class BaseServiceImpl<T> implements BaseService<T> {

	@Autowired
	private BaseDao<T> dao;

	public T get(Serializable id) {
		return dao.get(id);
	}

	public T load(Serializable id) {
		return dao.load(id);
	}

	public void save(T entity) {
		dao.save(entity);
	}

	public void update(T entity) {
		dao.update(entity);
	}

	public void saveOrUpdate(T entity) {
		dao.saveOrUpdate(entity);
	}

	public void delete(T entity) {
		dao.delete(entity);
	}

	public void delete(Serializable id) {
		dao.delete(id);
	}

	public void delete(Serializable... ids) {
		dao.delete(ids);
	}

	public T getUniqueResult(String param, Object value) {
		return dao.getUniqueResult(param, value);
	}

	public T getUniqueResult(Map<String, ?> values) {
		return dao.getUniqueResult(values);
	}

	public List<T> findAll() {
		return dao.findAll();
	}

	public List<T> findAll(String order, boolean desc) {
		return dao.findAll(order, desc);
	}

	public List<T> findListByProterty(String param, Object value) {
		return dao.findListByProperty(param, value);
	}

	public List<T> findListByProterties(Map<String, ?> values) {
		return dao.findListByProperties(values);
	}

	public List<T> findListByProterty(String param, Object value, String order, boolean desc) {
		return dao.findListByProperty(param, value, order, desc);
	}

	public List<T> findListByProterties(Map<String, ?> values, String order, boolean desc) {
		return dao.findListByProperties(values, order, desc);
	}

	public Pager<T> selectPage(int pageNo, int pageSize) {
		return dao.selectPage(pageNo, pageSize);
	}

	public Pager<T> selectPage(int pageNo, int pageSize, String order, boolean desc) {
		return dao.selectPage(pageNo, pageSize, order, desc);
	}

	public Pager<T> selectPageByProterty(int pageNo, int pageSize, String param, Object value) {
		return dao.selectPageByProterty(pageNo, pageSize, param, value);
	}

	public Pager<T> selectPageByProterties(int pageNo, int pageSize, Map<String, ?> values) {
		return dao.selectPageByProterties(pageNo, pageSize, values);
	}

	public Pager<T> selectPageByProterty(int pageNo, int pageSize, String param, Object value, String order,
			boolean desc) {
		return dao.selectPageByProterty(pageNo, pageSize, param, value, order, desc);
	}

	public Pager<T> selectPageByProterties(int pageNo, int pageSize, Map<String, ?> values, String order,
			boolean desc) {
		return dao.selectPageByProterties(pageNo, pageSize, values, order, desc);
	}

	public long countResult() {
		return dao.countResult();
	}

	public int countByProperty(String param, Object value) {
		return dao.countByProperty(param, value);
	}

	public int countByProperties(Map<String, ?> values) {
		return dao.countByProperties(values);
	}

}
