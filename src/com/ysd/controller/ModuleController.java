package com.ysd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Modules;
import com.ysd.service.ModuleService;

@Controller
public class ModuleController {
		@Autowired
		private ModuleService moduleservice;
		
		@RequestMapping(value="/module",method=RequestMethod.POST)
		@ResponseBody
		public String selectModuleAll(){
			return moduleservice.selectModuleAll();	
		}
		@RequestMapping(value="/moduleByfid",method=RequestMethod.POST)
		@ResponseBody
		public List<Modules> selectModuleFids(){
			return moduleservice.selectModuleFid();	
		}
		@RequestMapping(value="/addmodule",method=RequestMethod.POST)
		@ResponseBody
		public Integer addModules(Modules modules) {
			
			return moduleservice.addModules(modules);
			
		}
		
		
		
		@RequestMapping(value="/modules",method=RequestMethod.POST)
		@ResponseBody
		public String selectModuleAlls(Integer mid){
			return moduleservice.selectModuleRole(mid);	
		}
}
