package com.ysd.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeRole;
import com.ysd.entity.Modules;
import com.ysd.entity.RoleModules;
import com.ysd.service.IndexTreeService;

@Controller
public class IndexTreeController {
    
    @Autowired
    private IndexTreeService indexTreeService;
    
    @RequestMapping(value="/initTree",method=RequestMethod.POST)
    @ResponseBody
    public String initTree(Employee employee) {
        
        /*
         * // 存放角色id的list List<EmployeeRole> employeeRole = new
         * ArrayList<EmployeeRole>(); // 存放模块id的list List<RoleModules> roleModule = new
         * ArrayList<RoleModules>(); // 存放模块信息的HashMap List<Modules> modules = new
         * ArrayList<Modules>();
         * 
         * // 角色id Integer r_id = 0; // 模块id Integer m_id = 0;
         * 
         * employeeRole = indexTreeService.selectAllRoleByLoginName(employee);
         * System.out.println(employeeRole);
         * 
         * for (int i = 0;i < employeeRole.size();i++) { r_id =
         * employeeRole.get(i).getR_id(); roleModule =
         * indexTreeService.selectAllRoleModulesByRoleId(r_id); for (int j = 0;j <
         * roleModule.size();j++) { m_id = roleModule.get(i).getM_id(); modules.set(j,
         * (Modules) indexTreeService.selectAllModulesByMid(m_id));
         * 
         * } }
         * 
         * System.out.println(modules);
         */
        
        return null;
    }
}
