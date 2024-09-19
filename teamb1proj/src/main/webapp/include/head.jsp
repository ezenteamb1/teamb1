<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
     <script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.2.6/gsap.min.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/Physics2DPlugin3.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style>
button {
	 --color: #f6f8ff;
	 --shadow: rgba(0, 9, 61, .24);
	 --cannon-dark: #a6accd;
	 --cannon-light: #f6f8ff;
	 --cannon-shadow: rgba(13, 15, 24, .9);
	 --confetti-1: #892ab8;
	 --confetti-2: #ea4c89;
	 --confetti-3: #ffff04;
	 --confetti-4: #4af2fd;
	 --z-before: -6;
	 display: block;
	 outline: none;
	 cursor: pointer;
	 position: relative;
	 border: 0;
	 background: none;
	 padding: 9px 22px 9px 16px;
	 line-height: 26px;
	 font-family: inherit;
	 font-weight: 600;
	 font-size: 14px;
	 color: var(--color);
	 -webkit-appearance: none;
	 -webkit-tap-highlight-color: transparent;
	 transition: transform var(--transform-duration, 0.4s);
	 will-change: transform;
	 transform-style: preserve-3d;
	 transform: perspective(440px) rotateX(calc(var(--rx, 0) * 1deg)) rotateY(calc(var(--ry, 0) * 1deg)) translateZ(0);
}
 button:hover {
	 --transform-duration: 0.16s;
}
 button.success {
	 --confetti-scale: 0;
	 --stroke-dashoffset: 15;
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
 button .icon, button span {
	 display: inline-block;
	 vertical-align: top;
	 position: relative;
	 z-index: 1;
}
 button .icon {
	 --z: 2px;
	 width: 24px;
	 height: 14px;
	 margin: 8px 16px 0 0;
	 transform: translate(calc(var(--icon-x, 0) * 1px), calc(var(--icon-y, 0) * 1px)) translateZ(2px);
}
 button .icon .confetti {
	 position: absolute;
	 left: 17px;
	 bottom: 9px;
}
 button .icon .confetti svg {
	 width: 18px;
	 height: 16px;
	 display: block;
	 stroke-width: 1px;
	 fill: none;
	 stroke-linejoin: round;
	 stroke-linecap: round;
}
 button .icon .confetti svg * {
	 transition: stroke-dashoffset 0.2s;
	 stroke-dasharray: 15 20;
	 stroke-dashoffset: var(--stroke-dashoffset, 0);
	 stroke: var(--stroke-all, var(--stroke, var(--confetti-2)));
}
 button .icon .confetti svg *:nth-child(2) {
	 --stroke: var(--confetti-3);
}
 button .icon .confetti svg *:nth-child(3) {
	 --stroke: var(--confetti-1);
}
 button .icon .confetti .emitter {
	 position: absolute;
	 left: 4px;
	 bottom: 4px;
	 pointer-events: none;
}
 button .icon .confetti .emitter div {
	 width: 4px;
	 height: 4px;
	 margin: -2px 0 0 -2px;
	 border-radius: 1px;
	 position: absolute;
	 left: 0;
	 top: 0;
	 transform-style: preserve-3d;
	 background: var(--confetti-all, var(--b, none));
}
 button .icon .confetti i {
	 width: 4px;
	 height: 4px;
	 display: block;
	 transform: scale(var(--confetti-scale, 0.5));
	 position: absolute;
	 transition: transform 0.25s;
	 left: var(--left, -1px);
	 top: var(--top, 3px);
	 border-radius: var(--border-radius, 1px);
	 background: var(--confetti-background, var(--confetti-3));
}
 button .icon .confetti i:nth-child(2) {
	 --left: 9px;
	 --top: -1px;
	 --border-radius: 2px;
	 --confetti-background: var(--confetti-4);
}
 button .icon .confetti i:nth-child(3) {
	 --left: 5px;
	 --top: 3px;
	 --confetti-background: var(--confetti-1);
}
 button .icon .confetti i:nth-child(4) {
	 --left: 10px;
	 --top: 14px;
	 --confetti-background: var(--confetti-2);
}
 button .icon .confetti i:nth-child(5) {
	 --left: 9px;
	 --top: 7px;
	 --confetti-background: var(--confetti-4);
}
 button .icon .confetti i:nth-child(6) {
	 --left: 6px;
	 --top: 8px;
	 --border-radius: 2px;
	 --confetti-background: var(--confetti-2);
}
 button .icon .cannon {
	 position: relative;
	 width: 24px;
	 height: 14px;
	 transform: translate(0, 3px) rotate(-45deg);
	 filter: drop-shadow(-2px 2px 2px var(--cannon-shadow));
}
 button .icon .cannon:before, button .icon .cannon:after {
	 content: '';
	 display: block;
	 height: 14px;
}
 button .icon .cannon:before {
	 background: linear-gradient(var(--cannon-dark), var(--cannon-light) 50%, var(--cannon-dark));
	 width: 100%;
	 -webkit-clip-path: polygon(25px -1px, 0 52%, 25px 15px);
	 clip-path: polygon(25px -1px, 0 52%, 25px 15px);
}
 button .icon .cannon:after {
	 width: 6px;
	 position: absolute;
	 right: -3px;
	 top: 0;
	 border-radius: 50%;
	 box-shadow: inset 0 0 0 0.5px var(--cannon-light);
	 background: linear-gradient(90deg, var(--cannon-dark), var(--cannon-light));
}
 button.white {
	 --background: #fff;
	 --color: #1e2235;
	 --border: #e1e6f9;
	 --shadow: none;
	 --cannon-dark: #103fc5;
	 --cannon-light: #275efe;
	 --cannon-shadow: rgba(0, 9, 61, .2);
}
 button.white:before {
	 box-shadow: inset 0 0 0 1px var(--border);
}
 button.grey {
	 --background: #404660;
	 --cannon-shadow: rgba(13, 15, 24, .2);
	 --cannon-dark: #d1d6ee;
	 --cannon-light: #fff;
}
 html {
	 box-sizing: border-box;
	 -webkit-font-smoothing: antialiased;
}
 * {
	 box-sizing: inherit;
}
 *:before, *:after {
	 box-sizing: inherit;
}
 body {
	 justify-content: center;
	 align-items: center;
}
 body .button {
	 margin: 0 12px;
}
 body .dribbble {
	 position: fixed;
	 display: block;
	 right: 20px;
	 bottom: 20px;
}
 body .dribbble img {
	 display: block;
	 height: 28px;
}
 body .twitter {
	 position: fixed;
	 display: block;
	 right: 64px;
	 bottom: 14px;
}
 body .twitter svg {
	 width: 32px;
	 height: 32px;
	 fill: #1da1f2;
}

label {
	width: 22%;
}
#head_img{
padding:0px 0px 0px 45px;
margin-left: 38%;
}
.btn-primary{
display:inline-block;
bottom:360px;
background-color:white;
border-color:yellow;
color:black;
right:-600px;}

.btn-primary:hover{
background-color:yellow;
border-radius: 12px;
}
</style>

</head>


<body>

<img  id="head_img" src="<c:url value='/resources/image/head/그맛이알고싶다.png'/>" onclick="javascript:location.href='<c:url value="/"/>'" style="width: 370px; cursor: pointer;">


		<!-------------------------------------------------------------------------  로그인 회원가입 버튼  ------------------------------------------------------------------------->

<c:choose>
	<c:when test="${empty sessionScope.user}">

<div id="wrapper" class="lm-wrapper clearfix">
 	<aside class="lm-sidebar lm-sidebar-left">
    <div class="sidebar-unit login-buttons">
   		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="display: flex; justify-content: space-evenly; right: -82%; top: -116px; border: 3px solid black;">
 		로그인
		</button>
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter1" style="display: flex; justify-content: space-evenly; right: -88%; top: -158px; border: 3px solid black; ">
 		회원가입
		</button> 	     
          <!--   <a href="javascript:void(0)" id="loginButton">로그인</a><a href="javascript:void(0)" id="JoinButton">회원가입</a>  -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  			<div class="modal-dialog modal-dialog-centered" role="document">
    			<div class="modal-content">
      				<div class="modal-header">
       					<h5 class="modal-title" id="ld">로그인</h5>
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          					<span aria-hidden="true">&times;</span>
        				</button>
      				</div>
      				<div class="modal-body" style="position: relative; flex: 1 1 auto; padding: 32px 0px 0px 48px; height: 154px;">
           				<form action="user/login.do" method="post">
                			<div class="form-group">
                    			<label for="userid">아이디</label>
                    			<input type="text" id="userid" name="id" required value="dd" >
               	 			</div>
                			<div class="form-group">
                    			<label for="userpassword">비밀번호</label>
                    			<input type="password" id="userpassword" name="pw" required value="dd">
                			</div>
                			<button type="submit" class="submit-btn" style="color: white; background: #6c757D; border-radius: 10px; float: right; top: -98px; right: 51px; height:80px ">로그인</button>
            			</form>
        			</div>
      				<div class="modal-footer">
      					비밀번호를 잊으셨나요??<a href="find.jsp">비밀번호 찾기</a>
        				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      					
      			
      				</div>
    			</div>
  			</div>
		</div>
	</div>
	</aside>
</div>

</c:when>
</c:choose>



		<!------------------------------------------------------------------------- 회원가입 창  ------------------------------------------------------------------------->


<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="pw">회원가입</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
               <form id="frm2" action="user/join.do" method="post">
               <div class="from-group">
               		<div class="checkid"></div>
                    <label for="id">아이디</label>
                    <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요">
                    
                </div>
                <div class="from-group">
                	
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" placeholder="이름을 입력해주세요" >
                    
                </div>
                <div class="from-group">
                    <label for="nick">닉네임</label>
                    <input type="text" id="nick" name="nick"placeholder="닉네임을 입력해주세요">
                </div>
                <div class="from-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="pw" placeholder="비밀번호를 입력해주세요" onkeyup="upfn()">
                </div>
                <div class="from-group">
                    <label for="passwordValid">비밀번호 확인</label>
                    <input type="password" id="passwordValid" name="passwordValid" placeholder="비밀번호를 확인해주세요" onkeyup="upfn()">
                    <span id="pwme"></span>
                </div>
                <div class="from-group">
                    <label for="pn">핸드폰번호</label>
                    <input type="text" id="pn" name="pn" placeholder="번호를 입력해주세요">
                </div>
                <div class="from-group">
                	<div class="checkemail"></div>
                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email"placeholder="이메일을 입력해주세요">
                </div>
                <div class="form-group">
           		 	<label for="file">프로필사진</label>
            		<input type="file" accept="image/*" id="file" name="file">
      			  </div>
		<div class="form-group">
      			  <input type="checkbox" name="information" onclick="inck(this)">
      			  개인정보 제공 동의서
      			  </div>
      			  
                <button type="submit" class="button">
                
                 <div class="icon">
        <div class="cannon"></div>
        <div class="confetti">
            <svg viewBox="0 0 18 16">
                <polyline points="1 10 4 7 4 5 6 1" />
                <path d="M4,13 C5.33333333,9 7,7 9,7 C11,7 12.3340042,6 13.0020125,4" />
                <path d="M6,15 C7.83362334,13.6666667 9.83362334,12.6666667 12,12 C14.1663767,11.3333333 15.8330433,9.66666667 17,7" />
            </svg>
            <i></i><i></i><i></i><i></i><i></i><i></i>
            <div class="emitter"></div>
        </div>
    </div>
    
     <span>JOIN</span>
                </button>
                
       <a class="dribbble" href="https://dribbble.com/ai" target="_blank"><img src="https://cdn.dribbble.com/assets/dribbble-ball-mark-2bd45f09c2fb58dbbfb44766d5d1d07c5a12972d602ef8b32204d28fa3dda554.svg" alt=""></a>
<a class="twitter" target="_top" href="https://twitter.com/aaroniker_me"><svg xmlns="http://www.w3.org/2000/svg" width="72" height="72" viewBox="0 0 72 72"><path d="M67.812 16.141a26.246 26.246 0 0 1-7.519 2.06 13.134 13.134 0 0 0 5.756-7.244 26.127 26.127 0 0 1-8.313 3.176A13.075 13.075 0 0 0 48.182 10c-7.229 0-13.092 5.861-13.092 13.093 0 1.026.118 2.021.338 2.981-10.885-.548-20.528-5.757-26.987-13.679a13.048 13.048 0 0 0-1.771 6.581c0 4.542 2.312 8.551 5.824 10.898a13.048 13.048 0 0 1-5.93-1.638c-.002.055-.002.11-.002.162 0 6.345 4.513 11.638 10.504 12.84a13.177 13.177 0 0 1-3.449.457c-.846 0-1.667-.078-2.465-.231 1.667 5.2 6.499 8.986 12.23 9.09a26.276 26.276 0 0 1-16.26 5.606A26.21 26.21 0 0 1 4 55.976a37.036 37.036 0 0 0 20.067 5.882c24.083 0 37.251-19.949 37.251-37.249 0-.566-.014-1.134-.039-1.694a26.597 26.597 0 0 0 6.533-6.774z"></path></svg></a>         
                
          
            </form>
           
        </div> 
            
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       
      </div>
    </div>
  </div>
</div>


		<!-------------------------------------------------------------------------  로그인 후 버튼  ------------------------------------------------------------------------->


  <div class="header">
       ${sessionScope.user.nick}
       <div class="nav" style=" position: relative; float: right; bottom: 115px; right: 170px;; ">
       <c:choose>
       	<c:when test="${not empty sessionScope.user}">
       		<div class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn" onclick="toggleDropdown()" style="text-align: center;display: inline-block; width: 140px; background: #6c757d9c; height: 35px; line-height: 35px; color: black;  font-family: 'NanumSquareNeoBold'; border-radius: 10px 10px 0px 0px;">내 정보</a>
                    <div id="dropdown-content" class="dropdown-content" style=" display : none ">
                        <button id="inforup" style=" border-radius : 0px; border-top : 3px solid black; ">회원정보 수정</button>
                        <!-- /Board/logout.jsp -->
                        <a href="<c:url value='/user/logout.do'/>" style="display: block; width: 140px; text-align: center; font-family: 'NanumSquareNeo'; border-top: 3px solid black; background: #6c757d9c; color: black; height: 40px; line-height: 35px; border-radius: 0px 0px 10px 10px;">로그아웃</a>
                    </div>
                </div>
       	</c:when>
       </c:choose>
         </div>
    </div> 
    
    
    		<!-------------------------------------------------------------------------  회원정보수정  ------------------------------------------------------------------------->
    
    
     <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
       <h5 class="modal-title" id="infor">회원정보수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
<div class="mdal-boby"></div>

<form id="frm3" action="user/inforup.do" method="post">
 
  <div class="from-group">
  				<div>
  						
                    <label for="changename">이름</label>
                    <input type="text" id="changename" name="name" placeholder="이름을입력해주세요">
                </div>
                <div class="from-group">
                    <label for="changepassword">비밀번호</label>
                    <input type="password" id="changepassword" name="pw" placeholder="비밀번호를 입력해주세요" onkeyup="upfnn(this,event)">
                </div>
                <div class="from-group">
                    <label for="changepasswordValid">비밀번호 확인</label>
                    <input type="password" id="changepasswordValid" name="passwordValid" placeholder="비밀번호를 확인해주세요" onkeyup="upfnn(this,event)">
                    <span id="pwme"></span>
                </div>
                <div class="from-group">
                    <label for="changepn">핸드폰번호</label>
                    <input type="text" id="changepn" name="pn" placeholder="번호를 입력해주세요">
                </div>
                <div class="from-group">
                    <label for="changeemail">이메일</label>
                    <input type="email" id="changeemail" name="email" placeholder="이메일을 입력해주세요">
                </div>
                <div class="from-group">
                    <label for="changenick">닉네임</label>
                    <input type="text" id="changenick" name="nick" placeholder="닉네임을 입력해주세요">
                </div>
                <div class="form-group">
           		 	<label for="changefile">프로필사진</label>
            		<input type="file" accept="image/*" id="changefile" name="file">
      			  </div>
      			  
                </div>
  <div class="footer">
            <button type="submit" class="submit-btn">수정하기</button>
            <a href="#" class="button" onclick="history.back();">취소</a>
        </div>
    </form>
</div>
</div>
</div>  
    


    
    
    
    
    
<script>


$("#frm2").submit(function(){
	let id = $("#frm2 #id");
	let password =$("#frm2 #password");
	let passwordValid =$("#frm2 #passwordValid");
	let email =$("#frm2 #email");
	let pn =$("#frm2 #phonenumber");
	let nick =$("#frm2 #nick");
	
	
	if(id.val().trim()==""){//id.val는 id 변수에 저장된 입력 필드값을 가져옴 trim은 공백제거 ==""문자열인지 확인
		//입격 필드이 값이 비어있는지 확인하는 조건문
		alert("아이디는 필수 입력 임둥");
		id.focus();//입력필드에 포커스를 맞춤
		return false;//폼의 제출을 중단 폼이 서버로 제출되지 않고, 유효성 검사에 실패했음을 의미
	}
	if(password.val().trim()==""){
		alert("비번은 필수 입력 임둥")
		password.focus();
		return false;
	}
	if(passwordValid.val().trim()==""){
		alert("비번 확인은 필수 입력 임둥")
		passwordValid.focus();
		return false;
	}
	if(email.val().trim()==""){
		alert("이메일은 필수 입력 임둥")
		email.focus();
		return false;
	}
	if(pn.val().trim()==""){
		alert("폰번호는 필수 입력 임둥")
		pn.focus();
		return false;
	}
	if(nick.val().trim()==""){
		alert("닉네임은  필수 입력 임둥")
		nick.focus();
		return false;
	}
	
	if(password.val().trim() != passwordValid.val().trim()){
		alert("비번 확인 실패")
		password.focus();
		return false;
	}
	return true;
})

var timeout = null
	$('#frm2 #id').on('keyup', function() {
	        var text = this.value
	        clearTimeout(timeout)
	        timeout = setTimeout(function() {  
	            let id = $("#frm2 #id").val();
	        	
	        	$.ajax({
	        		url :"<c:url value='/user/idCheck.do'/>",
	        		type : "post",
	        		data : {"id" : id},
	        		success : function(responseData) {
	        			
	        			if(responseData.result == "success") {
	        				$(".checkid").text("Valid!").css("color", "#169b4d");
	        				
	        			}else {
	        				$(".checkid").text("Invalid!").css("color", "#9b1616");
	        				$("#id").val("");
	        			}
	        		}
	        	})
	        }, 200)
	    })
	    
	    

	$('#email').on('keyup', function() {
	        var text = this.value
	        clearTimeout(timeout)
	        timeout = setTimeout(function() {  
	            let name = $("#email").val();
	        	
	        	$.ajax({
	        		url :"<c:url value='/user/emailCheck.do'/>",
	        		type : "post",
	        		data : {"email" : email},
	        		success : function(responseData) {
	        			
	        			if(responseData.result == "success") {
	        				$(".checkemail").text("Invalid!").css("color", "#9b1616");
	        				$("#id").val("");
	        			}else {
	        				$(".checkemail").text("Valid!").css("color", "#169b4d");
	        			}
	        		}
	        	})
	        }, 200)
	    })	    
	    


	    
	    
	    
	    
	    

function upfn(){
	let pw=$("#frm2 #password").val().trim();
	let pv=$("#frm2 #passwordValid").val().trim();
	
	if(pw==""){
		alert("비밀번호를 입력하세요");
		return;
	}
	
	if(pw==pv){
		console.log("동일");
		$('#pwme').html("<font color='green'>비밀번호가 일치합니다.</font>");
	}else{
		console.log("다름");
		$('#pwme').html("<font color='red'>비밀번호를 정확히 입력해주세요.</font>");
		
	}
}










$('#inforup').click(function(){
	$('#exampleModalCenter2').modal('show')
	 var text = this.value
/* 	 console.log("2"); 
    clearTimeout(timeout)
    timeout = setTimeout(function() {  
        let name = $("#name").val();
        let email = $("#email").val();
        let pn = $("#pn").val();
        let password = $("#password").val();
	$.ajax({
		url:"<c:url value='/user/inforup.do' />",
		type:"POST",
		data:{"email" : email, "name":name, "password":password, "pn":pn,}, 
		success: function(data) {
			
			let objData=JSON.parse(data.trim())//JSON.parse메서드는 JSON 형식을 문자열 javascript 객체로 변환
			console.log(objData)//서버로부터 받은 JSON 데이터
			
			if(objData.result=="success"){
				$('#password').val(objData.pw);//objData객체의 pw속성 값으로, 서버로부터 받은 비밀번호 데이터  
               $('#pn').val(objData.pn);
               $('#email').val(objData.email);
               $('#name').val(objData.name);
             
			}else{
				//(objData.result=="failed");
			}
          
           
		}
	})
}) */
})

	 
	 
	 
	 
	 
	  function toggleDropdown() {
         var dropdown = document.getElementById("dropdown-content");
         if (dropdown.style.display === "block") {
             dropdown.style.display = "none";
         } else {
             dropdown.style.display = "block";
         }
     }

     window.onclick = function(event) {
         if (!event.target.matches('.dropbtn')) {
             var dropdowns = document.getElementsByClassName("dropdown-content");
             for (var i = 0; i < dropdowns.length; i++) {
                 var openDropdown = dropdowns[i];
                 if (openDropdown.style.display === "block") {
                     openDropdown.style.display = "none";
                 }
             }
         }
     }
   
   
   
     
     
     
   
   




gsap.registerPlugin(Physics2DPlugin);

document.querySelectorAll('.button').forEach(button => {

    const bounding = button.getBoundingClientRect()

    button.addEventListener('mousemove', (e) => {

        let dy = (e.clientY - bounding.top - bounding.height / 2) / -1
        let dx = (e.clientX - bounding.left - bounding.width / 2)  / 10

        dy = dy > 10 ? 10 : (dy < -10 ? -10 : dy);
        dx = dx > 4 ? 4 : (dx < -4 ? -4 : dx);

        button.style.setProperty('--rx', dy);
        button.style.setProperty('--ry', dx);

    });

    button.addEventListener('mouseleave', (e) => {

        button.style.setProperty('--rx', 0)
        button.style.setProperty('--ry', 0)

    });

    button.addEventListener('click', (e) => {
        button.classList.add('success');
        gsap.to(button, {
            '--icon-x': -3,
            '--icon-y': 3,
            '--z-before': 0,
            duration: .2,
            onComplete() {
                particles(button.querySelector('.emitter'), 100, -4, 6, -80, -50);
                gsap.to(button, {
                    '--icon-x': 0,
                    '--icon-y': 0,
                    '--z-before': -6,
                    duration: 1,
                    ease: 'elastic.out(1, .5)',
                    onComplete() {
                        button.classList.remove('success');
                    }
                });
            }
        });
    });

});

function particles(parent, quantity, x, y, minAngle, maxAngle) {
    let colors = [
        '#FFFF04',
        '#EA4C89',
        '#892AB8',
        '#4AF2FD',
    ];
    for(let i = quantity - 1; i >= 0; i--) {
        let angle = gsap.utils.random(minAngle, maxAngle),
            velocity = gsap.utils.random(70, 140),
            dot = document.createElement('div');
        dot.style.setProperty('--b', colors[Math.floor(gsap.utils.random(0, 4))]);
        parent.appendChild(dot);
        gsap.set(dot, {
            opacity: 0,
            x: x,
            y: y,
            scale: gsap.utils.random(.4, .7)
        });
        gsap.timeline({
            onComplete() {
                dot.remove();
            }
        }).to(dot, {
            duration: .05,
            opacity: 1
        }, 0).to(dot, {
            duration: 1.8,
            rotationX: `-=${gsap.utils.random(720, 1440)}`,
            rotationZ: `+=${gsap.utils.random(720, 1440)}`,
            physics2D: {
                angle: angle,
                velocity: velocity,
                gravity: 120
            }
        }, 0).to(dot, {
            duration: 1,
            opacity: 0
        }, .8);
    }
}
</script>
