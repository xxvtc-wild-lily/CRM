package com.ysd.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Pagination {
	private Integer page;
	private Integer pageSize;
	private Integer total;
	private List<NetFollow> rows;
	
	
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<NetFollow> getRows() {
		return rows;
	}
	public void setRows(List<NetFollow> rows) {
		this.rows = rows;
	}
	
	
}
