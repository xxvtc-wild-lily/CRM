package com.ysd.service;

import java.util.List;

import com.ysd.entity.Modules;

public interface ModuleService {
		/**
		 * 查询所有模块
		 * @return
		 */
		String selectModuleAll();
		/**
		 * 根据角色id选中已有模块
		 * @param id
		 * @return
		 */
		String selectModuleRole(int id);
		/**
		 * 根据父ID查询数据
		 * @return
		 */
		List<Modules> selectModuleFid();
		/**
		 * 添加模块
		 * @return
		 */
		Integer addModules(Modules modules);
}
