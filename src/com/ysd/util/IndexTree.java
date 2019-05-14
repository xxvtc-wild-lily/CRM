package com.ysd.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ysd.entity.Employee;
import com.ysd.entity.Modules;
import com.ysd.service.IndexTreeService;

@Component
public class IndexTree {
    
    @Autowired
    private IndexTreeService indexTreeService;
    
    public List<HashMap<String,Object>> getTree(Employee employee) {
        // 查询出的树结构数据
        List<HashMap<String,Object>> treeData = new ArrayList<HashMap<String,Object>>();
        // 查询出的用户的所有模块
        List<Modules> list = indexTreeService.selectEmployeeAllModules(employee);
        
        for (int i = 0;i < list.size();i++) {
            if (list.get(i).getM_parentId() == 0) {
                
                HashMap<String,Object> map = new HashMap<String, Object>();
                map.put("id",list.get(i).getM_id());
                map.put("text",list.get(i).getM_name());
                map.put("state","open");
                map.put("children",getChildren(list.get(i).getM_id(),list));
                treeData.add(map);
            }
        }
        System.out.println(treeData);
        return treeData;
    }
    
    public List<HashMap<String,Object>> getChildren(Integer m_id,List<Modules> list) {
        // 查询出的children结构数据
        List<HashMap<String,Object>> treeData = new ArrayList<HashMap<String,Object>>();
        
        for (int i = 0;i < list.size();i++) {
            if (list.get(i).getM_parentId() == m_id) {
                
                HashMap<String,Object> map = new HashMap<String, Object>();
                map.put("id",list.get(i).getM_id());
                map.put("text",list.get(i).getM_name());
                map.put("state","open");
                for (int j = 0;j< list.size();j++) {
                    if (list.get(j).getM_parentId() == list.get(i).getM_id()) {
                        map.put("children",getChildren(list.get(i).getM_id(),list));
                    } else {
                        map.put("attribute",list.get(i).getM_path());
                    }
                }
                treeData.add(map);
            }
        }
        
        return treeData;
    }
    
}
