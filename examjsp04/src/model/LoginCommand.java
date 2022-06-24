package model;

public class LoginCommand {
	private String infoId;
	private String infoPw;
	private int rememberId;
	
	public int getRememberId() {
		return rememberId;
	}
	public void setRememberId(int id) {
		this.rememberId = id;
	}
	
	public String getInfoId() {
		return infoId;
	}
	public void setInfoId(String infoId) {
		this.infoId = infoId;
	}
	public String getInfoPw() {
		return infoPw;
	}
	public void setInfoPw(String infoPw) {
		this.infoPw = infoPw;
	}
	
}
