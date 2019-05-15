package com.ysd.service;

import java.util.List;

import com.ysd.entity.Pagination;
import com.ysd.entity.Role;

public interface RoleService {
		/**
		 * 查询所有角色
		 * @return
		 */
		Pagination<Role> selectRoleAll(Pagination<Role> fenye);
		/**
		 * 添加角色
		 * @return
		 */
		Integer insetRole(Role role);
		/**
		 * 根据ID删除角色
		 * @param id
		 * @return
		 */
		Integer deleteRolesById(Integer id);
		/**
		 * 根据id修改角色
		 * @param role
		 * @return
		 */
		Integer updateRoles(Role role);
		/**
		 * 给角色添加权限
		 * @param role
		 * @return
		 */
		Integer addrolemodule(String r_id,String mid);
		/**
		 * 查询所有角色名子
		 * @return
		 */
		List<Role> selectName();
}
