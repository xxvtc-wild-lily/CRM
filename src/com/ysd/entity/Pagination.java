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
	private String in_e_createTime;
	private String en_e_createTime;
	private Student student;
	private String in_s_createTime;
	private String en_s_createTime;
	private Asker asker;
	private String e_importEmployee;
	private Integer a_aid;
	
	private String n_stuName;
	private Integer e_id;
	private String startn_followTime;
	private String endn_followTime;
	private String s_isReturnVisit;
	private String n_followType;
	
	private String e_name;
	private Integer ec_checkStatus;
	private String startCheckInTime;
	private String endCheckInTime;
	
	private Integer n_stuId;
	
	
	public Integer getN_stuId() {
		return n_stuId;
	}
	public void setN_stuId(Integer n_stuId) {
		this.n_stuId = n_stuId;
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
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
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
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	public String getIn_s_createTime() {
		return in_s_createTime;
	}
	public void setIn_s_createTime(String in_s_createTime) {
		this.in_s_createTime = in_s_createTime;
	}
	public String getEn_s_createTime() {
		return en_s_createTime;
	}
	public void setEn_s_createTime(String en_s_createTime) {
		this.en_s_createTime = en_s_createTime;
	}
	public Asker getAsker() {
		return asker;
	}
	public void setAsker(Asker asker) {
		this.asker = asker;
	}
	public String getN_stuName() {
		return n_stuName;
	}
	public void setN_stuName(String n_stuName) {
		this.n_stuName = n_stuName;
	}
	public Integer getE_id() {
		return e_id;
	}
	public void setE_id(Integer e_id) {
		this.e_id = e_id;
	}
	public String getStartn_followTime() {
		return startn_followTime;
	}
	public void setStartn_followTime(String startn_followTime) {
		this.startn_followTime = startn_followTime;
	}
	public String getEndn_followTime() {
		return endn_followTime;
	}
	public void setEndn_followTime(String endn_followTime) {
		this.endn_followTime = endn_followTime;
	}
	public String getS_isReturnVisit() {
		return s_isReturnVisit;
	}
	public void setS_isReturnVisit(String s_isReturnVisit) {
		this.s_isReturnVisit = s_isReturnVisit;
	}
	public String getN_followType() {
		return n_followType;
	}
	public void setN_followType(String n_followType) {
		this.n_followType = n_followType;
	}
	public String getE_name() {
        return e_name;
    }
    public void setE_name(String e_name) {
        this.e_name = e_name;
    }
    public Integer getEc_checkStatus() {
        return ec_checkStatus;
    }
    public void setEc_checkStatus(Integer ec_checkStatus) {
        this.ec_checkStatus = ec_checkStatus;
    }
    public String getStartCheckInTime() {
        return startCheckInTime;
    }
    public void setStartCheckInTime(String startCheckInTime) {
        this.startCheckInTime = startCheckInTime;
    }
    public String getEndCheckInTime() {
        return endCheckInTime;
    }
    public void setEndCheckInTime(String endCheckInTime) {
        this.endCheckInTime = endCheckInTime;
    }
    public String getE_importEmployee() {
        return e_importEmployee;
    }
    public void setE_importEmployee(String e_importEmployee) {
        this.e_importEmployee = e_importEmployee;
    }
    public Integer getA_aid() {
        return a_aid;
    }
    public void setA_aid(Integer a_aid) {
        this.a_aid = a_aid;
    }
	@Override
	public String toString() {
		return "Pagination [page=" + page + ", pageSize=" + pageSize + ", total=" + total + ", rows=" + rows
				+ ", employee=" + employee + ", in_e_createTime=" + in_e_createTime + ", en_e_createTime="
				+ en_e_createTime + ", student=" + student + ", in_s_createTime=" + in_s_createTime
				+ ", en_s_createTime=" + en_s_createTime + ", asker=" + asker + ", e_importEmployee=" + e_importEmployee
				+ ", a_aid=" + a_aid + ", n_stuName=" + n_stuName + ", e_id=" + e_id + ", startn_followTime="
				+ startn_followTime + ", endn_followTime=" + endn_followTime + ", s_isReturnVisit=" + s_isReturnVisit
				+ ", n_followType=" + n_followType + ", e_name=" + e_name + ", ec_checkStatus=" + ec_checkStatus
				+ ", startCheckInTime=" + startCheckInTime + ", endCheckInTime=" + endCheckInTime + "]";
	}
   
	
}
