package Repo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import VO.ProfileVO;
import VO.UserVO;

@Repository
public class UserRepository {
	
	@Autowired
	SqlSessionTemplate template; 
	
	public int join(UserVO vo) {
		return template.insert("UserMapper.insert", vo); 
	}
	
	public int join_profile(ProfileVO vo) {
		return template.insert("ProfileMapper.insert", vo); 
	}
	
	public UserVO login(UserVO vo) {
		return template.selectOne("UserMapper.login", vo);
	}

	public int idCheck(String id) {
		return template.selectOne("UserMapper.idCheck", id);
	}
	
	public int userModify(UserVO vo) {
		return template.selectOne("UserMapper.usermodify", vo); 
	}
}
