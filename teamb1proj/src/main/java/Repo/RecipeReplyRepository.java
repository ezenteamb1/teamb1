package Repo;

import VO.RecipeReplyVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeReplyRepository {
   @Autowired
   SqlSessionTemplate sqlSessionTemplate;
   private final String NAME_SPACE = "RecipeReplyMapper";

   public int selectOne(int recipeReplyNo) {
      return (Integer)this.sqlSessionTemplate.selectOne("RecipeReplyMapper.selectone", recipeReplyNo);
   }

   public int insert(RecipeReplyVO vo) {
      System.out.println(this.sqlSessionTemplate);
      return this.sqlSessionTemplate.insert("RecipeReplyMapper.insert", vo);
   }

   public int update(RecipeReplyVO vo) {
      return this.sqlSessionTemplate.update("RecipeReplyMapper.update", vo);
   }

   public int delete(int recipeReplyNo) {
      return this.sqlSessionTemplate.delete("RecipeReplyMapper.delete", recipeReplyNo);
   }
}
