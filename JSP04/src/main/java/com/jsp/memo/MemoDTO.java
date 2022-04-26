package com.jsp.memo;

import java.sql.Timestamp;

public class MemoDTO {
	
	private int memoID;
	private String nickName;
	private String contents;
	private Timestamp regTime;
	
	public MemoDTO(int memoID, String nickName, String contents, Timestamp regTime) {
		super();
		this.memoID = memoID;
		this.nickName = nickName;
		this.contents = contents;
		this.regTime = regTime;
	}

	public int getMemoID() {
		return memoID;
	}

	public void setMemoID(int memoID) {
		this.memoID = memoID;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getRegTime() {
		return regTime;
	}

	public void setRegTime(Timestamp regTime) {
		this.regTime = regTime;
	}

	public MemoDTO() {}
	
}
