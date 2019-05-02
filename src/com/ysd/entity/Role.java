package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Role {
	private Integer r_id;
	private String r_name;
	
	private RoleModules roleModules;

	public Integer getR_id() {
		return r_id;
	}

	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public RoleModules getRoleModules() {
		return roleModules;
	}

	public void setRoleModules(RoleModules roleModules) {
		this.roleModules = roleModules;
	}

	@Override
	public String toString() {
		return "Role [r_id=" + r_id + ", r_name=" + r_name + ", roleModules=" + roleModules + "]";
	}
	
}
