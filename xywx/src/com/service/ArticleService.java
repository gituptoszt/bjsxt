package com.service;

import com.dao.ArticleMapper;
import com.entity.Article;

import java.util.List;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleService {
	@Autowired
	private ArticleMapper articleMapper;

	/**
	 * 插入
	 * 
	 * @param obj
	 * @return
	 */
	public int insert(Article obj) {
		int ret = articleMapper.insert(obj);
		return ret;
	}

	/**
	 * 真删除
	 * 
	 * @param obj
	 * @return
	 */
	public int delete(Article obj) {
		int ret = articleMapper.delete(obj);
		return ret;
	}

	/**
	 * 修改
	 * 
	 * @param obj
	 * @return
	 */
	public int update(Article obj) {
		int ret = articleMapper.update(obj);
		return ret;
	}

	/**
	 * 查询全部
	 * 
	 * @param obj
	 * @return
	 */
	public List<Article> selectAll(Article obj) {
		List<Article> list_obj = articleMapper
				.selectAll(obj);
		return list_obj;
	}
	/**
	 * 查询全部
	 * 
	 * @param obj
	 * @return
	 */
	public List<Article> selectAll2(Article obj) {
		List<Article> list_obj = articleMapper
				.selectAll2(obj);
		return list_obj;
	}

	/**
	 * 查询单个
	 * 
	 * @param obj
	 * @return
	 */
	public Article selectOne(Article obj) {
		List<Article> list = new ArrayList<Article>();
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
	public int selectCount(Article obj) {
		int ret = articleMapper.selectCount(obj);
		return ret;
	}

	/**
	 * 查询是否存在 true:存在
	 * 
	 * @param obj
	 * @return
	 */
	public boolean selectExist(Article obj) {
		Article ret= selectOne(obj);
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
		int ret = articleMapper.deleteAll(list);
		return ret;
	}
}
