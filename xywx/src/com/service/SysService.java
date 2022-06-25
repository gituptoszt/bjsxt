package com.service;

import com.dao.SysMapper;
import com.entity.Sys;

import java.util.List;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SysService {
	@Autowired
	private SysMapper sysMapper;

	/**
	 * 插入
	 * 
	 * @param obj
	 * @return
	 */
	public int insert(Sys obj) {
		int ret = sysMapper.insert(obj);
		return ret;
	}

	/**
	 * 真删除
	 * 
	 * @param obj
	 * @return
	 */
	public int delete(Sys obj) {
		int ret = sysMapper.delete(obj);
		return ret;
	}

	/**
	 * 修改
	 * 
	 * @param obj
	 * @return
	 */
	public int update(Sys obj) {
		int ret = sysMapper.update(obj);
		return ret;
	}

	/**
	 * 查询全部
	 * 
	 * @param obj
	 * @return
	 */
	public List<Sys> selectAll(Sys obj) {
		List<Sys> list_obj = sysMapper
				.selectAll(obj);
		return list_obj;
	}

	/**
	 * 查询单个
	 * 
	 * @param obj
	 * @return
	 */
	public Sys selectOne(Sys obj) {
		List<Sys> list = new ArrayList<Sys>();
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
	public int selectCount(Sys obj) {
		int ret = sysMapper.selectCount(obj);
		return ret;
	}

	/**
	 * 查询是否存在 true:存在
	 * 
	 * @param obj
	 * @return
	 */
	public boolean selectExist(Sys obj) {
		Sys ret= selectOne(obj);
		if (ret == null)
			return false;
		else
			return true;
	}

}
