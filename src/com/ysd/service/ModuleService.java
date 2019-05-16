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
		/**
		 * 根据id删除模块
		 * @param id
		 * @return
		 */
		Integer deleteModeById(Integer id);
		/**
		 * 根据父id删除父模块及子模块
		 * @param id
		 * @return
		 */
		Integer deleteMoFuById(Integer id);
		/**
		 * 根据ID查询模块
		 * @param id
		 * @return
		 */
		Modules selectModuById(Integer id);
		/**
		 * 根据id修改模块
		 * @param modules
		 * @return
		 */
		Integer updataModuleById(Modules modules);
}
