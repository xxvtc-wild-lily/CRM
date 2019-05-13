package com.ysd.service;

import java.util.List;

import com.ysd.entity.Role;

public interface RoleService {
		/**
		 * 查询所有角色
		 * @return
		 */
		String selectRoleAll();
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
		Integer deleteRolesById(String roles);
}
