<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/head.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/recipe_view.css">

<style>
    .recipe {
        text-align: center;
        display: inline-block;
        margin: 10px;
    }
    .recipe img {
        width: 200px;
        height: 200px;
    }
    .recipe label {
        display: block;
        margin-top: 10px;
    }
    .reply_back button {
    	border: 1px solid #791079;
    	background: white;
    	display: inline-block;
    	color: black;
    	text-align: center;
    	margin: 10px auto;
	    padding: 2px 10px;
	    border-radius: 6px;
    }
    .btns {
    	display: flex;
    	justify-content: flex-end;
    	gap: 10px;
    }
    .btns button {
    	border: 1px solid #791079;
    	background: white;
    	display: inline-block;
    	color: black;
    	text-align: center;
	    padding: 2px 10px;
	    border-radius: 6px;
    }
    form {
    	display: inline-block;
    }
</style>

<body>
	<div id="writer">
			누구의 레시피? <br><br> 
			<span>${recipevo.id}</span>님의 소중한 레시피입니다.
			<c:if test="${sessionScope.user.id eq recipevo.id}">
				<div class="btns">
					<button type="button" onclick="location.href='<c:url value="/recipe/modify.do?recipeNo=${recipevo.recipeNo}" />'">수정하기</button>
					<form action="delete.do" method="post">
						<input type="hidden" name="recipeNo" value="${recipevo.recipeNo}">
						<button type="submit">삭제하기</button>
					</form>
				</div>			
			</c:if>
	</div>
	<div id="recipe_div">
		<div style="display:inline-block; float : left;">
			<img src="<c:url value='${recipevo.recipeFile.recipeFilePath}'/>" id="recipe_img">
		</div>
		<div id="recipe_nameStuff">
			<div id="recipe_title">
				<!-- 레시피 이름 -->
				<p class="recipe_name">${recipevo.recipeTitle}</p>
			</div>
			<div id="recipe_stuff">
				<div id="stuff">재료</div>
				<div id="second_stuff">필수재료</div>
				<p>${recipevo.mustIngre}</p>
			 	<div id="second_stuff">선택재료</div>
			 	<p>${recipevo.choiceIngre}</p>
			 	<div id="second_stuff">양념장</div>
			   	<p>${recipevo.jang}</p>
			</div>
		</div>
	</div>
		
	
	<div id="recipe_body">
		<div id="smarteditor">
			${recipevo.smart }
		</div>		
	</div>
	
	<!-- 댓글  -->
	
	<div class="reply_body">
		
		<!-- 댓글 작성란,작성버튼 -->
		<div style="margin-left : 105px; margin-bottom: 70px;">
			<input class="recipe_reply" type="text">
			<input class="reply_button" type="button" value="등록">
		</div>
		
		<!-- 댓글 -->
		
			 
			<!-- 댓글 내용 -->
		 <c:forEach items="${recipevo.recipereplyvo }" var="rvo" varStatus="status">
  			
		
			<div class="reply_back">	
				<!-- 댓글 프로필,유저 이름 -->
				<div style="padding-bottom: 20px; border-bottom: 3px solid #e8e8e8;">
					<div style="display: inline-block;">
					<img src="<c:url value='/resources/image/reply/프로필.png'/>" style="width :70px;">
				</div>
					<div style="display: inline-block;">
						
					
					</div>
					<div class="user_name">${recipevo.id}</div>
				</div>
				
				<!-- 댓글 내용 -->
				<div style="padding: 20px;">
					<div class="comment">${rvo.recipeReplyContent}</div>
				</div>
				<button onclick="updateFn(${rvo.recipeReplyNo},this)">수정</button>
				<button onclick="deleteFn(${rvo.recipeReplyNo},this)">삭제</button>
				<button onclick="cancleFn(${rvo.recipeReplyNo},this)">취소</button>
				<button onclick="clearFn(${rvo.recipeReplyNo},this)">완료</button>
			</div>
		
		 
		</c:forEach>  
	
		</div>
			 
	
	
</body>

<script>	
	let id="${sessionScope.user.id}"
		$(".reply_button").on("click",function(){
			let comment=$(".recipe_reply");
			let recipeNo="${recipevo.recipeNo}"
			if(comment.val().trim()==""){
				alert("댓글 내용을 입력해 주세요");
				return;
			}			
		$.ajax({
			url :"<c:url value='/recipereply/write.do'/>",
			type:"post",
			data:{
				"comment":comment.val(),"recipeNo":recipeNo
			},
			success:function(data){
				if(data.result=="success"){
					let key = data.key;
					console.log("댓글 등록");
					let element ='';
					element +='<div class="reply_back">';
					element +=id;
					element +='<div style="padding-bottom: 20px; border-bottom: 3px solid #e8e8e8;">';
					element +='<div style="display: inline-block;">';
					element +='<img src="<c:url value='/resources/image/reply/프로필.png'	/>" style="width :70px;">';
					element +='</div>';
					element +='</div>';
					
					element +='<div style="padding: 20px;">';
					element +=comment.val();
					element +='</div>';
					element +='<button onclick="updateFn('+key+', this)">수정</button>';
					element +='<button onclick="deleteFn('+key+', this)">삭제</button>';
					element +='<button onclick="cancleFn('+key+', this)">취소</button>';
					element +='<button onclick="clearFn('+key+', this)">완료</button>';
					$(".reply_body").append(element);
						
					
					
					
				}else{
					console.log("댓글 등록 실패");
				}
			}
		})
	})
	
	let origin=[];
	function updateFn(key,obj){
 	
		
		let objj=$(obj).prev()
		let recipeReplyContent=objj[0].innerText
		
		origin.push({"key" : key, "value" : recipeReplyContent})
		
		//배열 키값 기준 중복 제거
		
		console.log(origin)
		
		console.log(objj);
		objj.attr("contenteditable","true");
		
		objj.focus();
		let recipeReplyNo = key
		console.log(recipeReplyNo);
		
	
	}

	function clearFn(key,obj){
		
		let objj=$(obj).prev().prev().prev().prev();
		console.log(objj[0].innerText);
		let recipeReplyContent=objj[0].innerText
		objj.attr("contenteditable","false");
		if(recipeReplyContent.trim() ==''){
			alert("수정 내용을 입력하세요");
			return;
		}
		$.ajax({
			type:"post",
			url:"<c:url value='/recipereply/update.do'/>",
			data:{
				"recipeReplyContent":recipeReplyContent,"recipeReplyNo":key
			},
			
			success:function(data){
				if(data.result=="success"){
					console.log("댓글 수정  완료")
				}else{
					console.log("댓글 수정 실패")
				}
			}
		});
	}

	function deleteFn(key,obj){
		let parentdiv=$(obj).parent();
		
		$.ajax({
			type:"post",
			url:"<c:url value='/recipereply/delete.do'/>",
			data:{"recipeReplyNo":key},
			
			success:function(data){
				if(data.result=="success"){
					
					console.log("댓글 삭제  완료")
					parentdiv.remove();
				}else{
					console.log("댓글 삭제 실패")
				}
			}
		});
	
	
	} ;

	
	 function cancleFn(key,obj){
		let index;
		let objj=$(obj).prev().prev().prev();
		
		for(let i=0; i<origin.length; i++){
			console.log(origin[i].key)
			console.log(key)
			if(origin[i].key == key){
				console.log(origin[i].value)
				index = i;
				objj[0].innerText = origin[i].value
			}
		}
		
		origin.splice(index, 1);
		objj.attr("contenteditable","false");
	}
	
	</script>	
</html>