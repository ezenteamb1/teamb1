package controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.Session;

import Repo.UserRepository;
import VO.ProfileVO;
import VO.UserVO;




@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	UserRepository repository; 
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		
		//알아서 join.jsp를 찾아간다. 
		return "join"; 
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinOk(UserVO vo, ProfileVO pvo) {
		
		int result =  repository.join(vo); 
		if(result > 0 ) {
			//성공
			repository.join_profile(pvo);
			System.out.println("회원가입성공");
			return "redirect:/";
			
		}else {
			//실패
			return "redirect:/user/join.do"; 
		}

	
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	
	public String login(HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user"); 
		if(user != null) {
			return "redirect:/board/board.do";
		}
		return "login"; 
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String loginOk(@ModelAttribute UserVO vo, 
			HttpSession session) {

		UserVO user = repository.login(vo); 
		System.out.println(user.getId());
		System.out.println(user.getUserType());
		session.setAttribute("user", user);
		System.out.println("로그인완료");
		return "redirect:/";
	}
	
	@RequestMapping(value="/inforup.do", method=RequestMethod.POST)
	public String userModify(@ModelAttribute UserVO vo, 
			HttpSession session, @ModelAttribute ProfileVO pvo ) {
		
		return "inforup";
	}
	
	
	
/*	@RequestMapping(value="/inforup.do", method=RequestMethod.POST)
	public String userModifyOk(@ModelAttribute UserVO vo, 
			HttpSession session, @ModelAttribute ProfileVO pvo ) {

			int result =  repository.join(vo); 
			if(result > 0 ) {
			//성공
			repository.join_profile(pvo);
				System.out.println("회원정보 수정성공");
				return "redirect:/";
						}else {
				//실패
				return "redirect:/user/inforup.do"; 
			}
	}*/
	
	
	@ResponseBody
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public Map<String, String> idCheck(@RequestParam("id") String id) {
		
		int count = repository.idCheck(id); 
		
		
		//string 타입으로 키와 값을 저장한다. 꺼낼때 map.put이렇게 꺼내면 됨 (키, 밸류)데이터 구조
		Map<String, String> map = new HashMap<>();
		
		if(count > 0) {
			// 아이디 중복 값이 있다. 
			map.put("result", "failed"); 
		}else {
			// 아이디 중복 값이 없다. 
			map.put("result", "success"); 
		}
	
		return map; 
	}
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate(); 
		return "redirect:/"; 
	}
}
