package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Message {
	private Integer m_id;
	private String e_sendName;
	private String e_acceptName;
	private String m_sendTime;
	private String m_content;
	private String m_ext1;
	private Integer m_ext2;
	public Integer getM_id() {
		return m_id;
	}
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}
	public String getE_sendName() {
		return e_sendName;
	}
	public void setE_sendName(String e_sendName) {
		this.e_sendName = e_sendName;
	}
	public String getE_acceptName() {
		return e_acceptName;
	}
	public void setE_acceptName(String e_acceptName) {
		this.e_acceptName = e_acceptName;
	}
	public String getM_sendTime() {
		return m_sendTime;
	}
	public void setM_sendTime(String m_sendTime) {
		this.m_sendTime = m_sendTime;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public String getM_ext1() {
		return m_ext1;
	}
	public void setM_ext1(String m_ext1) {
		this.m_ext1 = m_ext1;
	}
	public Integer getM_ext2() {
		return m_ext2;
	}
	public void setM_ext2(Integer m_ext2) {
		this.m_ext2 = m_ext2;
	}
	@Override
	public String toString() {
		return "Message [m_id=" + m_id + ", e_sendName=" + e_sendName + ", e_acceptName=" + e_acceptName
				+ ", m_sendTime=" + m_sendTime + ", m_content=" + m_content + ", m_ext1=" + m_ext1 + ", m_ext2="
				+ m_ext2 + "]";
	}
	
}
