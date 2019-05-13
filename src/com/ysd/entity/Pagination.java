package com.ysd.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Pagination<T> {
	private Integer page;
	private Integer pageSize;
	private Integer total;
	private List<T> rows;
	
	private Employee employee;
	//创建时间
	private String in_e_createTime;
	private String en_e_createTime;
	
	private Student student;
	private Asker asker;
	
	
	public Asker getAsker() {
		return asker;
	}

	public void setAsker(Asker asker) {
		this.asker = asker;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
	
	
	
	
	
	
	public String getIn_e_createTime() {
		return in_e_createTime;
	}

	public void setIn_e_createTime(String in_e_createTime) {
		this.in_e_createTime = in_e_createTime;
	}

	public String getEn_e_createTime() {
		return en_e_createTime;
	}

	public void setEn_e_createTime(String en_e_createTime) {
		this.en_e_createTime = en_e_createTime;
	}

	
	
	
	
	
	
	
	
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
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
	
	
}
