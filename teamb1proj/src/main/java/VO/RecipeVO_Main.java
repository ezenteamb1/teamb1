package VO;

import java.util.List;
import java.util.Map;

public class RecipeVO_Main {

	private int recipeNo;			// 레시피 게시글 번호
	private String id;				// 작성자
	private int codeNo;				// 카테고리	
	private String recipeTitle;		// 제목
	private String createDate;		// 작성일
	private String mustIngre;		// 레시피 필수 재료
	private String choiceIngre;		// 레시피 선택 재료
	private String jang;			// 레시피 양념장
	private String smart;			// 스마트 에디터
	private int recipeView;			// 레시피 조회수
	private int deleteFlag;			// 게시글 삭제 여부
	private List<Map<String,Object>> Rfiles;
	
	
	public int getRecipeNo() {
		return recipeNo;
	}
	public String getId() {
		return id;
	}
	public int getCodeNo() {
		return codeNo;
	}
	public String getRecipeTitle() {
		return recipeTitle;
	}
	public String getCreateDate() {
		return createDate;
	}
	public String getMustIngre() {
		return mustIngre;
	}
	public String getChoiceIngre() {
		return choiceIngre;
	}
	public String getJang() {
		return jang;
	}
	public String getSmart() {
		return smart;
	}
	public int getRecipeView() {
		return recipeView;
	}
	public int getDeleteFlag() {
		return deleteFlag;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setCodeNo(int codeNo) {
		this.codeNo = codeNo;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public void setMustIngre(String mustIngre) {
		this.mustIngre = mustIngre;
	}
	public void setChoiceIngre(String choiceIngre) {
		this.choiceIngre = choiceIngre;
	}
	public void setJang(String jang) {
		this.jang = jang;
	}
	public void setSmart(String smart) {
		this.smart = smart;
	}
	public void setRecipeView(int recipeView) {
		this.recipeView = recipeView;
	}
	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public List<Map<String, Object>> getRfiles() {
		return Rfiles;
	}
	public void setRfiles(List<Map<String, Object>> rfiles) {
		this.Rfiles = rfiles;
	}
	
	
}