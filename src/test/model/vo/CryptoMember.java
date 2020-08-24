package test.model.vo;

import java.sql.Date;

import member.model.vo.Member;

public class CryptoMember extends Member implements java.io.Serializable{
	
	private static final long serialVersionUID = 1112L;
	
	public CryptoMember() {
		
	}
	
	private String userid;
	private String userpwd;
	private String username;
	private String gender;
	private int age;
	private String phone;
	private String email;
	private String hobby;
	private String etc;
	private Date enrollDate;
	private Date lastModified;
	private String loginok;

	public CryptoMember(String userid, String userpwd, String username, String gender, int age, String phone, String email,
			String hobby, String etc, Date enrollDate, Date lastModified, String loginok) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.email = email;
		this.hobby = hobby;
		this.etc = etc;
		this.enrollDate = enrollDate;
		this.lastModified = lastModified;
		this.loginok = loginok;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getLastModified() {
		return lastModified;
	}

	public void setLastModified(Date lastModified) {
		this.lastModified = lastModified;
	}
	
	public void setLoginOk(String loginok) {
		this.loginok = loginok;
	}
	

	public String getLoginok() {
		return loginok;
	}

	@Override
	public String toString() {
		return "Member [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", gender=" + gender
				+ ", age=" + age + ", phone=" + phone + ", email=" + email + ", hobby=" + hobby + ", etc=" + etc
				+ ", enrollDate=" + enrollDate + ", lastModified=" + lastModified + ", loginok=" + loginok + "]";
	}	
	
}
