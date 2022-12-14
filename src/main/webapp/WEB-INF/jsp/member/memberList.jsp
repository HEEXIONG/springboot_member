<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
  
      @media ( max-width: 480px ) {
        .login-box {
          width: auto;
        }
        #jb-content {
          float: none;
          width: auto;
        }
        #jb-sidebar {
          float: none;
          width: auto;
        }
      }
    </style>


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
  color: white !important;
}

.login-box {
  position: absolute;
  top: 30%;
  left: 50%;
  width: 1300px;
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
  color: white;
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

.bigPictureWrapper {
			position: absolute;
			display: none;
			justify-content: center;
			align-items: center;
			top:0%;
			width:100%;
			height:100%;
			background-color: gray; 
			z-index: 100;
			background:rgba(255,255,255,0.5);
		}
		
.bigPicture {
			position: relative;
			display:flex;
			justify-content: center;
			align-items: center;
		}
		
.bigPicture img {
			width:600px;
		}
		
		
</style>

</head>

<div class="login-box" style="margin-top:25px;">

	<div id="memberSearchDiv" class="text-center" style="display:none;float:right;">
		<form id="searchForm" name="searchForm" method="post" class="navbar-form navbar-left" role="search">
			<input type="hidden" id="page" name="page" value="" />
			<input type="hidden" id="size" name="size" value="10" />
			<div class="form-group">
				<input type="text" id="memberName" name="memberName" class="form-control" placeholder="Search">
			</div>
			<button type="submit" class="btn btn-default" onclick="javascript:fn_searchSubmit();">Search</button>
		</form>
	</div>
	
	<div >
		<table class="table">
			<thead>
				<tr>
					<th><input type="checkbox" onclick="javascript:fn_checkboxAllCheck(this);"/></th>
					<th>??????</th>
					<th>??????</th>
					<th>?????????</th>
					<th>????????????</th>
					<th>????????????</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty resultList}">
					<tr>
						<td colspan="6" class="text-center">????????? ????????? ??????</td>
					</tr>
				</c:if>
				<c:if test="${not empty resultList}">
					<c:forEach items="${resultList}" var="result" varStatus="status">
					
			<div class='bigPictureWrapper'>
					<div class='bigPicture'>
					</div>
					</div>
					 
						<tr class="aaa">
							<td><input type="checkbox" name="chooseRecord"/></td>
							<td>${status.count}
								<input type="hidden" id="memberIdx_${status.index}" name="memberIdx" value="${result.memberIdx}" />
							</td>
							<td>${result.memberName}</td>
							<td>${result.memberEmail}</td>
							<td>${result.memberPhoneNumber}</td>
							<td>
								<c:set var="fullURL" value="${pageContext.request.requestURL}"></c:set>
								<c:set var="pathURI" value="${pageContext.request.requestURI}"></c:set>
								<c:set var="baseURL" value="${fn:replace(fullURL, pathURI, '')}"></c:set>
								<img  src="${baseURL}/${result.fileName}" width="300" height="150" onerror='this.src="https://lh3.googleusercontent.com/proxy/mprsbp2upgHJarhPI4371ivf-3l2Eso7-_XVQTniwrVT7MT82pF-hNY3XtQcG0xDcZkv5uh9jTC38jMUTDN5ghmroGw34xm6tB7n4vQsXN9AWgwVkvjofKYUO6KFxdsvDmiKnMGuyb9o8ve9XX9DIb6CYolVCGUuEwvLHRW-vqknWOI_ZmnSo8KFI-zNe-y6dfE"'/>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>	
	</div>
	
	<div class="text-center">
		<c:set var="startPage" value="${pagingVO.startPage}" />
		<c:set var="endPage" value="${pagingVO.endPage}" />
		<c:set var="totalPage" value="${pagingVO.totalPage}" />
		<nav>
			<ul class="pagination">
				<c:if test="${result.number > result.size}">
					<li>
						<a href="javascript:fn_goPage('${startPage - 1}');" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
				   	</li>
				</c:if>
			   	<c:forEach var="i" begin="${startPage}" end="${endPage}">
			   		<c:if test="${i eq result.number}">
						<li class="active"><a href="javascript:fn_goPage('${i}');">${i}</a></li>
			   		</c:if>
			   		<c:if test="${i ne result.number}">
						<li><a href="javascript:fn_goPage('${i}');">${i}</a></li>
			   		</c:if>
				</c:forEach>
				<c:if test="${endPage != totalPage}">
					<li>
						<a href="javascript:fn_goPage('${endPage + 1}');" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
					</li>
				</c:if>
			</ul>
		</nav>
	</div>
	
	<div>
		<button type="button" class="btn btn-lg btn-primary pull-right" onclick="javascript:fn_reg();">??????</button>
		<button type="button" class="btn btn-lg btn-info pull-right" onclick="javascript:fn_search();">??????</button>
		<button type="button" class="btn btn-lg btn-danger pull-right" onclick="javascript:fn_delete();">??????</button>
		<button type="button" class="btn btn-lg btn-warning pull-right" onclick="javascript:fn_update();">??????</button>
	</div>

</div>

<form id="detailForm" name="detailForm" method="post">
	<input type="hidden" id="memberIdxs" name="memberIdxs" value="" />
</form>



<script>

	$(document).ready(function (e){
	
	$(".aaa").on("click","img",function(){
		var path = $(this).attr('src')
		showImage(path);
	});//end click event
	
	function showImage(abc){
	    
	 $(".bigPictureWrapper").css("display","flex").show(); 
	    
	    $(".bigPicture")
	    .html("<img src='"+abc+"' >")
	    .animate({width:'100%', height: '100%'}, 1000);
	    
	  }//end fileCallPath
	  
	$(".bigPictureWrapper").on("click", function(e){
	    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
	    setTimeout(function(){
	      $('.bigPictureWrapper').hide();
	    }, 1000);
	  });//end bigWrapperClick event
});
	
	
	
	
	
	<%-- ?????????_????????? ?????? --%>
	function fn_goPage(page){
		var f = document.searchForm;
		f.page.value = page;
		f.action = "/selectMemberList.do";
		f.submit();
	}

	<%-- ???????????? ???????????? --%>
	function fn_checkboxAllCheck(obj){
		var chooseRecords = document.getElementsByName("chooseRecord");
		for(var i=0; i<chooseRecords.length; i++){
			chooseRecords[i].checked = obj.checked;
		}
	}

	<%-- ???????????? ?????? --%>
	function fn_reg(){
		location.href = "/fwdMemberReg.do";
	}

	<%-- ????????? --%>
	function fn_search(){
		var memberSearchDiv = document.getElementById("memberSearchDiv");
		
		if(memberSearchDiv.style.display == "none"){
			memberSearchDiv.style.display = "block";
		}else{
			memberSearchDiv.style.display = "none";
		}
		
	}

	<%-- ?????? --%>
	function fn_searchSubmit(){
		var f = document.searchForm;
		f.action = "/selectMemberList.do";
		f.submit();
	}

	<%-- ?????? --%>
	function fn_delete(){
		var memberIdxs = [];
		var chooseRecordCount = 0;
		var chooseRecords = document.getElementsByName("chooseRecord");
		
		for(var i=0; i<chooseRecords.length; i++){
			if(chooseRecords[i].checked){
				chooseRecordCount++;
				memberIdxs.push(document.getElementsByName("memberIdx")[i].value);
			}
		}

		if(chooseRecordCount < 1){
			alert("???????????? ???????????????.");
			return;
		}
		
		var f = document.detailForm;
		f.memberIdxs.value = memberIdxs;
		f.action = "/deleteMember.do";
		f.submit();
	}

	<%-- ??????????????? ?????? --%>
	function fn_update(){
		var chooseRecordCount = 0;
		var chooseRecords = document.getElementsByName("chooseRecord");
		
		for(var i=0; i<chooseRecords.length; i++){
			if(chooseRecords[i].checked){
				chooseRecordCount++;
			}
		}

		if(chooseRecordCount < 1){
			alert("???????????? ???????????????.");
			return;
			
		}

		var memberIdx = 0;
		var memberIdxs = document.getElementsByName("memberIdx");
		if(chooseRecordCount > 1){
			alert("2??? ?????? ???????????? ????????? ????????? ?????????????????? ???????????????.");
			for(var i=0; i<chooseRecords.length; i++){
				chooseRecords[i].checked = false;
			}
			chooseRecords[0].checked = true;
			memberIdx = 0;
		}else{
			for(var i=0; i<chooseRecords.length; i++){
				if(chooseRecords[i].checked){
					memberIdx = i;
					break;
				}
			}
		}

		location.href = "/fwdMemberUpt.do?memberIdx="+memberIdxs[memberIdx].value;
	}
</script>