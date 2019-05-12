package com.ysd.service;

import java.util.ArrayList;
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
	@Override
	public Integer insetRole(Role role) {
		
		return rolemapper.insertRole(role);
	}
	@Override
	public Integer deleteRolesById(String roles) {
		Integer o=0;
		String[] list=null;
		list = roles.split(",");
		for(int i=0;i<list.length;i++) {
			Integer s=rolemapper.deleteRole(Integer.parseInt(list[i]));
			if(s==1) {
				o=1;
			}
			
		}
		return o;
	}

}
