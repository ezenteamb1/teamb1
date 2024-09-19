package controller;

import java.io.File;
import java.util.UUID;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import Repo.CodeRepository;
import Repo.GoodFileRepository;
import Repo.GoodReplyRepository;
import Repo.GoodRepository;
import VO.CodeVO;
import VO.GoodFileVO;
import VO.GoodReplyVO;
import VO.GoodVO;
import VO.UserVO;



@Controller
@RequestMapping("/good")
public class GoodController {
	
	@Autowired
	GoodRepository goodRepository;
	
	@Autowired
	CodeRepository codeRepository;
	
	@Autowired
	GoodFileRepository goodFileRepository; 
	
	@Autowired
	GoodReplyRepository goodReplyRepository;
	
	@Autowired
	ServletContext servletContext;
	
//	@RequestMapping(value="/good_view.do", method=RequestMethod.GET)
//	public String good_view(@RequestParam(name="goodNo", defaultValue="0") int goodNo, 
//							Model model) {
//		
//		GoodVO goodVo = goodRepository.selectOne(goodNo); 
//		model.addAttribute("goodVo", goodVo); 
//		
//		return "good_view"; 
//	}
	
	/* 맛집 게시글, 댓글 상세보기  */
	@RequestMapping(value="/good_view.do", method=RequestMethod.GET)
	public String view(@RequestParam(name="goodNo", defaultValue="0") int goodNo,
			Model model, HttpSession session) {
		
		GoodVO vo = goodRepository.selectO(goodNo);
		model.addAttribute("vo", vo);
		
		return "good_view";
	}
	
	@RequestMapping(value="/good_write.do", method=RequestMethod.GET)
	public String good_write(GoodVO goodVo) {
		
		return "good_write"; 
	}
	
	@RequestMapping(value="/good_write.do", method=RequestMethod.POST)
	public String good_writeOk(@ModelAttribute GoodVO goodVo, HttpSession session, 
			@RequestParam("smallCode") int smallCode,
			@RequestParam("bigCode") int bigCode,
			@RequestParam("star") int star,
			@RequestParam("goodAddr") String goodAddr,
			@RequestParam("file") MultipartFile file
			) {
		
		UserVO user = (UserVO)session.getAttribute("user"); 
		
		goodVo.setId(user.getId());
		
		//codevo설정 
		CodeVO codeVO = new CodeVO(); 
		codeVO.setBigCode(bigCode);             // bigCode : 맛집=0으로 설정
		codeVO.setSmallCode(smallCode);         // smallCode : jsp에서 받아온 smallCode로 설정 

		//CodeVO가 code테이블에 존재하는지 확인 후 없으면 삽입 
		CodeVO existingCodeVO = codeRepository.findByBigAndSmall(codeVO);  
		if(existingCodeVO == null) {
			System.out.println("code 테이블에 자료를 삽입합니다");
			codeRepository.insertOne(codeVO);
			// 새로 삽입된 데이터의 pk를 받아와서
			// codeVO에 code_no를 넣습니다
			existingCodeVO = codeVO; 
			//codeVO.getCodeNo(); 
		}
		
		System.out.println("code  no : "+existingCodeVO.getCodeNo());
		
		goodVo.setCodevo(existingCodeVO);             // GoodVO에 codeVO설정
		
		goodVo.setStar(star);
		goodVo.setGoodAddr(goodAddr);
		
		//db에 저장 
		
		System.out.println(goodVo.toString());
		
		goodRepository.insertOne(goodVo);     //게시글 작성
		int result = goodVo.getGoodNo();      //작성한 게시글 번호 꺼내오기 	
		
		String uploadDir = servletContext.getRealPath("/upload/"); 
		File dir = new File(uploadDir); 
		
		if(!dir.exists()) {
			//업로드 파일이 없을때 
			dir.mkdirs();    //업로드 파일 생성 
		}
		
		if(!file.isEmpty()) {
			String originFileName = file.getOriginalFilename(); 
			String uniqueFileName = UUID.randomUUID().toString() + "." + getFileExtension(originFileName);
			String filePath = uploadDir + uniqueFileName; 
			try {
				file.transferTo(new File(filePath));   //파일 업로드
				GoodFileVO goodfileVo = new GoodFileVO(); 
				goodfileVo.setGoodNo(result);
				goodfileVo.setGoodFileName(originFileName);
				goodfileVo.setGoodFilePath("/upload/" + uniqueFileName);
				goodfileVo.setGoodFileSize(file.getSize()+"");
				goodfileVo.setGoodFileType(file.getContentType());
				goodFileRepository.insert(goodfileVo); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(result > 0) {
			//성공
			return "redirect:/good_view.do?goodNo="+goodVo.getGoodNo();
		}else {
			//실패
			return "redirect:/good_write.do"; 
		}
	}
	
	

	
	@RequestMapping(value="/View_Modify.do", method=RequestMethod.GET)
	public String good_modify(@RequestParam(name="goodNo", required=false, defaultValue="0") int goodNo,
			Model model) {
		
		GoodVO goodVo = goodRepository.selectOne(goodNo); 
		model.addAttribute("goodVo", goodVo); 
		System.out.println(servletContext.getRealPath("/upload/"));
		return "View_Modify"; 
	}
	
	@RequestMapping(value="/View_Modify.do", method=RequestMethod.POST)
	public String good_modifyOk(@ModelAttribute GoodVO goodVo, 
	                            @RequestParam("file") MultipartFile file, 
	                            HttpSession session) {
	    
	    System.out.println("Updating GoodVO: " + goodVo);
	    
	    // 업로드 디렉토리 설정
	    String uploadDir = servletContext.getRealPath("/upload/");
	    File dir = new File(uploadDir);
	    
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }
	    
	    if (!file.isEmpty()) {
	        String originFileName = file.getOriginalFilename();
	        String uniqueFileName = UUID.randomUUID().toString() + "." + getFileExtension(originFileName);
	        String filePath = uploadDir + uniqueFileName;
	        try {
	            file.transferTo(new File(filePath)); // 파일 업로드
	            
	            GoodFileVO goodfileVo = new GoodFileVO();
	            goodfileVo.setGoodNo(goodVo.getGoodNo());
	            goodfileVo.setGoodFileName(originFileName);
	            goodfileVo.setGoodFilePath("/upload/" + uniqueFileName);
	            goodfileVo.setGoodFileSize(file.getSize() + "");
	            goodfileVo.setGoodFileType(file.getContentType());
	            
	            // 기존 파일 정보가 있는지 확인하고 업데이트 또는 삽입
	            GoodFileVO existingFile = goodFileRepository.findByGoodNo(goodVo.getGoodNo());
	            if (existingFile != null) {
	                goodFileRepository.update(goodfileVo); // 업데이트
	            } else {
	                goodFileRepository.insert(goodfileVo); // 삽입
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    int result = goodRepository.update(goodVo); // GoodVO 업데이트
	    
	    if (result > 0) {
	        return "redirect:/good/good_view.do?goodNo=" + goodVo.getGoodNo();
	    } else {
	        return "redirect:/";
	    }
	}
	
	
//	@RequestMapping(value="/View_delete.do", method=RequestMethod.POST)
//	public String good_delete(@RequestParam("goodNo") int goodNo) {
//
//		int result = goodRepository.delete(goodNo); 
//		
//		if(result > 0) {
//			//삭제 성공
//			return "redirect:/";
//		}else {
//			//삭제 실패 
//			return "redirect:/good/good_view.do?goodNo="+goodNo; 
//		}
//	
//	}
	
	/* 맛집 게시글(상세페이지) 삭제 */
	@RequestMapping(value="/View_delete.do", method=RequestMethod.POST)
	public String Delete_Good_View(@RequestParam("goodNo") int goodNo) {
		
		int result = goodRepository.Good_view_delete(goodNo);
		if(result > 0) {
			return "Main";
		}else {
			return "Main";
		}
	}
	
	/* 댓글 작성 */
	@RequestMapping(value="/reply_write.do", method=RequestMethod.GET)
	public String Goodreply_write(GoodReplyVO vo, HttpSession session,
												  @RequestParam(name="goodNo")int goodNo) {
		
			UserVO user = (UserVO)session.getAttribute("user"); 
			
			int result = vo.getGoodNo();
			int GoodReplyNo = vo.getGoodReplyNo();
			int ProfileNo = vo.getProfileNo();
			String CreateDate = vo.getCreateDate();
			String GoodReplyContent = vo.getGoodReplyContent();
			String Id = user.getId();
			

			List<GoodReplyVO> replyList = new ArrayList<>();
			
			GoodReplyVO goodReplyVO = new GoodReplyVO();
			goodReplyVO.setCreateDate(CreateDate);
			goodReplyVO.setGoodNo(result);
			goodReplyVO.setGoodReplyContent(GoodReplyContent);
			goodReplyVO.setGoodReplyNo(GoodReplyNo);
			goodReplyVO.setId(Id);
			goodReplyVO.setProfileNo(ProfileNo);
			
			replyList.add(goodReplyVO);
			
			System.out.println(GoodReplyContent);
			System.out.println(Id);
			System.out.println(result);
			
			goodReplyRepository.insert(replyList);
			
			return "redirect:/post.do?goodNo="+vo.getGoodNo();
			
	}
	
	/* 댓글 수정 */
	@RequestMapping(value="/reply_modify.do", method=RequestMethod.GET)
	public String ModifyReply(GoodReplyVO vo,@RequestParam("goodNo") int goodNo) {
		
		int result = goodReplyRepository.reply_update(vo);
		if(result > 0) {
			return "redirect:/post.do?goodNo="+goodNo;
		}else {
			return "redirect:/post.do?goodNo="+goodNo;
		}
	}
	
	/* 댓글 삭제 */
	@RequestMapping(value="/reply_delete.do", method=RequestMethod.POST)
	public String DeleteReply(@RequestParam("goodReplyNo") int goodReplyNo,
							  @RequestParam("goodNo") int goodNo) {
		
		int result = goodReplyRepository.reply_delete(goodReplyNo);
		if(result > 0) {
			return "redirect:/post.do?goodNo="+goodNo;
		}else {
			return "redirect:/post.do?goodNo="+goodNo;
		}
	}
	
	
	public String getFileExtension(String fileName) {
		int index = fileName.lastIndexOf("."); 
		
		if(index == -1) {
			return ""; 
		}
		
		return fileName.substring(index + 1); 
	}
}
