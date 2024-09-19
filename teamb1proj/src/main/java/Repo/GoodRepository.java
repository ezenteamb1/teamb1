package Repo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import VO.GoodReplyVO;
import VO.GoodVO;

@Repository
public class GoodRepository {
	
	@Autowired
	JdbcTemplate templeate;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	private final String NAME_SPACE = "GoodReply";  //good_reply_mapper에 연결 
	
	private final String GOOD_NAME_SPACE = "GoodMapper";  //good_mapper에 연결 
	


	public int insertOne(GoodVO vo) {
		return sqlSessionTemplate.insert(GOOD_NAME_SPACE + ".insert", vo); 
	}
	
	public int update(GoodVO vo){
		return sqlSessionTemplate.update(GOOD_NAME_SPACE + ".update", vo); 
	}
	
//	public int delete(int goodNo) {
//		return sqlSessionTemplate.delete(GOOD_NAME_SPACE + ".delete", goodNo); 
//	}
	
	public GoodVO selectO(int goodNo) {
		return sqlSessionTemplate.selectOne(GOOD_NAME_SPACE + ".find_goodData", goodNo);
	}
	
	public int Good_view_delete(int goodNo) {
		return sqlSessionTemplate.delete(GOOD_NAME_SPACE + ".view_delete", goodNo); 
	}
	
	public GoodVO selectOne(int goodNo) {
		return sqlSessionTemplate.selectOne(GOOD_NAME_SPACE + ".findById", goodNo); 
	}
	
}
