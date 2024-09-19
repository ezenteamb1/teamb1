package VO;

public class GoodFileVO {
	
	private int goodFileNo;			// 맛집 첨부파일 번호
	private int goodNo;				// 맛집 게시글 번호
	private String goodFilePath;	// 맛집 첨부파일 경로
	private String goodFileName;	// 맛집 첨부파일 이름
	private String goodFileSize;	// 맛집 첨부파일 크기
	private String goodFileType;	// 맛집 첨부파일 유형
	
	public int getGoodFileNo() {
		return goodFileNo;
	}
	public int getGoodNo() {
		return goodNo;
	}
	public String getGoodFilePath() {
		return goodFilePath;
	}
	public String getGoodFileName() {
		return goodFileName;
	}
	public String getGoodFileSize() {
		return goodFileSize;
	}
	public String getGoodFileType() {
		return goodFileType;
	}
	public void setGoodFileNo(int goodFileNo) {
		this.goodFileNo = goodFileNo;
	}
	public void setGoodNo(int goodNo) {
		this.goodNo = goodNo;
	}
	public void setGoodFilePath(String goodFilePath) {
		this.goodFilePath = goodFilePath;
	}
	public void setGoodFileName(String goodFileName) {
		this.goodFileName = goodFileName;
	}
	public void setGoodFileSize(String goodFileSize) {
		this.goodFileSize = goodFileSize;
	}
	public void setGoodFileType(String goodFileType) {
		this.goodFileType = goodFileType;
	}
	
	@Override
	public String toString() {
		return "GoodFileVO [goodFileNo=" + goodFileNo + ", goodNo=" + goodNo + ", goodFilePath=" + goodFilePath + ", goodFileName=" + goodFileName
				+ ", goodFileSize=" + goodFileSize + ", goodFileType=" + goodFileType + "]";
	}
}