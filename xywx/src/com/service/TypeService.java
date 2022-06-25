package com.service;

import com.dao.TypeMapper;
import com.entity.Type;

import java.util.List;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TypeService {
	@Autowired
	private TypeMapper typeMapper;

	/**
	 * 插入
	 * 
	 * @param obj
	 * @return
	 */
	public int insert(Type obj) {
		int ret = typeMapper.insert(obj);
		return ret;
	}

	/**
	 * 真删除
	 * 
	 * @param obj
	 * @return
	 */
	public int delete(Type obj) {
		int ret = typeMapper.delete(obj);
		return ret;
	}

	/**
	 * 修改
	 * 
	 * @param obj
	 * @return
	 */
	public int update(Type obj) {
		int ret = typeMapper.update(obj);
		return ret;
	}

	/**
	 * 查询全部
	 * 
	 * @param obj
	 * @return
	 */
	public List<Type> selectAll(Type obj) {
		List<Type> list_obj = typeMapper
				.selectAll(obj);
		return list_obj;
	}

	/**
	 * 查询单个
	 * 
	 * @param obj
	 * @return
	 */
	public Type selectOne(Type obj) {
		List<Type> list = new ArrayList<Type>();
		list = selectAll(obj);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;

	}

	/**
	 * 查询数量
	 * 
	 * @param obj
	 * @return
	 */
	public int selectCount(Type obj) {
		int ret = typeMapper.selectCount(obj);
		return ret;
	}

	/**
	 * 查询是否存在 true:存在
	 * 
	 * @param obj
	 * @return
	 */
	public boolean selectExist(Type obj) {
		Type ret= selectOne(obj);
		if (ret == null)
			return false;
		else
			return true;
	}
	/**
	 * 批量真删除
	 * 
	 * @param obj
	 * @return
	 */
	public int deleteAll(List<String> list) {
		int ret = typeMapper.deleteAll(list);
		return ret;
	}
}
