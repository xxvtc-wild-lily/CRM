package com.ysd.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.ysd.dao.ModuleMapper;
import com.ysd.dao.RoleMapper;
import com.ysd.entity.Modules;
import com.ysd.entity.Pagination;
import com.ysd.entity.Role;
import com.ysd.entity.RoleModules;
@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper rolemapper;
	@Autowired
	private ModuleMapper modulemapper;
	@Autowired
	private Role roless;
	//查询所有角色
	public Pagination<Role>  selectRoleAll(Pagination<Role> fenye) {
		List<Role> selectRoleAll = rolemapper.selectRoleAll(fenye);
		Integer selectRoleCount = rolemapper.selectRoleCount(fenye);
		fenye.setRows(selectRoleAll);
		fenye.setTotal(selectRoleCount);
		return  fenye;
	}
	//添加角色
	public Integer insetRole(Role role) {
		
		return rolemapper.insertRole(role);
	}
	//根据ID删除角色
	public Integer deleteRolesById(Integer rid) {
		Integer geshu=0;
		Integer selectroleree = rolemapper.selectroleree(rid);
		if(selectroleree>0) {
			geshu=0;
		}else {
			rolemapper.deleteRole(rid);
			geshu=1;
		}
		return geshu;
	}
	//修改角色名称
	public Integer updateRoles(Role role) {
		
		return rolemapper.updateRole(role);
	}
	//给角色添加权限
	public Integer addrolemodule(String r_id,String mid) {
		String[] lists=null;
		roless.setR_id(Integer.parseInt(r_id));
		Integer r=roless.getR_id();
		rolemapper.deleteModuleByRoleId(r);
		lists=mid.split(",");
		Integer s=0;
		for(int j=0;j<lists.length;j++) {
			roless.setMid(Integer.parseInt(lists[j]));
			s=rolemapper.addrolemodule(roless);
			}
		return s;
	}
	//查询所有角色名称
	public List<Role> selectName() {
		
		return rolemapper.selectName();
	}

}
