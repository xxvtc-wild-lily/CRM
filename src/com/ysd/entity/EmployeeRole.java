package com.ysd.entity;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class EmployeeRole {
	private Integer er_id;
	private Integer e_id;
	private Integer r_id;
	
	private List<Role> role;

	public Integer getEr_id() {
		return er_id;
	}

	public void setEr_id(Integer er_id) {
		this.er_id = er_id;
	}

	public Integer getE_id() {
		return e_id;
	}

	public void setE_id(Integer e_id) {
		this.e_id = e_id;
	}

	public Integer getR_id() {
		return r_id;
	}

	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}

	public List<Role> getRole() {
		return role;
	}

	public void setRole(List<Role> role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "EmployeeRole [er_id=" + er_id + ", e_id=" + e_id + ", r_id=" + r_id + ", role=" + role + "]";
	}
	
}
