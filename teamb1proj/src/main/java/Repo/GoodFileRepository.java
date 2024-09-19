package Repo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import VO.GoodFileVO;


@Repository
public class GoodFileRepository {
	
	@Autowired
	SqlSessionTemplate template;
	
	public int insert(GoodFileVO vo) {
		return template.insert("GoodFileMapper.insert", vo); 
	}
	
    public GoodFileVO findByGoodNo(int goodNo) {
        return template.selectOne("GoodFileMapper.findByGoodNo", goodNo);
    }

    public int update(GoodFileVO vo) {
        return template.update("GoodFileMapper.update", vo);
    }
}
