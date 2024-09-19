<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/good_view.css">

</head>


<script>
	console.log(${vo.goodNo})
	
 	window.onload=function(){
		if(${vo.deleteFlag} == 1){
			alert("비활성화 게시글");
			window.history.back();
		}
	} 
	

</script>


<body>
		
	
	<div id="good_back">
		
		<!-- 맛집 제목,별점 -->
		<div id="ghead">
			<div id="good_imgDiv" style="display : inline-block; margin-right : 20px;">
					<img class="good_img" src= "<c:url value='${ vo.files[0].goodFilePath }' />" >
			</div>
			<div style="display : inline-block;position: relative; bottom: 20px;">
				<div class="good_title">
					${vo.goodTitle}<span style="margin-left: 25px;">${vo.star}점</span>
				</div>
				<div class="good_secondTitle">
					${vo.goodSummary}
				</div>
				
			</div>
			<div  style="display : inline-block; float:right">
				
				<c:choose>
					<c:when test="${sessionScope.user.id} == ${ good.id }">
						<form action="View_delete.do" method="post">
							<input type="hidden" name="goodNo" value="${vo.goodNo}">
							<input type="submit" value="게시글 삭제" class="View_DeleteBtn">
						</form>
						<form action="View_Modify.do" method="post">
							<input type="hidden" name="goodNo" value="${vo.goodNo}">
							<input type="submit" value="게시글 수정" class="View_ModifyBtn">
						</form>
					 </c:when>
					<c:otherwise>
						<div></div>
				 	</c:otherwise>
				</c:choose>
			
			</div>
		</div>
		
		<!-- 맛집 설명, 메뉴 -->
		<div id="gbody">
		
			<div style=" font-family: 'NanumSquareNeoBold'; font-size : 30px;">
				${vo.goodTitle}
			</div>
			<div id="good_ExDiv"  style="margin-top:30px">
				<div id="good_ExTitle">
					매장소개
				</div>
				<div class="good_Ex">
					${vo.goodContent}
				</div>
			</div>
			
			<div>
			
				<div id="good_data">
					<table class="good_dataTable">
						<tbody>
							<tr>
								<th>영업시간</th> <td colspan="2" style="width: 230px;">주중 ${vo.open} ~ ${vo.close}</td>
							</tr>
							<tr>
								<th>주차</th> <td colspan="2">주차,발렛</td>
							</tr>
							<tr>
								<th rowspan="3">메뉴</th> <td>${vo.menu1}</td> <td>${vo.price1}원</td>
							</tr>
							<tr>
								 						<td>${vo.menu2}</td> <td>${vo.price2}원</td>
							</tr>
							<tr>
								 						<td>${vo.menu3}</td> <td>${vo.price3}원</td>
							</tr>
							<tr>
								<th>주소</th> <td colspan="2">${vo.goodAddr}</td>
							</tr>
							<tr>
								<th>전화번호</th> <td colspan="2">${vo.goodPn}</td>
							</tr>
							
						</tbody>
					</table>
				</div>
				
				
				
				
				<div class="map_div">
					
					
					<div id="map" style="width:500px;height:400px; object-fit : cover;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b25d5ee8ce07ea0a73a615ee53a63dbd&libraries=services"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('${vo.goodAddr}', function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });

				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.goodTitle}</div>'
				        });
				        infowindow.open(map, marker);

				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
					</script>
					
				
				</div>
				
			</div>
			
			<!-- 댓글 작성 -->
			<div class="good_replyBack">
				
				<div style="border-bottom : 2px solid #ebebeb; padding-bottom: 20px;">
					<div style="display : inline-block; font-family: 'NanumSquareNeo'; font-size: 20px;">맛집 댓글</div>
					
						<c:choose>
							<c:when test="${empty sessionScope.user}">
								<div style="float:right; font-family: 'NanumSquareNeoBold'; font-size: 15px; color : #ff7400; right: 20px; position: relative;">로그인후 댓글 작성 가능</div>
							</c:when>
							<c:otherwise>
								<div style="display : inline-block; float:right;"><button class="reply_write">댓글 작성</button></div>
								<div class="reply_modal">
        							<div class="reply_modal_body">
            							<div style="font-family: 'NanumSquareNeoBold'; color : #ff7400; margin-bottom: 20px;">댓글 작성</div>
            				
            							<form action="reply_write.do" method="get">
            								<input type="hidden" name="goodNo" value="${vo.goodNo}">
            								<input type="hidden" name="id" value="${sessionScope.user.id}">
            							 	<textarea name="goodReplyContent" style="height: 95px; width: 245px; display: block; margin: 0px auto; resize: none;"></textarea>
            								<input type="submit" value="작성완료" class="reply_sub_btn">
            							</form>
            						
            							<button class="reply_modal_close">취소</button>
        							</div>
    							</div>
							</c:otherwise>
						</c:choose>
						
				</div>
				
				
				
				<!-- 댓글 -->
				<div>
					<ul style="display : grid; grid-template-columns: repeat(2, 1fr); padding:0px; width: 860px;">	
					
					<c:forEach items="${ vo.replys }" var="reply">
							<c:choose>
								<c:when test="${sessionScope.user.id eq reply.id}">
								<li class="good_replyLi">
									<div class="reply_User">${ reply.id }</div>
									<div style=" display : inline-block; float : right;">
										<div class="reply_del">
											<button class="modify_write" id="submit_btn">수정</button>
											<div class="modify_modal">
        										<div class="reply_modal_body">
            										<div style="font-family: 'NanumSquareNeoBold'; color : #ff7400; margin-bottom: 20px;">댓글 수정</div>
            				
            										<form action="reply_modify.do" method="get">
            											<input type="hidden" name="goodNo" value="${vo.goodNo}">
           												<input type="hidden" name="goodReplyNo" value="${reply.goodReplyNo}">
           								 				<textarea name="goodReplyContent" style="height: 95px; width: 245px; display: block; margin: 0px auto; resize: none;"></textarea>
           												<input type="submit" value="수정완료" class="modify_sub_btn">
          											</form>
           							
           											<button class="modify_modal_close">취소</button>
        										</div>
    										</div>
										</div>
									</div>
								
									<div class="reply_del">
										<form action="reply_delete.do" method="post">
											<input type="hidden" name="goodNo" value="${vo.goodNo}">
											<input type="hidden" name="goodReplyNo" value="${reply.goodReplyNo}">
											<input type="submit" value="삭제" id="submit_btn" style="left: 285px; bottom: 6px; position: relative;">
										</form>
									</div>
								
									<div>
										<div class="good_reply">
											${ reply.goodReplyContent }
										</div>
									</div>
								</li>
							</c:when>
							
							<c:otherwise>
								<li class="good_replyLi">
									<div class="reply_User">${ reply.id }</div>
									<div style=" display : inline-block; float : right;">
										<div class="good_reply">
											${ reply.goodReplyContent }
										</div>
									</div>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
						
					</ul>
				</div>
			
			</div>
			
			<div style="height : 150px;">
				
			</div>
		
		</div>
		
	</div>
	
	<script>
	
	
		/* 댓글 작성 모달 */
        const modal = document.querySelector('.reply_modal');
        const btnOpenModal=document.querySelector('.reply_write');
        const btnCloseModal=document.querySelector('.reply_modal_close');
        const btnWriteModal=document.querySelector('.reply_sub_btn');

        btnOpenModal.addEventListener("click", ()=>{
        	modal.style.display="flex";
        });
        
        btnCloseModal.addEventListener("click", ()=>{
        	modal.style.display="none";
        });
        
        btnWriteModal.addEventListener("click", ()=>{
        	modal.style.display="none";
        });
        
        
        
        
        /* 댓글 수정 모달 */
        let modifyModal = document.querySelectorAll('.modify_modal');
        let ModifyOpenModal = document.querySelectorAll('.modify_write');
        let ModifyCloseModal = document.querySelectorAll('.modify_modal_close');
        let ModifyWriteModal = document.querySelector('.modify_sub_btn');
     
        for (let i = 0; i < ModifyOpenModal.length; i++) {
        	console.log(ModifyOpenModal[i]);
        	ModifyOpenModal[i].addEventListener("click", () => {
        		modifyModal[i].style.display="flex";
        	})
        	ModifyCloseModal[i].addEventListener("click", () => {
        		modifyModal[i].style.display="none";
        	})
        
        }
        
        
     
        
       
    </script>
	
</body>
</html>