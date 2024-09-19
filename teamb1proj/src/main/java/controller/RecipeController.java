package controller;

import Repo.CodeRepository;
import Repo.RecipeFileRepository;
import Repo.RecipeRepository;
import Repo.UserRepository;
import VO.CodeVO;
import VO.RecipeFileVO;
import VO.RecipeVO;
import VO.UserVO;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping({"/recipe"})
public class RecipeController {
   @Autowired
   RecipeRepository rRepository;
   @Autowired
   RecipeFileRepository fRepository;
   @Autowired
   CodeRepository cRepository;
   @Autowired
   UserRepository uRepository;
   @Autowired
   ServletContext servletContext;

   @RequestMapping(
      value = {"/list.do"},
      method = {RequestMethod.GET}
   )
   public String list(Model model, RecipeVO recipevo) {
      List<RecipeVO> data = this.rRepository.getAllData();
      model.addAttribute("list", data);
      return "recipe_list";
   }

   @RequestMapping(
      value = {"/write.do"},
      method = {RequestMethod.GET}
   )
   public String write(HttpSession session) {
      return "recipe_write";
   }

   @RequestMapping(
      value = {"/view.do"},
      method = {RequestMethod.GET}
   )
   public String view(@RequestParam(name = "recipeNo",defaultValue = "0") int recipeNo, Model model) {
      RecipeVO recipevo = this.rRepository.selectOne(recipeNo);
      model.addAttribute("recipevo", recipevo);
      return "recipe_view";
   }

   @RequestMapping(
      value = {"/modify.do"},
      method = {RequestMethod.GET}
   )
   public String modify(@RequestParam(name = "recipeNo",defaultValue = "0") int recipeNo, Model model) {
      RecipeVO vo = this.rRepository.selectOne(recipeNo);
      model.addAttribute("vo", vo);
      return "recipe_modify";
   }

   @RequestMapping(
      value = {"/modify.do"},
      method = {RequestMethod.POST}
   )
   public String modifyOk(RecipeVO recipevo, @RequestParam("file") MultipartFile file) {
      int result = this.rRepository.updateOne(recipevo);
      String uploadDir = this.servletContext.getRealPath("/upload/");
      new File(uploadDir);
      if (!file.isEmpty()) {
         String originFileName = file.getOriginalFilename();
         String uniqueFileName = UUID.randomUUID().toString() + "." + this.getFileExtension(originFileName);
         String filePath = uploadDir + uniqueFileName;

         try {
            file.transferTo(new File(filePath));
            RecipeFileVO fileVo = new RecipeFileVO();
            fileVo.setRecipeNo(result);
            fileVo.setRecipeFileName(originFileName);
            fileVo.setRecipeFilePath("/upload/" + uniqueFileName);
            fileVo.setRecipeFileSize(String.valueOf(file.getSize()));
            fileVo.setRecipeFileType(file.getContentType());
            this.fRepository.update(fileVo);
         } catch (Exception var10) {
            var10.printStackTrace();
         }
      }

      return result > 0 ? "redirect:/recipe/view.do?recipeNo=" + recipevo.getRecipeNo() : "redirect:/recipe/list.do";
   }

   @RequestMapping(
      value = {"/write.do"},
      method = {RequestMethod.POST}
   )
   public String writeOk(RecipeVO recipevo, HttpSession session, @RequestParam("smallCode") int smallCode, @RequestParam("bigCode") int bigCode, @RequestParam("files") MultipartFile files) {
      UserVO user = (UserVO)session.getAttribute("user");
      recipevo.setId(user.getId());
      CodeVO codeVO = new CodeVO();
      codeVO.setBigCode(bigCode);
      codeVO.setSmallCode(smallCode);
      CodeVO existingCodeVO = this.cRepository.findByBigAndSmall(codeVO);
      if (existingCodeVO == null) {
         System.out.println("code 테이블에 자료를 삽입합니다.");
         this.cRepository.insertOne(codeVO);
         existingCodeVO = codeVO;
      }

      recipevo.setCodevo(existingCodeVO);
      this.rRepository.insertOne(recipevo);
      int result = recipevo.getRecipeNo();
      String uploadDir = this.servletContext.getRealPath("/upload/");
      File dir = new File(uploadDir);
      if (!dir.exists()) {
         dir.mkdirs();
      }

      if (!files.isEmpty()) {
         String originFileName = files.getOriginalFilename();
         String uniqueFileName = UUID.randomUUID().toString() + "." + this.getFileExtension(originFileName);
         String filePath = uploadDir + uniqueFileName;

         try {
            files.transferTo(new File(filePath));
            RecipeFileVO fileVo = new RecipeFileVO();
            fileVo.setRecipeNo(result);
            fileVo.setRecipeFileName(originFileName);
            fileVo.setRecipeFilePath("/upload/" + uniqueFileName);
            fileVo.setRecipeFileSize(String.valueOf(files.getSize()));
            fileVo.setRecipeFileType(files.getContentType());
            this.fRepository.insert(fileVo);
         } catch (Exception var16) {
            var16.printStackTrace();
         }
      }

      return result >= 1 ? "redirect:/recipe/view.do?recipeNo=" + recipevo.getRecipeNo() : "redirect:/recipe/list.do";
   }

   public String getFileExtension(String fileName) {
      int index = fileName.lastIndexOf(".");
      return index == -1 ? "" : fileName.substring(index + 1);
   }

   @ResponseBody
   @RequestMapping(
      value = {"/imageUploader"},
      method = {RequestMethod.POST}
   )
   public String smarteditorImageUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
      try {
         if (file.isEmpty()) {
            System.out.println("이미지 미등록");
            return "";
         } else {
            String filePath = this.servletContext.getRealPath("/upload/");
            File saveDir = new File(filePath);
            if (!saveDir.exists()) {
               saveDir.mkdir();
            }

            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String today = formatter.format(new Date());
            String rfileName = file.getOriginalFilename();
            String fileExt = file.getOriginalFilename().split("\\.")[1];
            String pFileName = file.getOriginalFilename().split("\\.")[0] + UUID.randomUUID() + "-" + today + "." + fileExt;
            File saveFile = new File(saveDir, pFileName);

            try {
               file.transferTo(saveFile);
            } catch (Exception var13) {
               var13.printStackTrace();
            }

            String sFileInfo = "";
            sFileInfo = sFileInfo + "&bNewLine=true";
            sFileInfo = sFileInfo + "&sFileName=" + rfileName;
            sFileInfo = sFileInfo + "&sFileURL=" + request.getContextPath() + "/upload/" + pFileName;
            System.out.println("이미지 등록");
            return sFileInfo;
         }
      } catch (Exception var14) {
         var14.printStackTrace();
         return "";
      }
   }

   @RequestMapping(
      value = {"/delete.do"},
      method = {RequestMethod.POST}
   )
   public String delete(@RequestParam("recipeNo") int recipeNo) {
      int result = this.rRepository.updateFlag(recipeNo);
      return result > 0 ? "redirect:/recipe/list.do" : "redirect:/recipe/list.do";
   }
}
