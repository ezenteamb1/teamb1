<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/head.jsp" %>


<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/recipe_list.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<body>
	
	<div class="tab_menu">
		
		</div>
		

	<div class="cont_area">
			<div class="cont" id="japan">
				<!-- <div id="recipe_tagtitle">
					일식
				</div> -->
				<div style="text-align: left; border-bottom: 4px solid #ededed;padding-bottom: 100px;" id="tab-section">
						<c:forEach items="${list}" var="vo">
								<!-- 레시피 -->
								<a href="<c:url value='/good/good_view.do?goodNo=${vo.goodNo}' />" style="text-decoration: none; color : black;">
									<div style="display: inline-block; margin-bottom : 30px; text-align: center; margin-left:10px; margin-right:10px;">
										<!-- 레시피 리스트 div -->
										<div id="recipeList_div">
											<!-- 레시피 리스트 이미지 -->
											<%-- <div>${vo}</div> --%>
											<img src="<c:url value='${vo.files[0].goodFilePath}' />" id="recipe_img">
										</div>
										<!-- 레시피 이름 -->
										<div id="recipe_title">${vo.goodTitle}</div>
									</div>
								</a>
						</c:forEach>
				<%-- 	
					</c:if> --%>
				</div>
			</div> 
			<div class="writea">
				<a href="<c:url value='/good/good_write.do'/>">작성하기</a>
			</div>	
	</div>
	
	
</body>

</html>