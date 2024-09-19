package VO;

public class RecipeFileVO {
   private int recipeFileNo;
   private int recipeNo;
   private String recipeFilePath;
   private String recipeFileName;
   private String recipeFileSize;
   private String recipeFileType;

   public int getRecipeFileNo() {
      return this.recipeFileNo;
   }

   public int getRecipeNo() {
      return this.recipeNo;
   }

   public String getRecipeFilePath() {
      return this.recipeFilePath;
   }

   public String getRecipeFileName() {
      return this.recipeFileName;
   }

   public String getRecipeFileSize() {
      return this.recipeFileSize;
   }

   public String getRecipeFileType() {
      return this.recipeFileType;
   }

   public void setRecipeFileNo(int recipeFileNo) {
      this.recipeFileNo = recipeFileNo;
   }

   public void setRecipeNo(int recipeNo) {
      this.recipeNo = recipeNo;
   }

   public void setRecipeFilePath(String recipeFilePath) {
      this.recipeFilePath = recipeFilePath;
   }

   public void setRecipeFileName(String recipeFileName) {
      this.recipeFileName = recipeFileName;
   }

   public void setRecipeFileSize(String recipeFileSize) {
      this.recipeFileSize = recipeFileSize;
   }

   public void setRecipeFileType(String recipeFileType) {
      this.recipeFileType = recipeFileType;
   }
}
