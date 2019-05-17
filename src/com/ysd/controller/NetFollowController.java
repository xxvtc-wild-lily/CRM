package com.ysd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.NetFollow;
import com.ysd.entity.Pagination;
import com.ysd.service.NetFollowService;

@Controller
public class NetFollowController {
	@Autowired
	private NetFollowService netServlet;
	@RequestMapping(value="/NetFollowSer",method=RequestMethod.POST)
	@ResponseBody
	public Pagination<NetFollow> init(@RequestParam(value="rows") Integer pageSize,Pagination<NetFollow> pagin) {
		pagin.setPageSize(pageSize);
		pagin.setPage((pagin.getPage()-1)*pagin.getPageSize());
				
		pagin=netServlet.selectNetFollow(pagin);
		
		return pagin;
		
	}
	@RequestMapping(value="/insertNetFollow",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertNetFollow(NetFollow netfollow) {
		return netServlet.insertNetFollow(netfollow);
	}
}
