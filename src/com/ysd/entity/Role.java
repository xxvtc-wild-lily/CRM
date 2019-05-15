package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Role {
	private Integer r_id;	//角色编号
	private String r_name;  //角色名称
	private Integer id;
	private String text;
	private Integer mid;
	
	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

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
