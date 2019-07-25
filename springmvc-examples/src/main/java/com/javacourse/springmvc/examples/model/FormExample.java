package com.javacourse.springmvc.examples.model;

import java.util.Arrays;
import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class FormExample {
	@NotBlank
	private String fullName;
	private Integer age;
	@DateTimeFormat(iso = ISO.DATE)
	private Date birthDate;
	private Province homeProvince;
	@NotEmpty
	private Province[] workProvince;
	private String homeProvinceCode2;
	private String[] workProvinceCode2;

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Province getHomeProvince() {
		return homeProvince;
	}

	public void setHomeProvince(Province homeProvince) {
		this.homeProvince = homeProvince;
	}

	public Province[] getWorkProvince() {
		return workProvince;
	}

	public void setWorkProvince(Province[] workProvince) {
		this.workProvince = workProvince;
	}

	public String getHomeProvinceCode2() {
		return homeProvinceCode2;
	}

	public void setHomeProvinceCode2(String homeProvinceCode2) {
		this.homeProvinceCode2 = homeProvinceCode2;
	}

	public String[] getWorkProvinceCode2() {
		return workProvinceCode2;
	}

	public void setWorkProvinceCode2(String[] workProvinceCode2) {
		this.workProvinceCode2 = workProvinceCode2;
	}

	@Override
	public String toString() {
		return "FormExample [fullName=" + fullName + ", age=" + age + ", birthDate=" + birthDate + ", homeProvince="
				+ homeProvince + ", workProvince=" + Arrays.toString(workProvince) + ", homeProvinceCode2="
				+ homeProvinceCode2 + ", workProvinceCode2=" + Arrays.toString(workProvinceCode2) + "]";
	}

}
