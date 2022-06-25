package com.service;

import com.dao.NoticeMapper;
import com.entity.Notice;

import java.util.List;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;

	/**
	 * 插入
	 * 
	 * @param obj
	 * @return
	 */
	public int insert(Notice obj) {
		int ret = noticeMapper.insert(obj);
		return ret;
	}

	/**
	 * 真删除
	 * 
	 * @param obj
	 * @return
	 */
	public int delete(Notice obj) {
		int ret = noticeMapper.delete(obj);
		return ret;
	}

	/**
	 * 修改
	 * 
	 * @param obj
	 * @return
	 */
	public int update(Notice obj) {
		int ret = noticeMapper.update(obj);
		return ret;
	}

	/**
	 * 查询全部
	 * 
	 * @param obj
	 * @return
	 */
	public List<Notice> selectAll(Notice obj) {
		List<Notice> list_obj = noticeMapper
				.selectAll(obj);
		return list_obj;
	}

	/**
	 * 查询单个
	 * 
	 * @param obj
	 * @return
	 */
	public Notice selectOne(Notice obj) {
		List<Notice> list = new ArrayList<Notice>();
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
	public int selectCount(Notice obj) {
		int ret = noticeMapper.selectCount(obj);
		return ret;
	}

	/**
	 * 查询是否存在 true:存在
	 * 
	 * @param obj
	 * @return
	 */
	public boolean selectExist(Notice obj) {
		Notice ret= selectOne(obj);
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
		int ret = noticeMapper.deleteAll(list);
		return ret;
	}
}
