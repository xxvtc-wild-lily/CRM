package com.ysd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Pagination;
import com.ysd.entity.Role;
import com.ysd.service.RoleService;

@Controller
public class RoleController {
		@Autowired
		private RoleService roleservice;
		@RequestMapping(value="/role",method=RequestMethod.POST)
		@ResponseBody
		public Pagination<Role> selectRoleAll(@RequestParam("rows") Integer pageSize,Pagination<Role> fenye){
			fenye.setPageSize(pageSize);
			fenye.setPage((fenye.getPage()-1)*fenye.getPageSize());
			Pagination<Role> selectRoleAll = roleservice.selectRoleAll(fenye);
			return selectRoleAll;
		}
		@RequestMapping(value="/addrol",method=RequestMethod.POST)
		@ResponseBody
		public Integer insertRoll(Role role) {
			
			return roleservice.insetRole(role);
			
		}
		
		@RequestMapping(value="/deleterole",method=RequestMethod.POST)
		@ResponseBody
		public Integer deleteRoles(Integer rid) {
			
			return roleservice.deleteRolesById(rid);
			
		}
		
		
		@RequestMapping(value="/updates",method=RequestMethod.POST)
		@ResponseBody
		public Integer updateRole(Role role) {
			
			return roleservice.updateRoles(role);
			
		}
		@RequestMapping(value="/updaterolemodule",method=RequestMethod.POST)
		@ResponseBody
		public Integer updaterolemodules(String r_id,String mid) {	
			return roleservice.addrolemodule(r_id, mid);
		}
}
