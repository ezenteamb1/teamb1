package VO;

public class ProfileVO {
	
	private int profileNo;			// 프로필 사진 번호
	private String profilePath;		// 프로필 사진 경로
	private String profileName;		// 프로필 사진 이름
	private String id;
	
	public int getProfileNo() {
		return profileNo;
	}
	public String getProfilePath() {
		return profilePath;
	}
	public String getProfileName() {
		return profileName;
	}
	public void setProfileNo(int profileNo) {
		this.profileNo = profileNo;
	}
	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}
	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}