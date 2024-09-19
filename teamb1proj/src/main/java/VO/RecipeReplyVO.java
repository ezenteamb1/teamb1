package VO;

public class RecipeReplyVO {
   private int recipeReplyNo;
   private int recipeNo;
   private String id;
   private String recipeReplyContent;
   private String createDate;

   public int getRecipeNo() {
      return this.recipeNo;
   }

   public int getRecipeReplyNo() {
      return this.recipeReplyNo;
   }

   public String getRecipeReplyContent() {
      return this.recipeReplyContent;
   }

   public String getCreateDate() {
      return this.createDate;
   }

   public String getId() {
      return this.id;
   }

   public void setRecipeNo(int recipeNo) {
      this.recipeNo = recipeNo;
   }

   public void setRecipeReplyNo(int recipeReplyNo) {
      this.recipeReplyNo = recipeReplyNo;
   }

   public void setRecipeReplyContent(String recipeReplyContent) {
      this.recipeReplyContent = recipeReplyContent;
   }

   public void setCreateDate(String createDate) {
      this.createDate = createDate;
   }

   public void setId(String id) {
      this.id = id;
   }
}
