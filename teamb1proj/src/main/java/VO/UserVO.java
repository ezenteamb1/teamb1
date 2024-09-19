package VO;

public class UserVO {

	private String id;			// 아이디
	private int profileNo;		// 프로필 사진 번호
	private String pw;			// 비밀번호
	private String name;		// 이름
	private String nick;		// 닉네임
	private String email;		// 이메일
	private String pn;			// 전화번호
	private int userType;		// 회원유형
	private ProfileVO profilevo;
	
	public String getId() {
		return id;
	}
	public int getProfileNo() {
		return profileNo;
	}
	public String getPw() {
		return pw;
	}
	public String getName() {
		return name;
	}
	public String getNick() {
		return nick;
	}
	public String getEmail() {
		return email;
	}
	public String getPn() {
		return pn;
	}
	public int getUserType() {
		return userType;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setProfileNo(int profileNo) {
		this.profileNo = profileNo;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPn(String pn) {
		this.pn = pn;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
}