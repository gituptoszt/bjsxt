package com.service;

import com.dao.LinkMapper;
import com.entity.Link;

import java.util.List;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LinkService {
	@Autowired
	private LinkMapper linkMapper;

	/**
	 * 插入
	 * 
	 * @param obj
	 * @return
	 */
	public int insert(Link obj) {
		int ret = linkMapper.insert(obj);
		return ret;
	}

	/**
	 * 真删除
	 * 
	 * @param obj
	 * @return
	 */
	public int delete(Link obj) {
		int ret = linkMapper.delete(obj);
		return ret;
	}

	/**
	 * 修改
	 * 
	 * @param obj
	 * @return
	 */
	public int update(Link obj) {
		int ret = linkMapper.update(obj);
		return ret;
	}

	/**
	 * 查询全部
	 * 
	 * @param obj
	 * @return
	 */
	public List<Link> selectAll(Link obj) {
		List<Link> list_obj = linkMapper
				.selectAll(obj);
		return list_obj;
	}

	/**
	 * 查询单个
	 * 
	 * @param obj
	 * @return
	 */
	public Link selectOne(Link obj) {
		List<Link> list = new ArrayList<Link>();
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
	public int selectCount(Link obj) {
		int ret = linkMapper.selectCount(obj);
		return ret;
	}

	/**
	 * 查询是否存在 true:存在
	 * 
	 * @param obj
	 * @return
	 */
	public boolean selectExist(Link obj) {
		Link ret= selectOne(obj);
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
		int ret = linkMapper.deleteAll(list);
		return ret;
	}
}
