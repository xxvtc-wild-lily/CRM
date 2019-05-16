package com.ysd.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ysd.entity.Modules;
import com.ysd.entity.RoleModules;

@Component
public class RoleModuleUtil {
	//存放转换后数据的集合              
	static List<Map<String,Object>> treeGridList  =new ArrayList<Map<String,Object>>(); 
	/** 
	* 将角色封装成树开始 
	* @param list 
	* @param fid 父id 
	*/  
	public static List<Map<String,Object>> createTreeGridTree(List<Modules> list, Integer fid,List<RoleModules> lists) {  
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
	return treeGridList;  
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
	        boolean xuanzhong=false;
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
	
	
	
	
	
	
	
	
	/** 
	* 将角色封装成树开始 
	* @param list 
	* @param fid 父id 
	*/  
	public static List<Map<String,Object>> createTreeGridTree(List<Modules> list, Integer fid) {  
	for (int i = 0; i < list.size(); i++) {  
	    Map<String, Object> map = null;  
	    Modules role = (Modules) list.get(i); 
	    
	    if (role.getM_parentId()==0) {  
	        map = new HashMap<String, Object>();  
	        //这里无所谓怎么转都行，因为在页面easyUI插件treeGrid提供了数据转换的columns属性，具体看相关的js代码  
	        map.put("id", list.get(i).getM_id());       //id  
	        map.put("text", list.get(i).getM_name());     //角色名  
	        map.put("m_path", list.get(i).getM_path());     //路径
	        map.put("children", createTreeGridChildren(list, role.getM_id()));  
	    }  
	    if (map != null) {
	    	 treeGridList.add(map);  
	    }  
	   
	}
	return treeGridList;  
	}  
	
	
	
	
	/** 
	* 递归设置role树 
	* @param list 
	* @param fid 
	* @return 
	*/  
	private static List<Map<String, Object>> createTreeGridChildren(List<Modules> list, Integer fid) {  
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
	        map.put("children", createTreeGridChildren(list, treeChild.getM_id()));  
	    }  
	      
	    if (map != null) {
	    	 childList.add(map);  
	    }
	   
	}  
	
	return childList;  
	}
	
}	
