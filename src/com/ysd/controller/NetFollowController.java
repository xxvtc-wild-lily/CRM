package com.ysd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Pagination;
import com.ysd.service.NetFollowService;

@Controller
public class NetFollowController {
	@Autowired
	private NetFollowService netServlet;
	@Autowired
	private Pagination pagin;
	@RequestMapping(value="/NetFollowService",method=RequestMethod.POST)
	@ResponseBody
	public Pagination init(@RequestParam(value="rows") Integer pageSize,Integer page,Integer rows) {
		pagin.setPage((page-1)*rows);
		pagin.setPageSize(rows);
		pagin=netServlet.selectNetFollow(pagin);
		return pagin;
		
	}
	
}
