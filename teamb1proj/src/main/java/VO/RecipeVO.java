package VO;

import java.util.List;

public class RecipeVO {
   private int recipeNo;
   private String id;
   private int codeNo;
   private String recipeTitle;
   private String createDate;
   private String mustIngre;
   private String choiceIngre;
   private String jang;
   private String smart;
   private int recipeView;
   private int deleteFlag;
   private RecipeFileVO recipeFile;
   private CodeVO codevo;
   List<RecipeReplyVO> recipereplyvo;
   List<UserVO> uservo;

   public List<RecipeReplyVO> getRecipereplyvo() {
      return this.recipereplyvo;
   }

   public List<UserVO> getUservo() {
      return this.uservo;
   }

   public void setRecipereplyvo(List<RecipeReplyVO> recipereplyvo) {
      this.recipereplyvo = recipereplyvo;
   }

   public void setUservo(List<UserVO> uservo) {
      this.uservo = uservo;
   }

   public int getRecipeNo() {
      return this.recipeNo;
   }

   public String getId() {
      return this.id;
   }

   public int getCodeNo() {
      return this.codeNo;
   }

   public String getRecipeTitle() {
      return this.recipeTitle;
   }

   public String getCreateDate() {
      return this.createDate;
   }

   public String getMustIngre() {
      return this.mustIngre;
   }

   public String getChoiceIngre() {
      return this.choiceIngre;
   }

   public String getJang() {
      return this.jang;
   }

   public String getSmart() {
      return this.smart;
   }

   public int getRecipeView() {
      return this.recipeView;
   }

   public int getDeleteFlag() {
      return this.deleteFlag;
   }

   public RecipeFileVO getRecipeFile() {
      return this.recipeFile;
   }

   public CodeVO getCodevo() {
      return this.codevo;
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

   public void setRecipeFile(RecipeFileVO recipeFile) {
      this.recipeFile = recipeFile;
   }

   public void setCodevo(CodeVO codevo) {
      this.codevo = codevo;
      this.codeNo = codevo.getCodeNo();
   }

   public String toString() {
      return "RecipeVO [recipeNo=" + this.recipeNo + ", id=" + this.id + ", codeNo=" + this.codeNo + ", recipeTitle=" + this.recipeTitle + ", createDate=" + this.createDate + ", mustIngre=" + this.mustIngre + ", choiceIngre=" + this.choiceIngre + ", jang=" + this.jang + ", smart=" + this.smart + ", recipeView=" + this.recipeView + ", deleteFlag=" + this.deleteFlag + ", recipeFile=" + this.recipeFile + ", codevo=" + this.codevo + ", recipereplyvo=" + this.recipereplyvo + ", uservo=" + this.uservo + "]";
   }
}
