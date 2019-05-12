package com.ysd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Role;
import com.ysd.service.RoleService;

@Controller
public class RoleController {
		@Autowired
		private RoleService roleservice;
		@RequestMapping(value="/role",method=RequestMethod.POST)
		@ResponseBody
		public String selectRoleAll(){
			String selectRoleAll = roleservice.selectRoleAll();
			System.out.println(selectRoleAll);
			return selectRoleAll;
		}
		@RequestMapping(value="/addrol",method=RequestMethod.POST)
		@ResponseBody
		public Integer insertRoll(Role role) {
			
			return roleservice.insetRole(role);
			
		}
		
		@RequestMapping(value="/deleterole",method=RequestMethod.POST)
		@ResponseBody
		public Integer deleteRoles(String roles) {
			
			return roleservice.deleteRolesById(roles);
			
		}
		
}
