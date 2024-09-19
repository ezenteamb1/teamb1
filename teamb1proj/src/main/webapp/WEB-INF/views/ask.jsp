<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>ask page</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    	<!-- jQuery -->
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    	<style>
        .nav-tabs{width: 75%; margin:auto;}
        .table {width: 75%; margin:auto;}
        .justify-content-center {justify-content: center !important; margin-top: 3%;}
        .title a {color: #505050;}
        .title a:hover {color: #999999;}
        table tr th:nth-child(1), td:nth-child(1) {width: 50%;}
        table tr th:nth-child(2), td:nth-child(2) {width: 30%;}
        table tr th:nth-child(3), td:nth-child(3) {width: 20%;}
    	</style>
	</head>
	<body>
	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		
		<div class="title" style="padding: .75rem; margin: 20px auto; border: 3px solid #eeeeee; 
		                           border-top-left-radius: .75rem; border-top-right-radius: .75rem; width: 75%;
		                           display: flex; justify-content: space-between; align-items: end;"> 
		    <h2>문의사항</h2>
		    <div class="write">
		    	<a href="<c:url value='write.do'/>">문의하러 가기</a>
		    	<a href="<c:url value='/'/>">메인으로 가기</a>
		    </div>
	    </div>
	    
	    <form id="tabForm" action="<c:url value='/ask/list.do' />" method="get">
	    <ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
			  <button class="nav-link active" id="questions-tab" data-bs-toggle="tab"  data-bs-target="#questions-tab-pane" type="button" role="tab" aria-controls="questions-tab-pane" aria-selected="true">
			  Questions
			  </button>
			</li>
			<li class="nav-item" role="presentation">
			  <button class="nav-link" id="waiting-tab" data-bs-toggle="tab" data-bs-target="#waiting-tab-pane" type="button" role="tab" aria-controls="waiting-tab-pane" aria-selected="false">Waiting</button>
			</li>
			<li class="nav-item" role="presentation">
			  <button class="nav-link" id="completed-tab" data-bs-toggle="tab" data-bs-target="#completed-tab-pane"  type="button" role="tab" aria-controls="completed-tab-pane" aria-selected="false">Completed</button>
			</li>
	     </ul>
	     </form>
	
	     <div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="questions-tab-pane" role="tabpanel" aria-labelledby="questions-tab" tabindex="0">
			    <table class="table caption-top">
			        <caption>List of Questions</caption>
			        <thead>
			          <tr>
			            <th scope="col">TITLE</th>
			            <th scope="col">DATE</th>
			            <th scope="col">STATE</th>
			          </tr>
			        </thead>
			        <tbody>
			          <c:forEach items="${list}" var="list">
				          <tr>
				            <td><a href="<c:url value='/ask/view.do?askNo=${list.askNo}' />" >${list.askTitle}</a></td>
				            <td>${list.createDate}</td>
				            <c:choose>
				            	<c:when test="${list.askState eq 0}">
						            <td>Waiting!</td>				            				            	
				            	</c:when>
				            	<c:otherwise>
				            		<td>Completed!</td>
				            	</c:otherwise>
				            </c:choose> 
				          </tr>
			          </c:forEach>
			        </tbody>
			      </table>
			</div>
	        <div class="tab-pane fade" id="waiting-tab-pane" role="tabpanel" aria-labelledby="waiting-tab" tabindex="0">
	          <table class="table caption-top">
	            <caption>List of Waiting</caption>
	            <thead>
	              <tr>
	                <th scope="col">TITLE</th>
	                <th scope="col">DATE</th>
	                <th scope="col">STATE</th>
	              </tr>
	            </thead>
	            <tbody>
	              <c:forEach items="${list}" var="list">
			          <tr>
						<c:if test="${list.askState eq 0}">
				            <td><a href="<c:url value="/ask/view.do?askNo=${list.askNo}" />">${list.askTitle}</a></td>
				            <td>${list.createDate}</td>							
			            	<td>Waiting!</td>
						</c:if>
			          </tr>
			       </c:forEach>
	            </tbody>
	          </table>         
	         
	        </div>
	        <div class="tab-pane fade" id="completed-tab-pane" role="tabpanel" aria-labelledby="completed-tab" tabindex="0">
	          <table class="table caption-top">
	            <caption>List of Completed</caption>
	            <thead>
	              <tr>
	                <th scope="col">TITLE</th>
	                <th scope="col">DATE</th>
	                <th scope="col">STATE</th>  
	              </tr>
	            </thead>
	            <tbody>
	              <c:forEach items="${list}" var="list">
			          <tr>
						<c:if test="${list.askState eq 1}">
				            <td><a href="<c:url value="/ask/view.do?askNo=${list.askNo}" />">${list.askTitle}</a></td>
				            <td>${list.createDate}</td>							
			            	<td>Completed!</td>
						</c:if>
			          </tr>
			       </c:forEach>
	            </tbody>
	          </table> 
	          
	        </div>
	        <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div>
      </div>
	</body>
</html>