package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class EmployeeCheck {
	private Integer ec_id;
	private Integer e_id;
	private String e_name;
	private String ec_checkInTime;
	private String ec_checkOutTime;
	private Integer ec_checkStatus;
	private Integer ec_isCancel;
	private String ec_ext1;
	private String ec_ext2;
	private String ec_ext3;
	private Integer ec_ext4;
	private Integer ec_ext5;
	private Integer ec_ext6;
	
	private Employee employee;
	
	public Integer getEc_id() {
		return ec_id;
	}
	public void setEc_id(Integer ec_id) {
		this.ec_id = ec_id;
	}
	public Integer getE_id() {
		return e_id;
	}
	public void setE_id(Integer e_id) {
		this.e_id = e_id;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getEc_checkInTime() {
		return ec_checkInTime;
	}
	public void setEc_checkInTime(String ec_checkInTime) {
		this.ec_checkInTime = ec_checkInTime;
	}
	public String getEc_checkOutTime() {
		return ec_checkOutTime;
	}
	public void setEc_checkOutTime(String ec_checkOutTime) {
		this.ec_checkOutTime = ec_checkOutTime;
	}
	public Integer getEc_checkStatus() {
		return ec_checkStatus;
	}
	public void setEc_checkStatus(Integer ec_checkStatus) {
		this.ec_checkStatus = ec_checkStatus;
	}
	public Integer getEc_isCancel() {
		return ec_isCancel;
	}
	public void setEc_isCancel(Integer ec_isCancel) {
		this.ec_isCancel = ec_isCancel;
	}
	public String getEc_ext1() {
		return ec_ext1;
	}
	public void setEc_ext1(String ec_ext1) {
		this.ec_ext1 = ec_ext1;
	}
	public String getEc_ext2() {
		return ec_ext2;
	}
	public void setEc_ext2(String ec_ext2) {
		this.ec_ext2 = ec_ext2;
	}
	public String getEc_ext3() {
		return ec_ext3;
	}
	public void setEc_ext3(String ec_ext3) {
		this.ec_ext3 = ec_ext3;
	}
	public Integer getEc_ext4() {
		return ec_ext4;
	}
	public void setEc_ext4(Integer ec_ext4) {
		this.ec_ext4 = ec_ext4;
	}
	public Integer getEc_ext5() {
		return ec_ext5;
	}
	public void setEc_ext5(Integer ec_ext5) {
		this.ec_ext5 = ec_ext5;
	}
	public Integer getEc_ext6() {
		return ec_ext6;
	}
	public void setEc_ext6(Integer ec_ext6) {
		this.ec_ext6 = ec_ext6;
	}
    public Employee getEmployee() {
        return employee;
    }
    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
    
    @Override
    public String toString() {
        return "EmployeeCheck [ec_id=" + ec_id + ", e_id=" + e_id + ", e_name=" + e_name + ", ec_checkInTime="
                + ec_checkInTime + ", ec_checkOutTime=" + ec_checkOutTime + ", ec_checkStatus=" + ec_checkStatus
                + ", ec_isCancel=" + ec_isCancel + ", ec_ext1=" + ec_ext1 + ", ec_ext2=" + ec_ext2 + ", ec_ext3="
                + ec_ext3 + ", ec_ext4=" + ec_ext4 + ", ec_ext5=" + ec_ext5 + ", ec_ext6=" + ec_ext6 + ", employee="
                + employee + "]";
    }
	
}
