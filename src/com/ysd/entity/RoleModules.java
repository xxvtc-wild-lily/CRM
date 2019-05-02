package com.ysd.entity;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class RoleModules {
	private Integer rm_id;
	private Integer r_id;
	private Integer m_id;
	
	private List<Modules> modules;

	public Integer getRm_id() {
		return rm_id;
	}

	public void setRm_id(Integer rm_id) {
		this.rm_id = rm_id;
	}

	public Integer getR_id() {
		return r_id;
	}

	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}

	public Integer getM_id() {
		return m_id;
	}

	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}

	public List<Modules> getModules() {
		return modules;
	}

	public void setModules(List<Modules> modules) {
		this.modules = modules;
	}

	@Override
	public String toString() {
		return "RoleModules [rm_id=" + rm_id + ", r_id=" + r_id + ", m_id=" + m_id + ", modules=" + modules + "]";
	}
	
}
