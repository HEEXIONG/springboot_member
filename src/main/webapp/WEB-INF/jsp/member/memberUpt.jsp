<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	.input-group{
		margin-top: 25px;
	}
html {
  height: 100%;
}
body {
  margin:0;
  padding:0;
  font-family: sans-serif;
  background: linear-gradient(#141e30, #243b55);
}

.login-box {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 1000px;
  padding: 40px;
  transform: translate(-50%, -50%);
  background: rgba(0,0,0,.5);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0,0,0,.6);
  border-radius: 10px;
}

.login-box h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
}

.login-box .user-box {
  position: relative;
}

.login-box .user-box input {
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  margin-bottom: 30px;
  border: none;
  border-bottom: 1px solid #fff;
  outline: none;
  background: transparent;
}
.login-box .user-box label {
  position: absolute;
  top:0;
  left: 0;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  pointer-events: none;
  transition: .5s;
}

.login-box .user-box input:focus ~ label,
.login-box .user-box input:valid ~ label {
  top: -20px;
  left: 0;
  color: #03e9f4;
  font-size: 12px;
}

.login-box form a {
  position: relative;
  display: inline-block;
  padding: 10px 33px;
  color: #03e9f4;
  font-size: 16px;
  text-decoration: none;
  text-transform: uppercase;
  overflow: hidden;
  transition: .5s;
  margin-top: 40px;
  letter-spacing: 4px
   
}

.login-box a:hover {
  background: #03e9f4;
  color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 5px #03e9f4,
              0 0 25px #03e9f4,
              0 0 50px #03e9f4,
              0 0 100px #03e9f4;
}

.login-box a span {
  position: absolute;
  display: block;
}

.login-box a span:nth-child(1) {
  top: 0;
  left: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(90deg, transparent, #03e9f4);
  animation: btn-anim1 1s linear infinite;
}

@keyframes btn-anim1 {
  0% {
    left: -100%;
  }
  50%,100% {
    left: 100%;
  }
}

.login-box a span:nth-child(2) {
  top: -100%;
  right: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(180deg, transparent, #03e9f4);
  animation: btn-anim2 1s linear infinite;
  animation-delay: .25s
}

@keyframes btn-anim2 {
  0% {
    top: -100%;
  }
  50%,100% {
    top: 100%;
  }
}

.login-box a span:nth-child(3) {
  bottom: 0;
  right: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(270deg, transparent, #03e9f4);
  animation: btn-anim3 1s linear infinite;
  animation-delay: .5s
}

@keyframes btn-anim3 {
  0% {
    right: -100%;
  }
  50%,100% {
    right: 100%;
  }
}

.login-box a span:nth-child(4) {
  bottom: -100%;
  left: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(360deg, transparent, #03e9f4);
  animation: btn-anim4 1s linear infinite;
  animation-delay: .75s
}

@keyframes btn-anim4 {
  0% {
    bottom: -100%;
  }
  50%,100% {
    bottom: 100%;
  }
}

	.input-group{
		margin-top: 25px;
	}
</style>
<div class="login-box">
	<div>
		<c:set var="fullURL" value="${pageContext.request.requestURL}"></c:set>
		<c:set var="pathURI" value="${pageContext.request.requestURI}"></c:set>
		<c:set var="baseURL" value="${fn:replace(fullURL, pathURI, '')}"></c:set>
		
		<form id="updateForm" name="updateForm" method="post" enctype="multipart/form-data">
			<input type="hidden" id="memberIdx" name="memberIdx" value="${resultVO.memberIdx}" />
			<div class="input-group text-center">
				<img class="rg_i Q4LuWd" id="userImage" src="${baseURL}/${resultVO.fileName}" data-atf="true" width="300" height="150" onerror="this.src='images/defaultpic.png'">
				<label class="btn btn-default">
				    Browse <input type="file" id="userImageAttachFile" name="userImageAttachFile" hidden onchange="setThumbnail(event);" />
				</label>
			</div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">이름</span>
				<input type="text" id="memberName" name="memberName" value="${resultVO.memberName}" class="form-control" placeholder="이름을 입력하세요." aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">이메일</span>
				<input type="text" id="memberEmail" name="memberEmail" value="${resultVO.memberEmail}" class="form-control" placeholder="이메일을 입력하세요." aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">휴대전화</span>
				<input type="text" id="memberPhoneNumber" name="memberPhoneNumber" value="${resultVO.memberPhoneNumber}" class="form-control" placeholder="휴대전화를 입력하세요." aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">아이디</span>
				<input type="text" id="memberId" name="memberId" class="form-control" value="${resultVO.memberId}" placeholder="아이디를 입력하세요." aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">비밀번호</span>
				<input type="password" id="memberPw" name="memberPw" class="form-control" placeholder="비밀번호를 입력하세요." aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">비밀번호 확인</span>
				<input type="password" id="memberPw2" name="memberPw2" class="form-control" placeholder="비밀번호를 한번 더 입력하세요." aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">주소</span>
				<input type="text" id="memberAddress" name="memberAddress" class="form-control" value="${resultVO.memberAddress}" placeholder="주소를 선택하세요." aria-describedby="basic-addon1" readonly="readonly">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button" onclick="javascript:fn_openAddressPopup();">Search</button>
				</span>
			</div>
			<div class="input-group" style="margin-top:0px;">
				<span class="input-group-addon" id="basic-addon1">나머지 주소</span>
				<input type="text" id="memberAddress2" name="memberAddress2" class="form-control" value="${resultVO.memberAddress2}" placeholder="나머지 주소를 입력하세요." aria-describedby="basic-addon1">
			</div>
	<div style="margin-top:15px;">
		<div>
			<a  onclick="javascript:fn_submit();" style="font-family: 'Black Han Sans', sans-serif;">
		      <span></span>
		      <span></span>
		      <span></span>
		      <span></span>
		      	저장
		    </a>
		    <a onclick="javascript:history.go(-1);" style="font-family: 'Black Han Sans', sans-serif;" >
		      <span></span>
		      <span></span>
		      <span></span>
		      <span></span>
		        	목록
		    </a>
		</div>			
	</div>		
			
		</form>
	</div>

	
		
</div>

<script>
	<%-- 수정 --%>
	function fn_submit(){
		if(fn_validation()){
			return;
		}
		
		var f = document.updateForm;
		f.action = "/updateMember.do";
		f.submit();
	}

	<%-- 주소검색 팝업 호출 --%>
	function fn_openAddressPopup(){
		var url = "/fwdSearchAddressPopup.do";
		var name = "AddressPopup";
		var option = "width=650, height=500, top=100, left=200, location=no"
		window.open(url, name, option);
	}

	<%-- 주소검색 팝업 호출 CallBack --%>
	function callback_openAddressPopup(aParam){
		document.getElementById("memberAddress").value = aParam["roadAddr"];
	}

	<%-- 유효성 검사 --%>
	function fn_validation(){

		var emailReg = /@/gi;
		var phoneNumberReg = /^[0-9]+$/;
		
		if(!emailReg.test(document.getElementById("memberEmail").value)){
			alert("이메일 주소는 '@'가 필수로 입력되어야 합니다'");
			document.getElementById("memberEmail").focus();
			return true;
		}else if(document.getElementById("memberPw").value.length < 1 || document.getElementById("memberPw2").value.length < 1){
			alert("비밀번호 입력하세요.");
			return true;
		}else if(document.getElementById("memberPw").value != document.getElementById("memberPw2").value){
			alert("비밀번호 일치하지않습니다.");
			document.getElementById("memberPw2").focus();
			return true;
		}else if(!phoneNumberReg.test(document.getElementById("memberPhoneNumber").value)){
			alert("휴대전화는 숫자만 입력 가능합니다.");
			document.getElementById("memberPhoneNumber").focus();
			return true;
		}
		
		return false;
	}

	<%-- 이미지 업로드시 이미지 미리보기 --%>
	function setThumbnail(event) { 
		var reader = new FileReader();

		reader.onload = function(event) { 
			document.getElementById("userImage").setAttribute("src", event.target.result);
		};

		reader.readAsDataURL(event.target.files[0]); 
	}
</script>