package com.ysd.dao;

import java.util.List;

import com.ysd.entity.NetFollow;
import com.ysd.entity.Pagination;
import com.ysd.entity.Student;

public interface NetFollowMapper {
	
	
	
	
	/**
	 * ��ҳ��ѯ���ټ�¼
	 * @param pagin
	 * @return
	 */
	List<NetFollow> selectNetFollow(Pagination<NetFollow> pagin);
	
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
	
	/**
	 * �޸ĸ��ټ�¼
	 * @param NetFollow
	 * @return
	 */
	Integer updateNetFollow(NetFollow netfollow);
	
	/**
	 * ɾ�����ټ�¼
	 * @param n_id
	 * @return
	 */
	Integer deleteNetFollow(Integer n_id);
}
