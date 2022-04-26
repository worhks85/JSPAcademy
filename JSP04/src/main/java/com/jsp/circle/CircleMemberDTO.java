package com.jsp.circle;

public class CircleMemberDTO {
	// DTO : 계층간 데이터 교환을 하기 위한 자바 빈즈
	
	private String name,phone,email;
	private int age;
	
	public CircleMemberDTO(){}

	public CircleMemberDTO(String name, int age ,String phone, String email) {
		super();
		this.name = name;
		this.age = age;
		this.phone = phone;
		this.email = email;
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
}
