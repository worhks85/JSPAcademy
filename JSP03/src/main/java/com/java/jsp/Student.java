package com.java.jsp;

public class Student {
	
	//자바빈 규약
	//1. 빈이 패키지화 되어있어야 한다.
	// (default 패키지가 아닌 지정된 패키지에 저장되어 있어야 한다.)
	//2. 기본 생성자를 반드시 가지고 있어야 한다.
	//(getter,setter 메소드로 필드값을 할당할 목적으로 만들어 졌으므로 기본 생성자가 있어야 한다)
	// 3. 멤버 변수의 접근 제한자는 private으로 선언한다.
	// 4. 멤버변수에 접근하기 위한 public 접근 제한자인 getter / setter 메소드가 있어야한다.
	
	private int studentID;
	private String name;
	private int age;
	private int grade;
	public Student() {
		
	}
	public int getStudentID() {
		return studentID;
	}
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}

}
