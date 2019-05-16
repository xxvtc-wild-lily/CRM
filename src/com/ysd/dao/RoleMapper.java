package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Pagination;
import com.ysd.entity.Role;

public interface RoleMapper {
		/**
		 * 分页查询所有角色
		 * @return
		 */
		List<Role> selectRoleAll(Pagination<Role> fenye);
		/**
		 * 分页查询总条数
		 * @param fenye
		 * @return
		 */
		Integer selectRoleCount(Pagination<Role> fenye);
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
		Integer deleteRole(Integer r_id);
		/**
		 * 根据id修改数据
		 * @param role
		 * @return
		 */
		Integer updateRole(Role role);
		/**
		 * 根据角色id查看拥有该角色的员工个数
		 * @param id
		 * @return
		 */
		Integer selectroleree(Integer id);
		/**
		 * 根据角色ID添加权限
		 * @param rid
		 * @param mid
		 * @return
		 */
		Integer addrolemodule(Role role);
		/**
		 * 根据角色ID删除角色拥有的模块
		 * @param id
		 * @return
		 */
		Integer deleteModuleByRoleId(Integer id);
		/**
		 * 根据模块id删除权限
		 * @param rid
		 * @param mid
		 * @return
		 */
		Integer deleteRoleModuleById(Integer mid);
		/**
		 * 查询所有角色名子
		 * @return
		 */
		List<Role> selectName();
}
