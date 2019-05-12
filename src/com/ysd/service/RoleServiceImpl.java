package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.ysd.dao.RoleMapper;
import com.ysd.entity.Role;
@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper rolemapper;
	@Override
	public String  selectRoleAll() {
		Gson gosn=new Gson();
		return gosn.toJson(rolemapper.selectRoleAll());
	}

}
