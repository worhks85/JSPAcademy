package info;

public class InfoVo {
	private long infoNo;
	private String infoId;
	private String infoPw;
	private String infoNick;
	public InfoVo(String infoId, String infoPw, String infoNick) {
		super();
		this.infoId = infoId;
		this.infoPw = infoPw;
		this.infoNick = infoNick;
	}
	public long getInfoNo() {
		return infoNo;
	}
	public void setInfoNo(long infoNo) {
		this.infoNo = infoNo;
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
	public String getInfoNick() {
		return infoNick;
	}
	public void setInfoNick(String infoNick) {
		this.infoNick = infoNick;
	}
	@Override
	public String toString() {
		return "InfoVo [infoNo=" + infoNo + ", infoId=" + infoId + ", infoPw=" + infoPw + ", infoNick=" + infoNick
				+ "]";
	}
	
	
}
