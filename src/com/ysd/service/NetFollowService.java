package com.ysd.service;

import java.util.List;

import com.ysd.entity.NetFollow;
import com.ysd.entity.Pagination;

public interface NetFollowService {
	
	/**
	 * ��ҳ��ѯ���ټ�¼
	 * @param pagin
	 * @return
	 */
	Pagination selectNetFollow(Pagination pagin);
	
	/**
	 * ��ѯ���ټ�¼����
	 * @param pagin
	 * @return
	 */
	Integer selectAllNetFollowCount(Pagination pagin);
	
	/**
	 * ��Ӹ��ټ�¼
	 * @param NetFollow
	 * @return
	 */
	Integer insertNetFollow(NetFollow netfollow);
}
