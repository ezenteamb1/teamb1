<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<!-- custom css -->
		<link rel="stylesheet" href='<c:url value="/resources/css/recipe_write.css" />'>
		<!-- icon css -->
		<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
		<!-- smart editor -->
		<script type="text/javascript" src="<c:url value='/resources/smarteditor2/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
	    <!-- Google Font -->
	    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
		<!-- font awesome cdn -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
		<!-- jQuery -->
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<!-- bootstrap cdn -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<form action="write.do" method="post" id="frm" enctype="multipart/form-data">
			<div id="recipe_div">
				  <div class="contents">
				    <div class="upload-box">
				      <div id="drop-file" class="drag-file">
				        <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" >
				        <p class="message">Drag files to upload</p> 
				        <img src="" alt="미리보기 이미지" class="preview">
				      </div>
				      <label class="file-label" for="chooseFile">Choose File</label>
				      <input class="file" id="chooseFile" name="files" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif">
				    </div>
				  </div>
				<div id="recipe_nameStuff">
					<div id="recipe_title">
						<!-- 레시피 이름 -->
						<p class="recipe_name"><input type="text" id="recipeTitle" name="recipeTitle" placeholder="음식 이름을 입력하세요"></p>
					</div>
					<div id="recipe_stuff">
						<div id="stuff">재료</div>
						<div id="second_stuff">필수재료</div>
						<p><input type="text" name="mustIngre" placeholder="재료를 입력하세요" id="mustIngre"></p>
						
					 	<div id="second_stuff">선택재료</div>
					 	<p><input type="text" name="choiceIngre" placeholder="재료를 입력하세요" id="choiceIngre"></p>
						
					 	<div id="second_stuff">양념장</div>
					   	<p><input type="text" name="jang" placeholder="재료를 입력하세요" id="jang"></p>
					</div>
					<div class="checkparts">
						<div id="parts-title">
							카테고리
						</div>
						<div id="parts">
					        <div class="tile">
					            <input type="checkbox" name="smallCode" value="0" id="part1">
					            <label for="part1">
					                <span>양식</span>
					            </label>
					        </div>
					        <div class="tile">
					            <input type="checkbox" name="smallCode" value="1" id="part2">
					            <label for="part2">
					                <span>중식</span>
					            </label>
					        </div>
					        <div class="tile">
					            <input type="checkbox" name="smallCode" value="2" id="part3">
					            <label for="part3">
					                <span>한식</span>
					            </label>
					        </div>
					        <div class="tile">
					            <input type="checkbox" name="smallCode" value="3" id="part4">
					            <label for="part4">
					                <span>일식</span>
					            </label>
					        </div>
					        <div class="tile">
					            <input type="checkbox" name="smallCode" value="4" id="part5">
					            <label for="part5">
					                <span>후식</span>
					            </label>
					        </div>
					    </div>
					    
					    <input type="hidden" id="bigCode" name="bigCode" value="1">
				    </div> 
				</div>
			</div>
				
			<div id="recipe_body">
				​​​​​​​​<div id="smarteditor">
					​​​​​​​​​​​​<textarea name="smart" id="smart" rows="20" cols="150"></textarea>
				​​​​​​​​</div>
				<div id="form-btns">
					<button type="submit" class="btn btn-primary" id="submit">등록</button>
	       			<button type="button" class="btn btn-secondary" onclick="location.href='<c:url value="/recipe/list.do" />'">취소</button>				
				</div>
			</div> 
		</form>
	</body>
	<script type="text/javascript">
		/* 이미지 업로드 */
	   function DropFile(dropAreaId, fileListId) {
		  let dropArea = document.getElementById(dropAreaId);
		  let fileList = document.getElementById(fileListId);
		
		  function preventDefaults(e) {
		    e.preventDefault();
		    e.stopPropagation();
		  }
		
		  function highlight(e) {
		    preventDefaults(e);
		    dropArea.classList.add("highlight");
		  }
		
		  function unhighlight(e) {
		    preventDefaults(e);
		    dropArea.classList.remove("highlight");
		  }
		
		  function handleDrop(e) {
		    unhighlight(e);
		    let dt = e.dataTransfer;
		    let files = dt.files;
		
		    handleFiles(files);
		
		    const fileList = document.getElementById(fileListId);
		    if (fileList) {
		      fileList.scrollTo({ top: fileList.scrollHeight });
		    }
		  }
		
		  function handleFiles(files) {
		    files = [...files];
		    //files.forEach(uploadFile);
		    files.forEach(previewFile);
		  }
		
		  function previewFile(file) {
		    console.log(file);
		    renderFile(file);
		  }
		
		  function renderFile(file) {
		    let reader = new FileReader();
		    reader.readAsDataURL(file);
		    reader.onloadend = function () {
		      let img = dropArea.getElementsByClassName("preview")[0];
		      img.src = reader.result;
		      img.style.display = "block";
		    };
		  }
		
		  dropArea.addEventListener("dragenter", highlight, false);
		  dropArea.addEventListener("dragover", highlight, false);
		  dropArea.addEventListener("dragleave", unhighlight, false);
		  dropArea.addEventListener("drop", handleDrop, false);
		
		  return {
		    handleFiles
		  };
		}

		const dropFile = new DropFile("drop-file", "files");
		
		/* 카테고리 선택 */
		$(document).on('click', "input[type='checkbox']", function(){
		    if(this.checked) {
		        const checkboxes = $("input[type='checkbox']");
		        for(let ind = 0; ind < checkboxes.length; ind++){
		            checkboxes[ind].checked = false;
		        }
		        this.checked = true;
		    } else {
		        this.checked = false;
		    }
		});
	
	
		/* 스마트 에디터 */ 
		$(function(){
            var obj = [];
            nhn.husky.EZCreator.createInIFrame({
                oAppRef: obj,
                elPlaceHolder: "smart", 
                sSkinURI: "<c:url value='/resources/smarteditor2/SmartEditor2Skin.html'/>",  
                htParams : {
                    bUseToolbar : true,
                    bUseVerticalResizer : true,
                    bUseModeChanger : true,
                },
                fCreator: "createSEditor2"
            });
            function pasteHTML(filepath) {
                var sHTML = '';
                oEditors.getById["smart"].exec("PASTE_HTML", [sHTML]);
            }
            //전송버튼
            $("#submit").click(function(){
                obj.getById["smart"].exec("UPDATE_CONTENTS_FIELD", []);
                
                var title = $("#recipeTitle");
                if(title.val().trim() == ""){
                    alert('제목을 입력하세요');
                    title.focus();
                    return;
                }
                
                var must = $("#mustIngre");
                if(must.val().trim() == ""){
                    alert('필수 재료를 입력하세요');
                    must.focus();
                    return;
                }
                
                var sHTML = oEditors.getById["smart"].getIR();
                if( smart == ""  || smart == null || smart == ' ' || smart == '')  {
                     alert("내용을 입력하세요.");
                     oEditors.getById["smart"].exec("FOCUS");
                     return;
                }

                $("#frm").submit();
            });
        });
		
	</script>
	
</html>