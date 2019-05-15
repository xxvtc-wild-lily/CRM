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
@Service
public class ModuleServiceImpl implements ModuleService {
	//存放转换后数据的集合              
	static List<Map<String,Object>> treeGridList  =new ArrayList<Map<String,Object>>(); 
	@Autowired
	private ModuleMapper modulemapper;
	@Override
	public String selectModuleAll() {
		List<Modules> list = modulemapper.selectModulesAll();
		/* createTreeGridTree(list,0); */   
	    //将集合转换为json输出到页面  
	    Gson gson = new Gson();  
	    String json = gson.toJson(treeGridList); 
	    treeGridList.clear();
		return json;
	}
	public List<Modules> selectModuleFid() {
		
		return modulemapper.selectModuleByparentId();
	}  
	public Integer addModules(Modules modules) {
		
		return modulemapper.addModule(modules);
	}
	@Override
	public String selectModuleRole(int id) {
		List<RoleModules> lists = modulemapper.selectByRoleId(id);
		List<Modules> list = modulemapper.selectModulesAll();
		createTreeGridTree(list,0,lists);    
	    //将集合转换为json输出到页面  
	    Gson gson = new Gson();  
	    String json = gson.toJson(treeGridList); 
	    treeGridList.clear();
		return json;
	}
		/** 
		* 将角色封装成树开始 
		* @param list 
		* @param fid 父id 
		*/  
		private static void createTreeGridTree(List<Modules> list, Integer fid,List<RoleModules> lists) {  
		for (int i = 0; i < list.size(); i++) {  
		    Map<String, Object> map = null;  
		    Modules role = (Modules) list.get(i); 
		    
		    if (role.getM_parentId()==0) {  
		        map = new HashMap<String, Object>();  
		        //这里无所谓怎么转都行，因为在页面easyUI插件treeGrid提供了数据转换的columns属性，具体看相关的js代码  
		        map.put("id", list.get(i).getM_id());       //id  
		        map.put("text", list.get(i).getM_name());     //角色名  
		        map.put("m_path", list.get(i).getM_path());     //路径
				/* map.put("state", "closed"); */    //是否展开
		        map.put("children", createTreeGridChildren(list, role.getM_id(),lists));  
		    }  
		    if (map != null) {
		    	 treeGridList.add(map);  
		    }  
		   
		}  
		}  
		
		
		
		
		/** 
		* 递归设置role树 
		* @param list 
		* @param fid 
		* @return 
		*/  
		private static List<Map<String, Object>> createTreeGridChildren(List<Modules> list, Integer fid,List<RoleModules> lists) {  
		List<Map<String, Object>> childList = new ArrayList<Map<String, Object>>();  
		for (int j = 0; j < list.size(); j++) {  
		    Map<String, Object> map = null;  
		    Modules treeChild = (Modules) list.get(j);  
		    if (treeChild.getM_parentId()==(fid)) {  
		        map = new HashMap<String, Object>();  
		        //这里无所谓怎么转都行，因为在页面easyUI插件treeGrid提供了数据转换的columns属性，具体看相关的js代码  
		        map.put("id", list.get(j).getM_id());       //id
		       
		        map.put("text", list.get(j).getM_name());     //角色名
		        map.put("m_path", list.get(j).getM_path());     //路径
		        boolean xuanzhong=true;
		        for(int o=0;o<lists.size();o++) {
		        	if(list.get(j).getM_id()==lists.get(o).getM_id()) {
		        		xuanzhong=true;
		        		break;
		        	}else {
		        		xuanzhong=false;
		        	}
		        }
		        map.put("checked", xuanzhong);//是否选中
		        map.put("children", createTreeGridChildren(list, treeChild.getM_id(),lists));  
		    }  
		      
		    if (map != null) {
		    	 childList.add(map);  
		    }
		   
		}  
		
		return childList;  
		}
		
			
}
