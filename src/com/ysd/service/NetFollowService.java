package com.ysd.service;



import com.ysd.entity.NetFollow;
import com.ysd.entity.Pagination;

public interface NetFollowService {
	
	/**
	 * ��ҳ��ѯ���ټ�¼
	 * @param pagin
	 * @return
	 */
	Pagination<NetFollow> selectNetFollow(Pagination<NetFollow> pagin);
	
	/**
	 * ��ѯ���ټ�¼����
	 * @param pagin
	 * @return
	 */
	Integer selectAllNetFollowCount(Pagination<NetFollow> pagin);
	
	/**
	 * ��Ӹ��ټ�¼
	 * @param NetFollow
	 * @return
	 */
	Integer insertNetFollow(NetFollow netfollow);
}
