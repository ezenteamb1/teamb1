package VO;

public class GoodReplyVO {

	private int goodReplyNo;  			// 맛집 댓글 번호
	private int goodNo;					// 맛집 게시글 번호
	private String id;					// 작성자
	private int profileNo;				// 프로필 사진 번호
	private String goodReplyContent;	// 댓글내용
	private String createDate;			// 작성일
	
	public int getGoodReplyNo() {
		return goodReplyNo;
	}
	public int getGoodNo() {
		return goodNo;
	}
	public String getId() {
		return id;
	}
	public int getProfileNo() {
		return profileNo;
	}
	public String getGoodReplyContent() {
		return goodReplyContent;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setGoodReplyNo(int goodReplyNo) {
		this.goodReplyNo = goodReplyNo;
	}
	public void setGoodNo(int goodNo) {
		this.goodNo = goodNo;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setProfileNo(int profileNo) {
		this.profileNo = profileNo;
	}
	public void setGoodReplyContent(String goodReplyContent) {
		this.goodReplyContent = goodReplyContent;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	
	@Override
	public String toString() {
		return "GoodReplyVO [goodReplyNo=" + goodReplyNo + ", goodNo=" + goodNo + ", id=" + id + ", profileNo=" + profileNo
				+ ", goodReplyContent=" + goodReplyContent + ", createDate=" + createDate + "]";
	}
	
}