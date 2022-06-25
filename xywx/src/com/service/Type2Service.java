package com.service;

import com.dao.Type2Mapper;
import com.entity.Type2;

import java.util.List;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Type2Service {
	@Autowired
	private Type2Mapper type2Mapper;

	/**
	 * 插入
	 * 
	 * @param obj
	 * @return
	 */
	public int insert(Type2 obj) {
		int ret = type2Mapper.insert(obj);
		return ret;
	}

	/**
	 * 真删除
	 * 
	 * @param obj
	 * @return
	 */
	public int delete(Type2 obj) {
		int ret = type2Mapper.delete(obj);
		return ret;
	}

	/**
	 * 修改
	 * 
	 * @param obj
	 * @return
	 */
	public int update(Type2 obj) {
		int ret = type2Mapper.update(obj);
		return ret;
	}

	/**
	 * 查询全部
	 * 
	 * @param obj
	 * @return
	 */
	public List<Type2> selectAll(Type2 obj) {
		List<Type2> list_obj = type2Mapper
				.selectAll(obj);
		return list_obj;
	}

	/**
	 * 查询单个
	 * 
	 * @param obj
	 * @return
	 */
	public Type2 selectOne(Type2 obj) {
		List<Type2> list = new ArrayList<Type2>();
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
	public int selectCount(Type2 obj) {
		int ret = type2Mapper.selectCount(obj);
		return ret;
	}

	/**
	 * 查询是否存在 true:存在
	 * 
	 * @param obj
	 * @return
	 */
	public boolean selectExist(Type2 obj) {
		Type2 ret= selectOne(obj);
		if (ret == null)
			return false;
		else
			return true;
	}

}
