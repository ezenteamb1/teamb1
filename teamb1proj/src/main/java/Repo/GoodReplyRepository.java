package Repo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import VO.GoodReplyVO;

@Repository
public class GoodReplyRepository {
	
	@Autowired
	SqlSessionTemplate template;
	
	private final String NAME_SP = "GoodReply";
	
	public int insert(List<GoodReplyVO> vo) {
		return template.insert(NAME_SP + ".insertList", vo);
	}
	
	public int reply_update(GoodReplyVO vo){
		return template.update(NAME_SP + ".reply_update", vo); 
	}
	
	public int reply_delete(int sno) {
		return template.delete(NAME_SP + ".reply_delete", sno); 
	}

}
