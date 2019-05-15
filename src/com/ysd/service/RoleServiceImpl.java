package com.ysd.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.ysd.dao.RoleMapper;
import com.ysd.entity.Pagination;
import com.ysd.entity.Role;
@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper rolemapper;
	@Autowired
	private Role roless;
	@Override
	public Pagination<Role>  selectRoleAll(Pagination<Role> fenye) {
		List<Role> selectRoleAll = rolemapper.selectRoleAll(fenye);
		Integer selectRoleCount = rolemapper.selectRoleCount(fenye);
		fenye.setRows(selectRoleAll);
		fenye.setTotal(selectRoleCount);
		return  fenye;
	}
	@Override
	public Integer insetRole(Role role) {
		
		return rolemapper.insertRole(role);
	}
	@Override
	public Integer deleteRolesById(Integer rid) {
		return rolemapper.deleteRole(rid);
	}
	@Override
	public Integer updateRoles(Role role) {
		
		return rolemapper.updateRole(role);
	}
	@Override
	public Integer addrolemodule(String r_id,String mid) {
		Integer o=0;
		String[] lists=null;
		roless.setR_id(Integer.parseInt(r_id));
		lists=mid.split(",");
			for(int j=0;j<lists.length;j++) {
				roless.setMid(Integer.parseInt(lists[j]));
				Integer s=rolemapper.addrolemodule(roless);
				if(s==1) {
					o=1;
				}
		}
		return o;
	}
	@Override
	public List<Role> selectName() {
		
		return rolemapper.selectName();
	}

}
