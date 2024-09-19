<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<!-- jQuery -->
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	    <div class="container" style="width: 75%; margin: 50px auto;">
	      <div class="title" style="padding: .75rem; margin: 20px 0px; border: 3px solid #eeeeee; border-top-left-radius: .75rem; border-top-right-radius: .75rem;"> 
	        <h2>문의사항</h2>
	      </div>
	      
	      <form action="write.do" method="post">
	        <select name="askCate" class="form-select" aria-label="Default select example">
	          <option value="" selected>문의 카테고리 선택</option>
	          <option value="1">맛집 게시판</option>
	          <option value="2">레시피 게시판</option>
	          <option value="3">기타</option>
	        </select>
	        <div class="form-floating" style="margin: 30px auto 0px;">
	          <input type="text" name="askTitle" class="form-control" id="floatingTitle" placeholder="제목을 입력하세요">
	          <label for="floatingTitle">문의 제목</label>
	        </div>
	        <div class="form-floating" style="margin: 20px auto;">
	          <textarea class="form-control" name="askContent" placeholder="내용을 입력하세요" id="floatingTextarea2" style="height: 100px"></textarea>
	          <label for="floatingTextarea2">문의 내용</label>
	        </div>
	        <button type="submit" class="btn btn-primary btn-sm">제출</button>
	        <button type="button" class="btn btn-secondary btn-sm" onclick="history.back()">취소</button>
	      </form>
	      
	    </div>
	</body>
	<script>
	$("form").submit(function() {
		let title = $("#floatingTitle");
		let content = $("#floatingTextarea2");
		let select = $(".form-select");
		
		if(title.val().trim() == "") {
			alert("제목은 필수 입력 항목입니다.");
			title.focus();
			return false;
		}
		
		if(content.val().trim() == "") {
			alert("본문은 필수 입력 항목입니다.");
			content.focus();
			return false;
		}
		
		if(select.val().trim() == "") {
			alert("카테고리는 필수 선택 항목입니다.");
			return false;
		}
		
		return true;
	});
	</script>
</html>