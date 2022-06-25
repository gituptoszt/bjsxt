package com.service;

import com.dao.UserMapper;
import com.entity.User;

import java.util.List;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;

	/**
	 * 插入
	 * 
	 * @param obj
	 * @return
	 */
	public int insert(User obj) {
		int ret = userMapper.insert(obj);
		return ret;
	}

	/**
	 * 真删除
	 * 
	 * @param obj
	 * @return
	 */
	public int delete(User obj) {
		int ret = userMapper.delete(obj);
		return ret;
	}

	/**
	 * 修改
	 * 
	 * @param obj
	 * @return
	 */
	public int update(User obj) {
		int ret = userMapper.update(obj);
		return ret;
	}

	/**
	 * 查询全部
	 * 
	 * @param obj
	 * @return
	 */
	public List<User> selectAll(User obj) {
		List<User> list_obj = userMapper
				.selectAll(obj);
		return list_obj;
	}

	/**
	 * 查询单个
	 * 
	 * @param obj
	 * @return
	 */
	public User selectOne(User obj) {
		List<User> list = new ArrayList<User>();
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
	public int selectCount(User obj) {
		int ret = userMapper.selectCount(obj);
		return ret;
	}

	/**
	 * 查询是否存在 true:存在
	 * 
	 * @param obj
	 * @return
	 */
	public boolean selectExist(User obj) {
		User ret= selectOne(obj);
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
		int ret = userMapper.deleteAll(list);
		return ret;
	}
}
