package Repo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import VO.CodeVO;

@Repository
public class CodeRepository {

	@Autowired
	JdbcTemplate templeate;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAME_SPACE = "CodeMapper";
	
	public int insertOne(CodeVO vo) {
		return sqlSessionTemplate.insert(NAME_SPACE + ".insert", vo);
	}
	
	public CodeVO findByBigAndSmall(CodeVO vo) {
		return sqlSessionTemplate.selectOne(NAME_SPACE + ".findByBigAndSmall", vo); 
	}
	
}
