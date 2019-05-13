package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Role;

public interface RoleMapper {
		/**
		 * 查询所有角色
		 * @return
		 */
		List<Role> selectRoleAll();
		/**
		 * 添加角色
		 * @param role
		 * @return
		 */
		Integer insertRole(Role role);
		/**
		 * 根据ID删除角色
		 * @param id
		 * @return
		 */
		Integer deleteRole(Integer id);
}
