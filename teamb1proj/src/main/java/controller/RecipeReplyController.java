package controller;

import Repo.RecipeReplyRepository;
import VO.RecipeReplyVO;
import VO.RecipeVO;
import VO.UserVO;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/recipereply"})
public class RecipeReplyController {
   @Autowired
   RecipeReplyRepository repository;

   @RequestMapping(
      value = {"/view.do"},
      method = {RequestMethod.GET}
   )
   public String view(Model model) {
      RecipeVO vo = new RecipeVO();
      model.addAttribute("vo", vo);
      return "recipe_view";
   }

   @RequestMapping(
      value = {"/write.do"},
      method = {RequestMethod.GET}
   )
   public String write(HttpSession session) {
      return "write";
   }

   @ResponseBody
   @RequestMapping(
      value = {"/write.do"},
      method = {RequestMethod.POST}
   )
   public Map<String, Object> writeOK(@RequestParam("comment") String comment, @RequestParam("recipeNo") int recipeno, HttpSession session) {
      UserVO user = (UserVO)session.getAttribute("user");
      RecipeReplyVO vo = new RecipeReplyVO();
      vo.setRecipeReplyContent(comment);
      vo.setId(user.getId());
      vo.setRecipeNo(recipeno);
      int count = this.repository.insert(vo);
      Map<String, Object> map = new HashMap();
      if (count > 0) {
         map.put("result", "success");
         map.put("key", vo.getRecipeReplyNo());
      } else {
         map.put("result", "falied");
      }

      return map;
   }

   @ResponseBody
   @RequestMapping(
      value = {"/update.do"},
      method = {RequestMethod.POST}
   )
   public Map<String, Object> updateOk(RecipeReplyVO vo) {
      int result = this.repository.update(vo);
      Map<String, Object> map = new HashMap();
      if (result > 0) {
         map.put("result", "success");
      } else {
         map.put("result", "falied");
      }

      return map;
   }

   @ResponseBody
   @RequestMapping(
      value = {"/delete.do"},
      method = {RequestMethod.POST}
   )
   public Map<String, Object> delete(@RequestParam("recipeReplyNo") int recipeReplyNo) {
      int result = this.repository.delete(recipeReplyNo);
      Map<String, Object> map = new HashMap();
      if (result > 0) {
         map.put("result", "success");
      } else {
         map.put("result", "falied");
      }

      return map;
   }
}
