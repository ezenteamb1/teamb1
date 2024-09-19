package VO;

public class CodeVO {
	
	private int codeNo;			// 코드 번호
	private int bigCode;		// 부모 코드
	private int smallCode;		// 자식 코드
	
	public int getCodeNo() {
		return codeNo;
	}
	public void setCodeNo(int codeNo) {
		this.codeNo = codeNo;
	}
	public int getBigCode() {
		return bigCode;
	}
	public void setBigCode(int bigCode) {
		this.bigCode = bigCode;
	}
	public int getSmallCode() {
		return smallCode;
	}
	public void setSmallCode(int smallCode) {
		this.smallCode = smallCode;
	}
	
	@Override
	public String toString() {
		return "CodeVO [codeNo=" + codeNo + ", bigCode=" + bigCode + ", smallCode=" + smallCode +  "]";
	}

}