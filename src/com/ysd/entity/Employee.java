package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Employee {
	private Integer e_id;			//编号
	private String e_loginName;		//登录名
	private String e_passWord;		//密码
	private Integer e_isLockOut;	//是否锁定
	private String e_lastLoginTime;	//最后一次登录时间
	private String e_createTime;	//创建时间
	private Integer e_pwdWrongTime;	//密码错误次数
	private String e_lockTime;		//被锁定时间
	private String e_protectEmail;	//密保邮箱
	private String e_protectMTel;	//密保手机号
	private String e_fingerprintNum;//指纹码
	private String e_liveAddress;	//员工现住址
	private Integer e_sex;			//员工性别
	private Integer e_age;			//员工年龄
	private String e_photo;			//员工照片
	private Integer e_isMarry;		//是否结婚
	private String e_fromAddress;	//员工籍贯
	private String e_eduStatus;		//学历状态
	private String e_weiXin;		//员工微信
	private String e_inCompanyTime;	//入职时间
	private String e_leaveCompanyTime;//离职时间
	private String e_ext1;			//
	private String e_ext2;			//
	private String e_ext3;			//
	private Integer e_ext4;			//
	private Integer e_ext5;			//
	private Integer e_ext6;			//
	
	private EmployeeRole employeeRole;

	public Integer getE_id() {
		return e_id;
	}

	public void setE_id(Integer e_id) {
		this.e_id = e_id;
	}

	public String getE_loginName() {
		return e_loginName;
	}

	public void setE_loginName(String e_loginName) {
		this.e_loginName = e_loginName;
	}

	public String getE_passWord() {
		return e_passWord;
	}

	public void setE_passWord(String e_passWord) {
		this.e_passWord = e_passWord;
	}

	public Integer getE_isLockOut() {
		return e_isLockOut;
	}

	public void setE_isLockOut(Integer e_isLockOut) {
		this.e_isLockOut = e_isLockOut;
	}

	public String getE_lastLoginTime() {
		return e_lastLoginTime;
	}

	public void setE_lastLoginTime(String e_lastLoginTime) {
		this.e_lastLoginTime = e_lastLoginTime;
	}

	public String getE_createTime() {
		return e_createTime;
	}

	public void setE_createTime(String e_createTime) {
		this.e_createTime = e_createTime;
	}

	public Integer getE_pwdWrongTime() {
		return e_pwdWrongTime;
	}

	public void setE_pwdWrongTime(Integer e_pwdWrongTime) {
		this.e_pwdWrongTime = e_pwdWrongTime;
	}

	public String getE_lockTime() {
		return e_lockTime;
	}

	public void setE_lockTime(String e_lockTime) {
		this.e_lockTime = e_lockTime;
	}

	public String getE_protectEmail() {
		return e_protectEmail;
	}

	public void setE_protectEmail(String e_protectEmail) {
		this.e_protectEmail = e_protectEmail;
	}

	public String getE_protectMTel() {
		return e_protectMTel;
	}

	public void setE_protectMTel(String e_protectMTel) {
		this.e_protectMTel = e_protectMTel;
	}

	public String getE_fingerprintNum() {
		return e_fingerprintNum;
	}

	public void setE_fingerprintNum(String e_fingerprintNum) {
		this.e_fingerprintNum = e_fingerprintNum;
	}

	public String getE_liveAddress() {
		return e_liveAddress;
	}

	public void setE_liveAddress(String e_liveAddress) {
		this.e_liveAddress = e_liveAddress;
	}

	public Integer getE_sex() {
		return e_sex;
	}

	public void setE_sex(Integer e_sex) {
		this.e_sex = e_sex;
	}

	public Integer getE_age() {
		return e_age;
	}

	public void setE_age(Integer e_age) {
		this.e_age = e_age;
	}

	public String getE_photo() {
		return e_photo;
	}

	public void setE_photo(String e_photo) {
		this.e_photo = e_photo;
	}

	public Integer getE_isMarry() {
		return e_isMarry;
	}

	public void setE_isMarry(Integer e_isMarry) {
		this.e_isMarry = e_isMarry;
	}

	public String getE_fromAddress() {
		return e_fromAddress;
	}

	public void setE_fromAddress(String e_fromAddress) {
		this.e_fromAddress = e_fromAddress;
	}

	public String getE_eduStatus() {
		return e_eduStatus;
	}

	public void setE_eduStatus(String e_eduStatus) {
		this.e_eduStatus = e_eduStatus;
	}

	public String getE_weiXin() {
		return e_weiXin;
	}

	public void setE_weiXin(String e_weiXin) {
		this.e_weiXin = e_weiXin;
	}

	public String getE_inCompanyTime() {
		return e_inCompanyTime;
	}

	public void setE_inCompanyTime(String e_inCompanyTime) {
		this.e_inCompanyTime = e_inCompanyTime;
	}

	public String getE_leaveCompanyTime() {
		return e_leaveCompanyTime;
	}

	public void setE_leaveCompanyTime(String e_leaveCompanyTime) {
		this.e_leaveCompanyTime = e_leaveCompanyTime;
	}

	public String getE_ext1() {
		return e_ext1;
	}

	public void setE_ext1(String e_ext1) {
		this.e_ext1 = e_ext1;
	}

	public String getE_ext2() {
		return e_ext2;
	}

	public void setE_ext2(String e_ext2) {
		this.e_ext2 = e_ext2;
	}

	public String getE_ext3() {
		return e_ext3;
	}

	public void setE_ext3(String e_ext3) {
		this.e_ext3 = e_ext3;
	}

	public Integer getE_ext4() {
		return e_ext4;
	}

	public void setE_ext4(Integer e_ext4) {
		this.e_ext4 = e_ext4;
	}

	public Integer getE_ext5() {
		return e_ext5;
	}

	public void setE_ext5(Integer e_ext5) {
		this.e_ext5 = e_ext5;
	}

	public Integer getE_ext6() {
		return e_ext6;
	}

	public void setE_ext6(Integer e_ext6) {
		this.e_ext6 = e_ext6;
	}

	public EmployeeRole getEmployeeRole() {
		return employeeRole;
	}

	public void setEmployeeRole(EmployeeRole employeeRole) {
		this.employeeRole = employeeRole;
	}

    @Override
    public String toString() {
        return "Employee [e_id=" + e_id + ", e_loginName=" + e_loginName + ", e_passWord=" + e_passWord
                + ", e_isLockOut=" + e_isLockOut + ", e_lastLoginTime=" + e_lastLoginTime + ", e_createTime="
                + e_createTime + ", e_pwdWrongTime=" + e_pwdWrongTime + ", e_lockTime=" + e_lockTime
                + ", e_protectEmail=" + e_protectEmail + ", e_protectMTel=" + e_protectMTel + ", e_fingerprintNum="
                + e_fingerprintNum + ", e_liveAddress=" + e_liveAddress + ", e_sex=" + e_sex + ", e_age=" + e_age
                + ", e_photo=" + e_photo + ", e_isMarry=" + e_isMarry + ", e_fromAddress=" + e_fromAddress
                + ", e_eduStatus=" + e_eduStatus + ", e_weiXin=" + e_weiXin + ", e_inCompanyTime=" + e_inCompanyTime
                + ", e_leaveCompanyTime=" + e_leaveCompanyTime + ", e_ext1=" + e_ext1 + ", e_ext2=" + e_ext2
                + ", e_ext3=" + e_ext3 + ", e_ext4=" + e_ext4 + ", e_ext5=" + e_ext5 + ", e_ext6=" + e_ext6
                + ", employeeRole=" + employeeRole + "]";
    }
    
}
