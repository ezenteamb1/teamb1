package Repo;

import VO.AskVO;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AskRepository {
   @Autowired
   SqlSessionTemplate sqlSessionTemplate;

   public int insertOne(AskVO askvo) {
      return this.sqlSessionTemplate.insert("AskMapper.insert", askvo);
   }

   public List<AskVO> getAllData(String id) {
      return this.sqlSessionTemplate.selectList("AskMapper.getAll", id);
   }

   public int count() {
      return (Integer)this.sqlSessionTemplate.selectOne("AskMapper.count");
   }

   public AskVO selectOne(int askNo) {
      return (AskVO)this.sqlSessionTemplate.selectOne("AskMapper.findByAskNo", askNo);
   }

   public int reply(AskVO askvo) {
      return this.sqlSessionTemplate.update("AskMapper.reply", askvo);
   }
}
