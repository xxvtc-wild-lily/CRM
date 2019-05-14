package com.ysd.dao;

import java.util.List;

import com.ysd.entity.NetFollow;
import com.ysd.entity.Pagination;
import com.ysd.entity.Student;

public interface NetFollowMapper {
	
	
	
	
	/**
	 * 分页查询跟踪记录
	 * @param pagin
	 * @return
	 */
	List<NetFollow> selectNetFollow(Pagination<NetFollow> pagin);
	
	/**
	 * 查询跟踪记录条数
	 * @param pagin
	 * @return
	 */
	Integer selectAllNetFollowCount(Pagination<NetFollow> pagin);
	
	/**
	 * 添加跟踪记录
	 * @param NetFollow
	 * @return
	 */
	Integer insertNetFollow(NetFollow netfollow);
	
	/**
	 * 修改跟踪记录
	 * @param NetFollow
	 * @return
	 */
	Integer updateNetFollow(NetFollow netfollow);
	
	/**
	 * 删除跟踪记录
	 * @param n_id
	 * @return
	 */
	Integer deleteNetFollow(Integer n_id);
}
