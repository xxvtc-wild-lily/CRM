package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Modules;
import com.ysd.entity.RoleModules;

public interface ModuleMapper {
		/**
		 * 查询所有模块数据
		 * @return
		 */
		List<Modules> selectModulesAll();
		/**
		 * 角色模块连表查询
		 * @param id
		 * @return
		 */
		List<Modules> selectmodulerole(Integer id);
		/**
		 * 根据父ID查询父模块
		 * @return
		 */
		List<Modules> selectModuleByparentId();
		/**
		 * 添加模块
		 * @return
		 */
		Integer addModule(Modules modules);
		/**
		 * 根据角色id查询模块id
		 * @param id
		 * @return
		 */
		List<RoleModules> selectByRoleId(int id);
}
