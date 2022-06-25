package com.service;

import com.dao.AdminMapper;
import com.entity.Admin;
import com.sun.xml.internal.bind.v2.model.core.ID;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
	@Autowired
	private AdminMapper adminMapper;

	/**
	 * 插入
	 * 
	 * @param obj
	 * @return
	 */
	public int insert(Admin obj) {
		int ret = adminMapper.insert(obj);
		return ret;
	}

	/**
	 * 真删除
	 * 
	 * @param obj
	 * @return
	 */
	public int delete(Admin obj) {
		int ret = adminMapper.delete(obj);
		return ret;
	}

	/**
	 * 修改
	 * 
	 * @param obj
	 * @return
	 */
	public int update(Admin obj) {
		int ret = adminMapper.update(obj);
		return ret;
	}

	/**
	 * 查询全部
	 * 
	 * @param obj
	 * @return
	 */
	public List<Admin> selectAll(Admin obj) {
		List<Admin> list_obj = adminMapper
				.selectAll(obj);
		return list_obj;
	}

	/**
	 * 查询单个
	 * 
	 * @param obj
	 * @return
	 */
	public Admin selectOne(Admin obj) {
		List<Admin> list = new ArrayList<Admin>();
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
	public int selectCount(Admin obj) {
		int ret = adminMapper.selectCount(obj);
		return ret;
	}

	/**
	 * 查询是否存在 true:存在
	 * 
	 * @param obj
	 * @return
	 */
	public boolean selectExist(Admin obj) {
		Admin ret= selectOne(obj);
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
		int ret = adminMapper.deleteAll(list);
		return ret;
	}
	//基本传参
	public HashMap<String, String> deleteAll1() {
		HashMap<String, String> hashMap= new  HashMap<String, String>();
		if (3==3) {
//			admin.setId(5);
			hashMap.put("id", "5");
		}
		hashMap.put("url", "http");
		return hashMap;
	}
	public static void main(String[] args) {
		Admin admin = new Admin();
		HashMap<String, String> hashMap = new AdminService().deleteAll1();
		admin.setId(Integer.parseInt(hashMap.get("id")));
		String str=hashMap.get("url");
		
	}
}
