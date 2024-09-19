package Repo;

import VO.RecipeFileVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeFileRepository {
   @Autowired
   SqlSessionTemplate template;

   public int insert(RecipeFileVO vo) {
      return this.template.insert("RecipeFileMapper.insert", vo);
   }

   public int update(RecipeFileVO vo) {
      return this.template.update("RecipeFileMapper.update", vo);
   }

   public RecipeFileVO findByRecipeNo(int recipeNo) {
      return (RecipeFileVO)this.template.selectOne("RecipeFileMapper.findByRecipeNo", recipeNo);
   }
}
