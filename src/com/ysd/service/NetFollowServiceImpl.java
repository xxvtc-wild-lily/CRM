package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.NetFollowMapper;
import com.ysd.entity.NetFollow;
import com.ysd.entity.Pagination;
@Service
public class NetFollowServiceImpl implements NetFollowService {
	@Autowired
	private NetFollowMapper netMapper;
	@Override
	public  Pagination<NetFollow> selectNetFollow(Pagination<NetFollow> pagin) {
		List<NetFollow> selectNetFollow = netMapper.selectNetFollow(pagin);
		Integer selectAllNetFollowCount = netMapper.selectAllNetFollowCount(pagin);
		pagin.setRows(selectNetFollow);
		pagin.setTotal(selectAllNetFollowCount);
		return pagin;
	}
	@Override
	public Integer selectAllNetFollowCount(Pagination<NetFollow> pagin) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Integer insertNetFollow(NetFollow netfollow) {
		return netMapper.insertNetFollow(netfollow);
	}

	

}
