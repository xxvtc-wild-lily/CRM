package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Role;

public interface RoleMapper {
		/**
		 * 查询所有角色
		 * @return
		 */
		List<Role> selectRoleAll();
}
