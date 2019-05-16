package com.ysd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.ysd.dao.ModuleMapper;
import com.ysd.entity.Modules;
import com.ysd.entity.RoleModules;
import com.ysd.util.RoleModuleUtil;
@Service
public class ModuleServiceImpl implements ModuleService {
	//存放转换后数据的集合              
	static List<Map<String,Object>> treeGridList  =new ArrayList<Map<String,Object>>();
	/*
	 * @Autowired private RoleModuleUtil roleModuleutil;
	 */
	@Autowired
	private ModuleMapper modulemapper;
	//查询所有模块
	public String selectModuleAll() {
		List<Modules> list = modulemapper.selectModulesAll();
		treeGridList =RoleModuleUtil.createTreeGridTree(list,0); 
	    //将集合转换为json输出到页面  
	    Gson gson = new Gson();  
	    String json = gson.toJson(treeGridList); 
	    treeGridList.clear();
		return json;
	}
	//查询父模块
	public List<Modules> selectModuleFid() {
		
		return modulemapper.selectModuleByparentId();
	} 
	//添加子模块
	public Integer addModules(Modules modules) {	
		return modulemapper.addModule(modules);
	}
	//根据角色id选择已有模块
	public String selectModuleRole(int id) {
		List<RoleModules> lists = modulemapper.selectByRoleId(id);
		List<Modules> list = modulemapper.selectModulesAll();
		treeGridList = RoleModuleUtil.createTreeGridTree(list,0,lists);    
	    //将集合转换为json输出到页面  
	    Gson gson = new Gson();  
	    String json = gson.toJson(treeGridList); 
	    treeGridList.clear();
		return json;
	}
	//根据id删除模块
	public Integer deleteModeById(Integer id) {
		return modulemapper.deleteModuleById(id);
	}
	//根据父id删除父模块及子模块
	public Integer deleteMoFuById(Integer id) {
		modulemapper.deleteMoByFuId(id);
		
		return modulemapper.deleteModuleById(id);
	}
	//根据ID查询模块
	public Modules selectModuById(Integer id) {
		
		return modulemapper.selectModuleById(id);
	}
	//根据id修改模块
	public Integer updataModuleById(Modules modules) {
		return modulemapper.updateModuleById(modules);
	}		
}
