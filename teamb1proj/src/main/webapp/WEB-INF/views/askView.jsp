<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	    <style>
	    .table {padding: .75rem; margin: 20px 0px; border: 3px solid #eeeeee;border-radius: .75rem;display: flex;align-items: center;justify-content: center;}
	
	    .table-box {min-width: 800px; border-radius: 10px;margin: 20px;padding: 15px;min-height: 20vh; display: flex;flex-direction: column;align-items: center;}
	
	    .table-tr {display: flex;width: 90%;margin: 20px;padding: 20px 0px;}
	
	    .table-head {font-size: 20px;font-weight: 700;width: 20%;}
	
	    .table-body {font-size: 17px;color: #818181;width: 30%;text-align: left;}
	
	    .qna-title {font-family: 'SUITE-Regular';font-size: 19px;ont-weight: 500;color: #000000;width: 80%;}
	
	    .qna-content {font-size: 18px;font-weight: 400;font-family: 'SUITE-Regular';color: #000000;width: 80%;}
	
	    .reply {color: #000000;width: 80%;}
	
	    .table-tr:last-child {border-top: 1px dotted #818181;}
	    </style>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</head>
	<body>
		<div class="container" style="width: 75%; margin: 50px auto;">
      <div class="title" style="padding: .75rem; margin: 20px 0px; border: 3px solid #eeeeee; border-radius: .75rem;"> 
        <h2>문의사항</h2>
      </div>
      <div class="table">
        <div class="table-box">
            <div class="table-tr">
                <div class="table-head">
                   	 문의 유형
                </div>
                <div class="table-body">
                 <c:choose>
                 	<c:when test="${askvo.askCate eq 0}">
                 		맛집 게시판
                 	</c:when>
                 	<c:when test="${askvo.askCate eq 1}">
                 		레시피 게시판
                 	</c:when>
                 	<c:otherwise>
                 		기타
                 	</c:otherwise>
                 </c:choose>
                </div>

                <div class="table-head">
                   	 답변 상태
                </div>
                <div class="table-body">
                    <c:choose>
                    	<c:when test="${askvo.askState eq 0 }">
                    		답변 대기
                    	</c:when>
                    	<c:otherwise>
                    		답변 완료
                    	</c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="table-tr">
                <div class="table-head">
                    	작성일
                </div>
                <div class="table-body">
                    ${askvo.createDate}
                </div>

                <div class="table-head">
                   	 처리일
                </div>
                <div class="table-body">
                    <c:choose>
                    	<c:when test="${empty askvo.askReplyDate}">
                    		대기 중
                    	</c:when>
                    	<c:otherwise>
                    		${askvo.askReplyDate}
                    	</c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="table-tr">
                <div class="table-head">
                    	문의 제목
                </div>
                <div class="table-body qna-title">
					${askvo.askTitle}
                </div>
            </div>

            <div class="table-tr">
                <div class="table-head">
                    	문의 내용
                </div>
                <div class="table-body qna-content">
						${askvo.askContent}
                </div>
            </div>

            <div class="table-tr">
                <div class="table-head">
                   	 답변 내용
                </div>
                <div class="table-body reply">
					<c:choose>
						<c:when test="${empty askvo.askReply}">
							
						</c:when>
						<c:otherwise>
							${askvo.askReply}
						</c:otherwise>
					</c:choose>
                </div>
            </div>
        </div>
        </div>
        <button type="button" class="btn btn-outline-secondary" style="right: 0px;" onclick="location.href='list.do'">목록</button>
      </div>
	</body>
</html>