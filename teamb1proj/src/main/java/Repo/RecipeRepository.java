package Repo;

import VO.RecipeVO;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeRepository {
   @Autowired
   SqlSessionTemplate sqlSessionTemplate;
   private final String NAME_SPACE = "RecipeMapper";

   public int insertOne(RecipeVO recipevo) {
      return this.sqlSessionTemplate.insert("RecipeMapper.insert", recipevo);
   }

   public RecipeVO selectOne(int recipeNo) {
      return (RecipeVO)this.sqlSessionTemplate.selectOne("RecipeMapper.findByRecipeNo", recipeNo);
   }

   public int updateOne(RecipeVO recipevo) {
      return this.sqlSessionTemplate.update("RecipeMapper.update", recipevo);
   }

   public int updateFlag(int recipeNo) {
      return this.sqlSessionTemplate.update("RecipeMapper.deleteFlag", recipeNo);
   }

   public List<RecipeVO> getAllData() {
      return this.sqlSessionTemplate.selectList("RecipeMapper.getAllData");
   }
}
