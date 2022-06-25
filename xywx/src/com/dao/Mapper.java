package com.dao;

import java.util.List;

public interface Mapper<T> {

	/**
	 * 查询可带条件 可分页
	 * 
	 * @param p
	 * @return
	 */
	public List<T> selectAll(T p);

	/**
	 * 插入 不可带主键
	 * 
	 * @param p
	 * @return
	 */
	public int insert(T p);

	/**
	 * 默认根据主键修改 也可以根据其他修改
	 * 
	 * @param p
	 * @return
	 */
	public int update(T p);

	/**
	 * 删除 默认根据主键删除 也可根据其他列删除 如果不带任何参数 则删除全部 慎用！
	 * 
	 * @param p
	 * @return
	 */
	public int delete(T p);

	/**
	 * 根据条件查询数量 一般和同分页一起使用
	 * 
	 * @param p
	 * @return
	 */
	public int selectCount(T p);
	/**
	 * 批量删除 默认根据主键删除 
	 * 
	 * @param p
	 * @return
	 */
	public int deleteAll(List<String> list);

}
