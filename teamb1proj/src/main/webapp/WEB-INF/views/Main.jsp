<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css"> 	<!-- 이용가이드 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/Main.css"> 	<!-- Main.jsp -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>

<script>
	
	$(function(){
		
		
		/* 맛집 아이콘 */
		$(".box1").on("mouseenter",function(){
			$(".img_1").css("display","none");
		});
		
		$(".box1").on("mouseleave",function(){
			$(".img_1").css("display","inline");
		});
		
		
		/* 맛집 아이콘 */
		$(".box2").on("mouseenter",function(){
			$(".img_2").css("display","none");
		});
		
		$(".box2").on("mouseleave",function(){
			$(".img_2").css("display","inline");
		});
		
		
		/* 룰렛 아이콘 */
		$(".box3").on("mouseenter",function(){
			$(".img_3").css("display","none");
		});
		
		$(".box3").on("mouseleave",function(){
			$(".img_3").css("display","inline");
		});
		
		
		/* 문의사항 아이콘 */
		$(".box4").on("mouseenter",function(){
			$(".img_4").css("display","none");
		});
		
		$(".box4").on("mouseleave",function(){
			$(".img_4").css("display","inline");
		});
		
		
		/* 이용가이드 아이콘 */
		$(".box5").on("mouseenter",function(){
			$(".img_5").css("display","none");
		});
		
		$(".box5").on("mouseleave",function(){
			$(".img_5").css("display","inline");
		});
		
		
	})
	
</script>

<style>

/* 이용가이드 아이콘( 버튼 ) */
.btn-prima{
	color : black;
	background-color:transparent;
	border : 0px;
}

.btn-prima:hover{
	color : black;
	background : white;
	border-color : white;
}

.btn-prima:active {
	box-shadow : 0,0,0,0;
	border-color: white;
	background : white;
}

.btn:focus, .btn.focus {
    outline: none;
    box-shadow: 0 0 0 0;
}
 button:before {
	
	 position: absolute;
	 left: 0;
	 top: 0;
	 right: 0;
	 bottom: 0;
	 border-radius: 12px;
	 transform: translateZ(calc(var(--z-before) * 1px));
	 background: var(--background);
	 box-shadow: 0 4px 8px var(--shadow);
}

button{
	background : #6c757D;
	border-radius: 12px;
}


</style>
<body>


<div style="width: 2000px; margin: 0 auto;">

<!-- 큰 메뉴 아이콘 -->
<div id="Img">

	<a id="ImgDiv" style="background : #00277a; overflow : hidden;" href="#">
		<img src="resources/image/good_banner.png" style="object-fit : cover; width : 100%; height : 100%;">
	</a>
	
	<a id="ImgDiv" style="background : #8aafff; overflow : hidden;" href="#">
		<img src="resources/image/룰렛 배너.jpg" style="object-fit : cover; width : 100%; height : 100%;">
	</a>
	
	<a id="ImgDiv" style="background : #eab1ff; overflow : hidden;" href="#">
		<img src="resources/image/QnA_banner.jpg" style="object-fit : cover; width : 100%; height : 100%;">
	</a>

</div>

<!-- 메뉴 아이콘 -->
<div id="div" style="margin-bottom : 90px;">
	
	<div id="icon_div">
		<a class="box1" href="<c:url value='/good/list.do'/>" style="border: 4px solid #ff99ff;">
			<video id="icon_imgsp" class="img_1" src="resources/image/icon/맛집.mp4"></video>
			<video id="icon_img" src="resources/image/icon/맛집.mp4" autoplay="autoplay" loop muted></video>
		</a>
		<div style="font-family: 'Ownglyph_meetme-Rg';">
		맛집
		</div>
	</div>
	
	<div id="icon_div">
		<a class="box2" href="<c:url value='/recipe/list.do'/>" style="border: 4px solid #ffc799;">
			<video id="icon_imgsp" class="img_2" src="resources/image/icon/레시피.mp4"></video>
			<video id="icon_img" src="resources/image/icon/레시피.mp4" autoplay="autoplay" loop muted></video>
		</a>
		<div style="font-family: 'Ownglyph_meetme-Rg';">
		레시피
		</div>
	</div>
	
	<div id="icon_div">
		<a class="box3" href="#" style="border: 4px solid #50c900;">
			<video id="icon_imgsp" class="img_3" src="resources/image/icon/룰렛.mp4"></video>
			<video id="icon_img" src="resources/image/icon/룰렛.mp4" autoplay="autoplay" loop muted></video>
		</a>
		<div style="font-family: 'Ownglyph_meetme-Rg';">
		돌림판
		</div>
	</div>

	<div id="icon_div">
		<a class="box4" href="<c:url value='/ask/list.do'/>" style="border: 4px solid #ca6bff;">
			<video id="icon_imgsp" class="img_4" src="resources/image/icon/문의사항.mp4"></video>
			<video id="icon_img" src="resources/image/icon/문의사항.mp4" autoplay="autoplay" loop muted></video>
		</a>
		<div style="font-family: 'Ownglyph_meetme-Rg';">
		문의사항
	</div>
	
</div>
	
<div id="icon_div" style="position: relative; top: 5px;">
		<div class="box5" style="border: 4px solid #9295ff; cursor: pointer; margin-bottom: 0px;">
			<video id="icon_imgsp" class="img_5" src="resources/image/icon/이용가이드.mp4"></video>
			<video id="icon_img" src="resources/image/icon/이용가이드.mp4" autoplay="autoplay" loop muted></video>
		</div>
		<div id="wrapper" class="lm-wrapper clearfix">
            <aside class="lm-sidebar lm-sidebar-left">
                <div class="sidebar-unit login-buttons">
					<button type="button" class="btn btn-prima" data-toggle="modal" data-target="#exampleModalCenter3" id="button" style="font-family: 'Ownglyph_meetme-Rg'; font-size : 20px; padding-top : 0px;"> 이용가이드
					</button>
					<div class="modal fade" id="exampleModalCenter3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
    						<div class="modal-content">
    							  <div class="modal-header">
      									<h5 class="modal-title" id="title">신규 회원을 위한 그맛알 사용백서</h5>
       
      									<img src="https://www.revu.net/assets/img/membership/new-icon.png" width="40px" height="40px">
        
        								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
         								 	<span aria-hidden="true">&times;</span>
       									 </button>
      							  </div>
     							  <div class="modal-body">
          									 <form action="loginOk.jsp" method="post">
           										<div class="profile-top">
          											 <img src="https://www.revu.net/assets/img/guide/img-profile-m.png" width="300px" height="200px">
           										</div>
           											<div class="profile ng-scope">
           												<div class="profile-1 background">
                											<div class="content-title">
                												¹
                    											<span>🎈🎈프로필을 먼저 변경해 볼까요?</span>
                  											</div>
                    										<div class="content-desc">
                    											"마이페이지 홈에서 프로필 사진 아이콘을 클릭하여"<br>
                   												"나를 표현할수 있는 사진으로 변경해 보세요"
                    										</div>
                    										<div class="content-img">
                    											<img src="https://www.revu.net/assets/img/guide/img-profile-1-m.png" width="300px" height="200px">
                											</div>
                										</div>    
                											<div class="profile-2 background">
                  												<div class="content-title">              
                													<span>회원정보를 수정해 볼까요?</span>
                												</div>
                  													<div class="content-desc">
                  														"마이페이지 홈에서 회원정보 수정을 클릭하여"<br>
                   														"이메일, 핸드폰번호, 비밀번호 수정 할 수 있어요"
                    												</div>
                    											</div>
                    									</div>
 												</form>   
      								</div>
      								<div class="modal-footer">
       	 								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      								</div>
    							</div>
  							</div>
						</div>
					</div>
				</aside>
			</div>
		</div>
	</div>
<!-- 맛집 리스트 -->
<div id="good" style="text-align: left;">

	<!-- 맛집 리스트 제목 -->
	<div id="good_list">맛집 리스트</div>
	<a href="#" id="good_page">바로가기</a>

	<!-- 맛집 리스트 div -->
	<div id="good_div">
	
		
		<!-- 맛집 음식,제목 Div -->
		<a href="good_view.jsp" id="title_food">
			<!-- 맛집 음식 이미지 div -->
			<div id="good_div_img">
				<!-- 맛집 음식 이미지 -->
				<img id="food_img" src="resources/image/맛집1.png" >
			</div>
			<!-- 맛집 리스트 별점,제목 -->
			<div id="goodfd_div">
				<!-- 별점 -->
				<div id="star">5.0</div>
				<!-- 맛집 이름 -->
				<div id="good_title">맛집1</div>
			</div>
		</a>
		
		<!-- 맛집 음식,제목 Div -->
		<a href="#" id="title_food">
			<!-- 맛집 음식 이미지 div -->
			<div id="good_div_img">
				<!-- 맛집 음식 이미지 -->
				<img id="food_img" src="resources/image/음식2.jpg" >
			</div>
			<!-- 맛집 리스트 별점,제목 -->
			<div id="goodfd_div">
				<!-- 별점 -->
				<div id="star">4.0</div>
				<!-- 맛집 이름 -->
				<div id="good_title">맛집2</div>
			</div>
		</a>
		
		<!-- 맛집 음식,제목 Div -->
		<a href="#" id="title_food">
			<!-- 맛집 음식 이미지 div -->
			<div id="good_div_img">
				<!-- 맛집 음식 이미지 -->
				<img id="food_img" src="resources/image/음식3.jpg" >
			</div>
			<!-- 맛집 리스트 별점,제목 -->
			<div id="goodfd_div">
				<!-- 별점 -->
				<div id="star">5.0</div>
				<!-- 맛집 이름 -->
				<div id="good_title">맛집3</div>
			</div>
		</a>
		
		<!-- 맛집 음식,제목 Div -->
		<a href="#" id="title_food">
			<!-- 맛집 음식 이미지 div -->
			<div id="good_div_img">
				<!-- 맛집 음식 이미지 -->
				<img id="food_img" src="resources/image/음식4.jpg" >
			</div>
			<!-- 맛집 리스트 별점,제목 -->
			<div id="goodfd_div">
				<!-- 별점 -->
				<div id="star">5.0</div>
				<!-- 맛집 이름 -->
				<div id="good_title">맛집4</div>
			</div>
		</a>
		
		
		<!-- 맛집 음식,제목 Div -->
		<a href="#" id="title_food">
			<!-- 맛집 음식 이미지 div -->
			<div id="good_div_img">
				<!-- 맛집 음식 이미지 -->
				<img id="food_img" src="resources/image/음식5.jpg" >
			</div>
			<!-- 맛집 리스트 별점,제목 -->
			<div id="goodfd_div">
				<!-- 별점 -->
				<div id="star">4.0</div>
				<!-- 맛집 이름 -->
				<div id="good_title">맛집5</div>
			</div>
		</a>
		
		<!-- 맛집 음식,제목 Div -->
		<a href="#" id="title_food">
			<!-- 맛집 음식 이미지 div -->
			<div id="good_div_img">
				<!-- 맛집 음식 이미지 -->
				<img id="food_img" src="resources/image/음식6.jpg" >
			</div>
			<!-- 맛집 리스트 별점,제목 -->
			<div id="goodfd_div">
				<!-- 별점 -->
				<div id="star">5.0</div>
				<!-- 맛집 이름 -->
				<div id="good_title">맛집6</div>
			</div>
		</a>
		
		<!-- 맛집 음식,제목 Div -->
		<a href="#" id="title_food">
			<!-- 맛집 음식 이미지 div -->
			<div id="good_div_img">
				<!-- 맛집 음식 이미지 -->
				<img id="food_img" src="resources/image/음식7.jpg" >
			</div>
			<!-- 맛집 리스트 별점,제목 -->
			<div id="goodfd_div">
				<!-- 별점 -->
				<div id="star">4.0</div>
				<!-- 맛집 이름 -->
				<div id="good_title">맛집7</div>
			</div>
		</a>
		
		<!-- 맛집 음식,제목 Div -->
		<a href="#" id="title_food">
			<!-- 맛집 음식 이미지 div -->
			<div id="good_div_img">
				<!-- 맛집 음식 이미지 -->
				<img id="food_img" src="resources/image/음식8.jpg" >
			</div>
			<!-- 맛집 리스트 별점,제목 -->
			<div id="goodfd_div">
				<!-- 별점 -->
				<div id="star">5.0</div>
				<!-- 맛집 이름 -->
				<div id="good_title">맛집8</div>
			</div>
		</a>
		
	</div>
</div>


<!-- 레시피 리스트 -->
<div id="recipe" style="text-align: left; margin-top: 90px;">

	<!-- 레시피 리스트 제목 -->
	<div id="recipe_title">레시피 리스트</div>
	<div>
		<a href="recipe_list.jsp" id="recipe_page">바로가기</a>
	</div>
	
	<!-- 레시피 리스트 div -->
	<div id="recipe_div">
		
		<a href="recipe_view.jsp" style="display : inline-block; text-decoration: none;">
			<!-- 레시피 음식 이미지 div -->
			<div id="recipe_div_img">
				<!-- 레시피 음식 이미지 -->
				<img id="recipe_img" src="resources/image/레시피11.jpg" >
			</div>
			<div id="recipe_name">
			꽁치 추어탕
			</div>
		</a>
		
		<a href="#" style="display : inline-block; text-decoration: none;">
			<!-- 레시피 음식 이미지 div -->
			<div id="recipe_div_img">
				<!-- 레시피 음식 이미지 -->
				<img id="recipe_img" src="resources/image/레시피2.jpg" >
			</div>
			<div id="recipe_name">
			레시피2
			</div>
		</a>

		<a href="#" style="display : inline-block; text-decoration: none;">
			<!-- 레시피 음식 이미지 div -->
			<div id="recipe_div_img">
				<!-- 레시피 음식 이미지 -->
				<img id="recipe_img" src="resources/image/레시피3.jpg" >
			</div>
			<div id="recipe_name">
			레시피3
			</div>
		</a>
		
		<a href="#" style="display : inline-block; text-decoration: none;">
			<!-- 레시피 음식 이미지 div -->
			<div id="recipe_div_img">
				<!-- 레시피 음식 이미지 -->
				<img id="recipe_img" src="resources/image/레시피9.jpg" >
			</div>
			<div id="recipe_name">
			레시피4
			</div>
		</a>
		
		<a href="#" style="display : inline-block; text-decoration: none;">
			<!-- 레시피 음식 이미지 div -->
			<div id="recipe_div_img">
				<!-- 레시피 음식 이미지 -->
				<img id="recipe_img" src="resources/image/레시피8.jpg" >
			</div>
			<div id="recipe_name">
			레시피5
			</div>
		</a>
		
		<a href="#" style="display : inline-block; text-decoration: none;">
			<!-- 레시피 음식 이미지 div -->
			<div id="recipe_div_img">
				<!-- 레시피 음식 이미지 -->
				<img id="recipe_img" src="resources/image/레시피6.jpg" >
			</div>
			<div id="recipe_name">
			레시피6
			</div>
		</a>
		
		<a href="#" style="display : inline-block; text-decoration: none;">
			<!-- 레시피 음식 이미지 div -->
			<div id="recipe_div_img">
				<!-- 레시피 음식 이미지 -->
				<img id="recipe_img" src="resources/image/레시피7.jpg" >
			</div>
			<div id="recipe_name">
			레시피7
			</div>
		</a>
		
	</div>

</div>



<!-- 카테고리 리스트 -->
<div style="margin-bottom: 100px; text-align: left; margin-top: 180px; text-align: center;">

	<!-- 그맛알's 맛집 pick -->
	<div class="category_div" style="padding-right:120px;">
	
		<!-- 카테고리 제목 -->
		<div id="categori_title";>
			그맛알's 맛집 pick
		</div>
		
		<a href="good_view.jsp" class="category_a">
			<!-- 카테고리 이미지 div -->
			<div>
				<img class="crown" src="resources/image/왕관.png">
				<div id="categori_ImgDiv">
					<!-- 카테고리 이미지 -->
					<img id="categori_img" src="resources/image/맛집1.png" >
					<div class="ribbon"><span>P i c k</span></div>
				</div>
				<div class="category_title">맛집1</div>
			</div>
		</a>
		
		<a href="#" class="category_a">
			<!-- 카테고리 이미지 div -->
			<div>
				<img class="crown" src="resources/image/왕관.png">
				<div id="categori_ImgDiv">
					<!-- 카테고리 이미지 -->
					<img id="categori_img" src="resources/image/음식2.jpg" >
					<div class="ribbon"><span>P i c k</span></div>
				</div>
				<div class="category_title">맛집2</div>
			</div>
		</a>	
		
	</div>	
	
	
			
	<!-- 그맛알's 레시피 pick -->		
	<div class="category_div" style="margin-left:120px;">
		<!-- 카테고리 제목 -->
		<div id="categori_title";>
			그맛알's 레시피 pick
		</div>
		
		<a href="recipe_view.jsp" class="category_a">
			<!-- 카테고리 이미지 div -->
			<div style="display : inline-block">
				<img class="crown" src="resources/image/왕관.png">
				<div id="categori_ImgDiv">
					<!-- 카테고리 이미지 -->
					<img id="categori_img" src="resources/image/레시피11.jpg" >
					<div class="ribbon"><span>P i c k</span></div>
				</div>
				<div class="category_title">레시피1</div>
			</div>
		</a>
		
		<a href="#" class="category_a">
			<!-- 카테고리 이미지 div -->
			<div style="display : inline-block">
				<img class="crown" src="resources/image/왕관.png">
				<div id="categori_ImgDiv">
					<!-- 카테고리 이미지 -->
					<img id="categori_img" src="resources/image/레시피2.jpg" >
					<div class="ribbon"><span>P i c k</span></div>
				</div>
				<div class="category_title">레시피2</div>
			</div>
		</a>
		
	</div>			
			
	
	</div>

</div>

<!-- footer -->
<div id="footer" style=" margin-bottom: calc(-100vw + 50%); height : 150px; line-height: 150px; font-size : 25px;">
	footer
</div>


</body>


</html>