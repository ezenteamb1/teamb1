package VO;

import java.util.List;
import java.util.Map;

public class GoodVO {
	
	private int goodNo;				// 맛집 게시글 번호
	private String id;				// 작성자
	private int codeNo; 			// 카테고리 번호
	private String goodTitle;		// 제목
	private String goodContent;		// 본문
	private String createDate;		// 작성일
	private String goodAddr;		// 주소이름
	private int goodView;			// 맛집 조회수
	private String goodSummary;		// 맛집 한줄평
	private int star;				// 별점
	private int parking;			// 주차 가능 여부
	private String goodPn;			// 매장 전화번호
	private String open;			// 여는 시간
	private String close;			// 닫는 시간
	private String menu1;			// 대표메뉴 이름1
	private String menu2;			// 대표메뉴 이름2
	private String menu3;			// 대표메뉴 이름3
	private String price1;			// 대표메뉴 가격1
	private String price2;			// 대표메뉴 가격2
	private String price3;			// 대표메뉴 가격3
	private int deleteFlag;			// 게시글 삭제 여부
	private GoodFileVO goodfilevo; 
	private CodeVO codevo; 
	private List<Map<String,Object>> replys;
	private List<Map<String,Object>> files;
	
	public GoodFileVO getGoodfilevo() {
		return goodfilevo;
	}
	public CodeVO getCodevo() {
		return codevo;
	}
	public void setGoodfilevo(GoodFileVO goodfilevo) {
		this.goodfilevo = goodfilevo;
	}
	public void setCodevo(CodeVO codevo) {
		this.codevo = codevo;
		this.codeNo = codevo.getCodeNo();
	}
	public int getGoodNo() {
		return goodNo;
	}
	public String getId() {
		return id;
	}
	public int getCodeNo() {
		return codeNo;
	}
	public String getGoodTitle() {
		return goodTitle;
	}
	public String getGoodContent() {
		return goodContent;
	}
	public String getCreateDate() {
		return createDate;
	}
	public String getGoodAddr() {
		return goodAddr;
	}
	public int getGoodView() {
		return goodView;
	}
	public String getGoodSummary() {
		return goodSummary;
	}
	public int getStar() {
		return star;
	}
	public int getParking() {
		return parking;
	}
	public String getGoodPn() {
		return goodPn;
	}
	public String getOpen() {
		return open;
	}
	public String getClose() {
		return close;
	}
	public String getMenu1() {
		return menu1;
	}
	public String getMenu2() {
		return menu2;
	}
	public String getMenu3() {
		return menu3;
	}
	public String getPrice1() {
		return price1;
	}
	public String getPrice2() {
		return price2;
	}
	public String getPrice3() {
		return price3;
	}
	public int getDeleteFlag() {
		return deleteFlag;
	}
	public void setGoodNo(int goodNo) {
		this.goodNo = goodNo;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setCodeNo(int codeNo) {
		this.codeNo = codeNo;
	}
	public void setGoodTitle(String goodTitle) {
		this.goodTitle = goodTitle;
	}
	public void setGoodContent(String goodContent) {
		this.goodContent = goodContent;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public void setGoodAddr(String goodAddr) {
		this.goodAddr = goodAddr;
	}
	public void setGoodView(int goodView) {
		this.goodView = goodView;
	}
	public void setGoodSummary(String goodSummary) {
		this.goodSummary = goodSummary;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	public void setGoodPn(String goodPn) {
		this.goodPn = goodPn;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public void setClose(String close) {
		this.close = close;
	}
	public void setMenu1(String menu1) {
		this.menu1 = menu1;
	}
	public void setMenu2(String menu2) {
		this.menu2 = menu2;
	}
	public void setMenu3(String menu3) {
		this.menu3 = menu3;
	}
	public void setPrice1(String price1) {
		this.price1 = price1;
	}
	public void setPrice2(String price2) {
		this.price2 = price2;
	}
	public void setPrice3(String price3) {
		this.price3 = price3;
	}
	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	
	public List<Map<String, Object>> getReplys() {
		return replys;
	}
	public void setReplys(List<Map<String, Object>> replys) {
		this.replys = replys;
	}
	public List<Map<String, Object>> getFiles() {
		return files;
	}
	public void setFiles(List<Map<String, Object>> files) {
		this.files = files;
	}
	
	@Override
	public String toString() {
		return "GoodVO [goodNo=" + goodNo + ", id=" + id + ", codeNo=" + codeNo + ", goodTitle=" + goodTitle
				+ ", goodContent=" + goodContent + ", createDate=" + createDate + ", goodAddr=" + goodAddr
				+ ", goodView=" + goodView + ", goodSummary=" + goodSummary + ", star=" + star + ", parking=" + parking
				+ ", goodPn=" + goodPn + ", open=" + open + ", close=" + close + ", menu1=" + menu1 + ", menu2=" + menu2
				+ ", menu3=" + menu3 + ", price1=" + price1 + ", price2=" + price2 + ", price3=" + price3
				+ ", deleteFlag=" + deleteFlag + ", goodfilevo=" + goodfilevo + ", codevo=" + codevo + "]";
	}	
}
