package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Modules;

public interface ModuleMapper {
		/**
		 * 查询所有模块数据
		 * @return
		 */
		List<Modules> selectModulesAll();	
}
