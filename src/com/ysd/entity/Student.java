package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Student {
	private Integer s_id;			//学生编号
	private String s_name;			//学生姓名
	private Integer s_age;			//年龄
	private Integer s_sex;			//性别
	private String s_phone;			//电话
	private String s_eduStatus;		//学历状态
	private String s_perStatus;		//个人状态
	private String s_comeWay;		//来源渠道
	private String s_comeSite;		//来源网站
	private String s_sourceKeyWord;	//来源关键词
	private String s_address;		//地址
	private Integer s_askerId;		//咨询师ID
	private String s_QQ;			//QQ
	private String s_weiXin;		//微信
	private String s_remarks;		//在线备注
	private String s_createTime;	//创建时间
	private String s_learnForward;	//课程方向
	private Integer s_isValid;		//是否有效
	private Integer s_record;		//打分
	private Integer s_isReturnVisit;//是否回访
	private String s_firstVisitTime;//首次回访时间
	private Integer s_isHome;		//是否上门
	private String s_homeTime;		//上门时间
	private String s_lostReason;	//无效原因
	private Integer s_isPay;		//是否付费
	private String s_payTime;		//付费时间
	private Double s_payMoney;		//金额
	private Integer s_isReturnMoney;//是否退费
	private Integer s_isInClass;	//是否进班
	private String s_inClassTime;	//进班时间
	private String s_inClassRemarks;//进班备注
	private String s_askerRemarks;	//咨询师备注
	private String s_fromPart;		//来源部门
	private String s_focus;			//学员关注
	private Integer s_isReport;		//是否报备（是否汇报学员情况）
	private String s_importEmployee;//录入人
	private String s_returnMoneyReason;//退费原因
	private Double s_preMoney;		//定金
	private String s_preMoneyTime;	//定金时间
	private String s_ext1;			//
	private String s_ext2;			//
	private String s_ext3;			//
	private Integer s_ext4;			//
	private Integer s_ext5;			//
	private Integer s_ext6;			//
	public Integer getS_id() {
		return s_id;
	}
	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public Integer getS_age() {
		return s_age;
	}
	public void setS_age(Integer s_age) {
		this.s_age = s_age;
	}
	public Integer getS_sex() {
		return s_sex;
	}
	public void setS_sex(Integer s_sex) {
		this.s_sex = s_sex;
	}
	public String getS_phone() {
		return s_phone;
	}
	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}
	public String getS_eduStatus() {
		return s_eduStatus;
	}
	public void setS_eduStatus(String s_eduStatus) {
		this.s_eduStatus = s_eduStatus;
	}
	public String getS_perStatus() {
		return s_perStatus;
	}
	public void setS_perStatus(String s_perStatus) {
		this.s_perStatus = s_perStatus;
	}
	public String getS_comeWay() {
		return s_comeWay;
	}
	public void setS_comeWay(String s_comeWay) {
		this.s_comeWay = s_comeWay;
	}
	public String getS_comeSite() {
		return s_comeSite;
	}
	public void setS_comeSite(String s_comeSite) {
		this.s_comeSite = s_comeSite;
	}
	public String getS_sourceKeyWord() {
		return s_sourceKeyWord;
	}
	public void setS_sourceKeyWord(String s_sourceKeyWord) {
		this.s_sourceKeyWord = s_sourceKeyWord;
	}
	public String getS_address() {
		return s_address;
	}
	public void setS_address(String s_address) {
		this.s_address = s_address;
	}
	public Integer getS_askerId() {
		return s_askerId;
	}
	public void setS_askerId(Integer s_askerId) {
		this.s_askerId = s_askerId;
	}
	public String getS_QQ() {
		return s_QQ;
	}
	public void setS_QQ(String s_QQ) {
		this.s_QQ = s_QQ;
	}
	public String getS_weiXin() {
		return s_weiXin;
	}
	public void setS_weiXin(String s_weiXin) {
		this.s_weiXin = s_weiXin;
	}
	public String getS_remarks() {
		return s_remarks;
	}
	public void setS_remarks(String s_remarks) {
		this.s_remarks = s_remarks;
	}
	public String getS_createTime() {
		return s_createTime;
	}
	public void setS_createTime(String s_createTime) {
		this.s_createTime = s_createTime;
	}
	public String getS_learnForward() {
		return s_learnForward;
	}
	public void setS_learnForward(String s_learnForward) {
		this.s_learnForward = s_learnForward;
	}
	public Integer getS_isValid() {
		return s_isValid;
	}
	public void setS_isValid(Integer s_isValid) {
		this.s_isValid = s_isValid;
	}
	public Integer getS_record() {
		return s_record;
	}
	public void setS_record(Integer s_record) {
		this.s_record = s_record;
	}
	public Integer getS_isReturnVisit() {
		return s_isReturnVisit;
	}
	public void setS_isReturnVisit(Integer s_isReturnVisit) {
		this.s_isReturnVisit = s_isReturnVisit;
	}
	public String getS_firstVisitTime() {
		return s_firstVisitTime;
	}
	public void setS_firstVisitTime(String s_firstVisitTime) {
		this.s_firstVisitTime = s_firstVisitTime;
	}
	public Integer getS_isHome() {
		return s_isHome;
	}
	public void setS_isHome(Integer s_isHome) {
		this.s_isHome = s_isHome;
	}
	public String getS_homeTime() {
		return s_homeTime;
	}
	public void setS_homeTime(String s_homeTime) {
		this.s_homeTime = s_homeTime;
	}
	public String getS_lostReason() {
		return s_lostReason;
	}
	public void setS_lostReason(String s_lostReason) {
		this.s_lostReason = s_lostReason;
	}
	public Integer getS_isPay() {
		return s_isPay;
	}
	public void setS_isPay(Integer s_isPay) {
		this.s_isPay = s_isPay;
	}
	public String getS_payTime() {
		return s_payTime;
	}
	public void setS_payTime(String s_payTime) {
		this.s_payTime = s_payTime;
	}
	public Double getS_payMoney() {
		return s_payMoney;
	}
	public void setS_payMoney(Double s_payMoney) {
		this.s_payMoney = s_payMoney;
	}
	public Integer getS_isReturnMoney() {
		return s_isReturnMoney;
	}
	public void setS_isReturnMoney(Integer s_isReturnMoney) {
		this.s_isReturnMoney = s_isReturnMoney;
	}
	public Integer getS_isInClass() {
		return s_isInClass;
	}
	public void setS_isInClass(Integer s_isInClass) {
		this.s_isInClass = s_isInClass;
	}
	public String getS_inClassTime() {
		return s_inClassTime;
	}
	public void setS_inClassTime(String s_inClassTime) {
		this.s_inClassTime = s_inClassTime;
	}
	public String getS_inClassRemarks() {
		return s_inClassRemarks;
	}
	public void setS_inClassRemarks(String s_inClassRemarks) {
		this.s_inClassRemarks = s_inClassRemarks;
	}
	public String getS_askerRemarks() {
		return s_askerRemarks;
	}
	public void setS_askerRemarks(String s_askerRemarks) {
		this.s_askerRemarks = s_askerRemarks;
	}
	public String getS_fromPart() {
		return s_fromPart;
	}
	public void setS_fromPart(String s_fromPart) {
		this.s_fromPart = s_fromPart;
	}
	public String getS_focus() {
		return s_focus;
	}
	public void setS_focus(String s_focus) {
		this.s_focus = s_focus;
	}
	public Integer getS_isReport() {
		return s_isReport;
	}
	public void setS_isReport(Integer s_isReport) {
		this.s_isReport = s_isReport;
	}
	public String getS_importEmployee() {
		return s_importEmployee;
	}
	public void setS_importEmployee(String s_importEmployee) {
		this.s_importEmployee = s_importEmployee;
	}
	public String getS_returnMoneyReason() {
		return s_returnMoneyReason;
	}
	public void setS_returnMoneyReason(String s_returnMoneyReason) {
		this.s_returnMoneyReason = s_returnMoneyReason;
	}
	public Double getS_preMoney() {
		return s_preMoney;
	}
	public void setS_preMoney(Double s_preMoney) {
		this.s_preMoney = s_preMoney;
	}
	public String getS_preMoneyTime() {
		return s_preMoneyTime;
	}
	public void setS_preMoneyTime(String s_preMoneyTime) {
		this.s_preMoneyTime = s_preMoneyTime;
	}
	public String getS_ext1() {
		return s_ext1;
	}
	public void setS_ext1(String s_ext1) {
		this.s_ext1 = s_ext1;
	}
	public String getS_ext2() {
		return s_ext2;
	}
	public void setS_ext2(String s_ext2) {
		this.s_ext2 = s_ext2;
	}
	public String getS_ext3() {
		return s_ext3;
	}
	public void setS_ext3(String s_ext3) {
		this.s_ext3 = s_ext3;
	}
	public Integer getS_ext4() {
		return s_ext4;
	}
	public void setS_ext4(Integer s_ext4) {
		this.s_ext4 = s_ext4;
	}
	public Integer getS_ext5() {
		return s_ext5;
	}
	public void setS_ext5(Integer s_ext5) {
		this.s_ext5 = s_ext5;
	}
	public Integer getS_ext6() {
		return s_ext6;
	}
	public void setS_ext6(Integer s_ext6) {
		this.s_ext6 = s_ext6;
	}
	@Override
	public String toString() {
		return "Student [s_id=" + s_id + ", s_name=" + s_name + ", s_age=" + s_age + ", s_sex=" + s_sex + ", s_phone="
				+ s_phone + ", s_eduStatus=" + s_eduStatus + ", s_perStatus=" + s_perStatus + ", s_comeWay=" + s_comeWay
				+ ", s_comeSite=" + s_comeSite + ", s_sourceKeyWord=" + s_sourceKeyWord + ", s_address=" + s_address
				+ ", s_askerId=" + s_askerId + ", s_QQ=" + s_QQ + ", s_weiXin=" + s_weiXin + ", s_remarks=" + s_remarks
				+ ", s_createTime=" + s_createTime + ", s_learnForward=" + s_learnForward + ", s_isValid=" + s_isValid
				+ ", s_record=" + s_record + ", s_isReturnVisit=" + s_isReturnVisit + ", s_firstVisitTime="
				+ s_firstVisitTime + ", s_isHome=" + s_isHome + ", s_homeTime=" + s_homeTime + ", s_lostReason="
				+ s_lostReason + ", s_isPay=" + s_isPay + ", s_payTime=" + s_payTime + ", s_payMoney=" + s_payMoney
				+ ", s_isReturnMoney=" + s_isReturnMoney + ", s_isInClass=" + s_isInClass + ", s_inClassTime="
				+ s_inClassTime + ", s_inClassRemarks=" + s_inClassRemarks + ", s_askerRemarks=" + s_askerRemarks
				+ ", s_fromPart=" + s_fromPart + ", s_focus=" + s_focus + ", s_isReport=" + s_isReport
				+ ", s_importEmployee=" + s_importEmployee + ", s_returnMoneyReason=" + s_returnMoneyReason
				+ ", s_preMoney=" + s_preMoney + ", s_preMoneyTime=" + s_preMoneyTime + ", s_ext1=" + s_ext1
				+ ", s_ext2=" + s_ext2 + ", s_ext3=" + s_ext3 + ", s_ext4=" + s_ext4 + ", s_ext5=" + s_ext5
				+ ", s_ext6=" + s_ext6 + "]";
	}
	
	
}
