<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/head.jsp" %>


<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/recipe_list.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<body>
	
	<div class="tab_menu">
		<!-- 레시피 리스트 div -->
<%-- 		<div style="text-align: center; width : 1200px; margin-left: auto; margin-right: auto ">
			<!-- 음식 ul 태그 -->
			<ul id="recipe_tagUl" class="list">
			
				<!-- 음식 li 태그 -->
				<li id="recipe_tagLi" class="is_on">
					<a href="#japan" class="btn" data-category="japan" data-codeNo="8">
						<img class="food_img" src="<c:url value='/resources/image/recipe_tag/japan.png'/>" alt="일식">
						<label id="tag_title">일식</label>
					</a>
				</li>
				
				<li id="recipe_tagLi">
					<a href="#korea" class="btn" data-category="korea" data-codeNo="7">
						<img class="food_img" src="<c:url value='/resources/image/recipe_tag/한식.png'/>" alt="한식">
						<label id="tag_title">한식</label>
					</a>
				</li>
			
			<!-- style=" filter:grayscale(0%); color:#fc7405; border: 1px solid #fc7405;" -->
				<li id="recipe_tagLi" >
					<a href="#west"class="btn" data-category="west" data-codeNo="10">
						<img class="food_img" src="<c:url value='/resources/image/recipe_tag/양식.png'/>" alt="양식">
						<label id="tag_title">양식</label>
					</a>
				</li>
				
				<li id="recipe_tagLi">
					<a href="#china" class="btn" data-category="china" data-codeNo="9">
						<img class="food_img" src="<c:url value='/resources/image/recipe_tag/중식.png'/>" alt="중식">
						<label id="tag_title">중식</label>
					</a>
				</li>
				
			
				<li id="recipe_tagLi">
					<a href="#dessert" class="btn" data-category="dessert" data-codeNo="11">
						<img class="food_img" src="<c:url value='/resources/image/recipe_tag/dessert.png'/>" alt="후식">
						<label id="tag_title">후식</label>
					</a>
				</li>
				
			</ul --%>
		</div>
		

	<div class="cont_area">
			<div class="cont" id="japan">
				<!-- <div id="recipe_tagtitle">
					일식
				</div> -->
				<div style="text-align: left; border-bottom: 4px solid #ededed;padding-bottom: 100px;" id="tab-section">
						<c:forEach items="${list}" var="vo">
								<!-- 레시피 -->
								<a href="<c:url value='/recipe/view.do?recipeNo=${vo.recipeNo}' />" style="text-decoration: none; color : black;">
									<div style="display: inline-block; margin-bottom : 30px; text-align: center; margin-left:10px; margin-right:10px;">
										<!-- 레시피 리스트 div -->
										<div id="recipeList_div">
											<!-- 레시피 리스트 이미지 -->
											<img src="<c:url value='${vo.recipeFile.recipeFilePath}' />" id="recipe_img">
										</div>
										<!-- 레시피 이름 -->
										<div id="recipe_title">${vo.recipeTitle}</div>
									</div>
								</a>
						</c:forEach>
				<%-- 	
					</c:if> --%>
				</div>
			</div> 
			<div class="writea">
				<a href="<c:url value='/recipe/write.do'/>">작성하기</a>
			</div>	
			
	<%-- 		<div class="cont" id="korea">
				<div id="recipe_tagtitle">
					한식
				</div>
				<div style="text-align: left; border-bottom: 4px solid #ededed; padding-bottom: 100px;" id="tab-section">
					<c:if test="${list.codeNo eq 7}">
						<c:forEach items="${list}" var="vo">
								<!-- 레시피 -->
								<a href="<c:url value='/recipe/view.do?recipeNo=${vo.recipeNo}' />" style="text-decoration: none; color : black;">
									<div style="display: inline-block; margin-bottom : 30px; text-align: center; margin-left:10px; margin-right:10px;">
										<!-- 레시피 리스트 div -->
										<div id="recipeList_div">
											<!-- 레시피 리스트 이미지 -->
											<img src="<c:url value='${vo.recipeFile.recipeFilePath}' />" id="recipe_img">
										</div>
										<!-- 레시피 이름 -->
										<div id="recipe_title">${vo.recipeTitle}</div>
									</div>
								</a>
						</c:forEach>					
					</c:if>
				</div>
			</div>
			
			<div class="cont" id="west">
				<div id="recipe_tagtitle">
					양식
				</div>
				<div style="text-align: left; border-bottom: 4px solid #ededed; padding-bottom: 100px;" id="tab-section">
					<c:if test="${list.codeNo eq 10}">
						<c:forEach items="${list}" var="vo">
								<!-- 레시피 -->
								<a href="<c:url value='/recipe/view.do?recipeNo=${vo.recipeNo}' />" style="text-decoration: none; color : black;">
									<div style="display: inline-block; margin-bottom : 30px; text-align: center; margin-left:10px; margin-right:10px;">
										<!-- 레시피 리스트 div -->
										<div id="recipeList_div">
											<!-- 레시피 리스트 이미지 -->
											<img src="<c:url value='${vo.recipeFile.recipeFilePath}' />" id="recipe_img">
										</div>
										<!-- 레시피 이름 -->
										<div id="recipe_title">${vo.recipeTitle}</div>
									</div>
								</a>
						</c:forEach>
					</c:if>
				</div>
			</div>
			
			<div class="cont" id="china">
				<div id="recipe_tagtitle">
					중식
				</div>
				<div style="text-align: left; border-bottom: 4px solid #ededed; padding-bottom: 100px;" id="tab-section">
				<c:if test="${list.codeNo eq 9}">
					<c:forEach items="${list}" var="vo">
							<!-- 레시피 -->
							<a href="<c:url value='/recipe/view.do?recipeNo=${vo.recipeNo}' />" style="text-decoration: none; color : black;">
								<div style="display: inline-block; margin-bottom : 30px; text-align: center; margin-left:10px; margin-right:10px;">
									<!-- 레시피 리스트 div -->
									<div id="recipeList_div">
										<!-- 레시피 리스트 이미지 -->
										<img src="<c:url value='${vo.recipeFile.recipeFilePath}' />" id="recipe_img">
									</div>
									<!-- 레시피 이름 -->
									<div id="recipe_title">${vo.recipeTitle}</div>
								</div>
							</a>
					</c:forEach>
				</c:if>
				</div>
			</div>
			
			<div class="cont" id="dessert">
				<div id="recipe_tagtitle">
					후식
				</div>
				<div style="text-align: left; border-bottom: 4px solid #ededed; padding-bottom: 100px;" id="tab-section">
					<c:if test="${list.codeNo eq 11}">
					<c:forEach items="${list}" var="vo">
							<!-- 레시피 -->
							<a href="<c:url value='/recipe/view.do?recipeNo=${vo.recipeNo}' />" style="text-decoration: none; color : black;">
								<div style="display: inline-block; margin-bottom : 30px; text-align: center; margin-left:10px; margin-right:10px;">
									<!-- 레시피 리스트 div -->
									<div id="recipeList_div">
										<!-- 레시피 리스트 이미지 -->
										<img src="<c:url value='${vo.recipeFile.recipeFilePath}' />" id="recipe_img">
									</div>
									<!-- 레시피 이름 -->
									<div id="recipe_title">${vo.recipeTitle}</div>
								</div>
							</a>
					</c:forEach>
					</c:if>
				</div>
			</div> --%>
			
	</div>
	
	
</body>

</html>