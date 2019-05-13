package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Modules {
	private Integer m_id;
	private String m_name;
	private Integer m_parentId;
	private String m_path;
	private Integer m_weight;
	private String m_ext1;
	private String m_ext2;
	private String m_ext3;
	private Integer m_ext4;
	private Integer m_ext5;
	private Integer m_ext6;
	
	
	public String getM_ext1() {
		return m_ext1;
	}

	public void setM_ext1(String m_ext1) {
		this.m_ext1 = m_ext1;
	}

	public String getM_ext2() {
		return m_ext2;
	}

	public void setM_ext2(String m_ext2) {
		this.m_ext2 = m_ext2;
	}

	public String getM_ext3() {
		return m_ext3;
	}

	public void setM_ext3(String m_ext3) {
		this.m_ext3 = m_ext3;
	}

	public Integer getM_ext4() {
		return m_ext4;
	}

	public void setM_ext4(Integer m_ext4) {
		this.m_ext4 = m_ext4;
	}

	public Integer getM_ext5() {
		return m_ext5;
	}

	public void setM_ext5(Integer m_ext5) {
		this.m_ext5 = m_ext5;
	}

	public Integer getM_ext6() {
		return m_ext6;
	}

	public void setM_ext6(Integer m_ext6) {
		this.m_ext6 = m_ext6;
	}

	public Integer getM_id() {
		return m_id;
	}
	
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}
	
	public String getM_name() {
		return m_name;
	}
	
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	public Integer getM_parentId() {
		return m_parentId;
	}
	
	public void setM_parentId(Integer m_parentId) {
		this.m_parentId = m_parentId;
	}
	
	public String getM_path() {
		return m_path;
	}
	
	public void setM_path(String m_path) {
		this.m_path = m_path;
	}
	
	public Integer getM_weight() {
		return m_weight;
	}
	
	public void setM_weight(Integer m_weight) {
		this.m_weight = m_weight;
	}

	@Override
	public String toString() {
		return "Modules [m_id=" + m_id + ", m_name=" + m_name + ", m_parentId=" + m_parentId + ", m_path=" + m_path
				+ ", m_weight=" + m_weight + "]";
	}
	
}
