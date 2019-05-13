package com.ysd.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Pagination<T> {
	private Integer page;
	private Integer pageSize;
	private Integer total;
	private List<T> rows;
	
	
	private String n_stuName;
	private Integer e_id;
	private String startn_followTime;
	private String endn_followTime;
	private String s_isReturnVisit;
	private String n_followType;
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
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public String getN_stuName() {
		return n_stuName;
	}
	public void setN_stuName(String n_stuName) {
		this.n_stuName = n_stuName;
	}
	public Integer getE_id() {
		return e_id;
	}
	public void setE_id(Integer e_id) {
		this.e_id = e_id;
	}
	public String getStartn_followTime() {
		return startn_followTime;
	}
	public void setStartn_followTime(String startn_followTime) {
		this.startn_followTime = startn_followTime;
	}
	public String getEndn_followTime() {
		return endn_followTime;
	}
	public void setEndn_followTime(String endn_followTime) {
		this.endn_followTime = endn_followTime;
	}
	public String getS_isReturnVisit() {
		return s_isReturnVisit;
	}
	public void setS_isReturnVisit(String s_isReturnVisit) {
		this.s_isReturnVisit = s_isReturnVisit;
	}
	public String getN_followType() {
		return n_followType;
	}
	public void setN_followType(String n_followType) {
		this.n_followType = n_followType;
	}
	
	
	
}
