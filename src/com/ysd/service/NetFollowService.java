package com.ysd.service;

import java.util.List;

import com.ysd.entity.NetFollow;
import com.ysd.entity.Pagination;

public interface NetFollowService {
	
	/**
	 * 分页查询跟踪记录
	 * @param pagin
	 * @return
	 */
	Pagination selectNetFollow(Pagination pagin);
	
	/**
	 * 查询跟踪记录条数
	 * @param pagin
	 * @return
	 */
	Integer selectAllNetFollowCount(Pagination pagin);
	
	/**
	 * 添加跟踪记录
	 * @param NetFollow
	 * @return
	 */
	Integer insertNetFollow(NetFollow netfollow);
}
