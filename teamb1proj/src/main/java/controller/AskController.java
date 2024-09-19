package controller;

import Repo.AskRepository;
import VO.AskVO;
import VO.UserVO;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping({"/ask"})
public class AskController {
   @Autowired
   AskRepository aRepository;

   @RequestMapping(
      value = {"/list.do"},
      method = {RequestMethod.GET}
   )
   public String list(Model model, HttpSession session, AskVO askvo) {
      UserVO user = (UserVO)session.getAttribute("user");
      askvo.setId(user.getId());
      List<AskVO> list = this.aRepository.getAllData(askvo.getId());
      model.addAttribute("list", list);
      return "ask";
   }

   @RequestMapping(
      value = {"/write.do"},
      method = {RequestMethod.GET}
   )
   public String write() {
      return "askWrite";
   }

   @RequestMapping(
      value = {"/write.do"},
      method = {RequestMethod.POST}
   )
   public String writeOk(AskVO askvo, HttpSession session) {
      UserVO user = (UserVO)session.getAttribute("user");
      askvo.setId(user.getId());
      this.aRepository.insertOne(askvo);
      int result = askvo.getAskNo();
      return result >= 1 ? "redirect:/ask/view.do?askNo=" + askvo.getAskNo() : "redirect:/ask/list.do";
   }

   @RequestMapping(
      value = {"/view.do"},
      method = {RequestMethod.GET}
   )
   public String view(@RequestParam(name = "askNo",defaultValue = "0") int askNo, Model model) {
      AskVO askvo = this.aRepository.selectOne(askNo);
      model.addAttribute("askvo", askvo);
      return "askView";
   }

   @RequestMapping(
      value = {"/ad.do"},
      method = {RequestMethod.GET}
   )
   public String admin(@RequestParam(name = "askNo",defaultValue = "0") int askNo, Model model, HttpSession session) {
      UserVO user = (UserVO)session.getAttribute("user");
      if (user.getUserType() == 1) {
         AskVO askvo = this.aRepository.selectOne(askNo);
         model.addAttribute("askvo", askvo);
         return "adminAsk";
      } else {
         return "redirect:/";
      }
   }

   @RequestMapping(
      value = {"/ad.do"},
      method = {RequestMethod.POST}
   )
   public String adminOk(AskVO askvo, HttpSession session, Model model) {
      UserVO user = (UserVO)session.getAttribute("user");
      if (user.getUserType() == 1) {
         int result = this.aRepository.reply(askvo);
         System.out.println(askvo.getAskReply());
         System.out.println(askvo.getAskReplyDate());
         System.out.println(askvo.getAskNo());
         System.out.println(result);
         return result > 0 ? "redirect:/ask/view.do?askNo=" + askvo.getAskNo() : "redirect:/ask/list.do";
      } else {
         return "redirect:/";
      }
   }
}
