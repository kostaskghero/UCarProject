<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.modalDialog {
		position: fixed;
		font-family: Arial, Helvetica, sans-serif;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		background: rgba(0,0,0,0.8);
		z-index: 99999;
		opacity:0;
		-webkit-transition: opacity 400ms ease-in;
		-moz-transition: opacity 400ms ease-in;
		transition: opacity 400ms ease-in;
		pointer-events: none;
	}

	.modalDialog:target {
		opacity:1;
		pointer-events: auto;
	}

	.modalDialog > div {
		width: 400px;
		position: relative;
		margin: 10% auto;
		padding: 5px 20px 13px 20px;
		border-radius: 10px;
		background: #ffffff; /* Old browsers */
background: -moz-linear-gradient(top,  #ffffff 0%, #ffffff 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(100%,#ffffff)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  #ffffff 0%,#ffffff 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  #ffffff 0%,#ffffff 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  #ffffff 0%,#ffffff 100%); /* IE10+ */
background: linear-gradient(to bottom,  #ffffff 0%,#ffffff 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ffffff',GradientType=0 ); /* IE6-9 */

	}

	.close {
		background: #606061;
		color: #FFFFFF;
		line-height: 25px;
		position: absolute;
		right: -12px;
		text-align: center;
		top: -10px;
		width: 24px;
		text-decoration: none;
		font-weight: bold;
		-webkit-border-radius: 12px;
		-moz-border-radius: 12px;
		border-radius: 12px;
		-moz-box-shadow: 1px 1px 3px #000;
		-webkit-box-shadow: 1px 1px 3px #000;
		box-shadow: 1px 1px 3px #000;
	}

	.close:hover { background: #00d9ff; }
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#memberLogin").click(function(){	
			if($("#memberId").val()==""){
				alert("아이디 입력하세요!");
				$("#memberId").focus();
			} else if($("#memberPassworddds").val()==""){
				alert("패스워드 입력하세요!");
				$("#memberPassworddds").focus();
			} else{
				$.ajax({
					type:"post",
					url:"${initParam.root}member_login.do",
					data:"memberId="+$("#memberId").val()+"&memberPassword="+$("#memberPassworddds").val(),
					success:function(data){
						if(data.flag=="ok"){
							location.href="${initParam.root}home.do";
						} else{
							alert("아이디가 존재하지 않거나 일치하지 않습니다.");
							$("#memberId").val("");
							$("#memberPassworddds").val("");
						}
					}
				});
			}
		});
	});
</script>
<nav class="navbar navbar-default"
	style="height: 100px; vertical-align: middle">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand well-lg"  href="${initParam.root }home.do"><img src="${initParam.root }img/logo2.jpg" width="150" height="70"></a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav well-lg" style="font-size: 15px">
				<li><a href="${initParam.root }service_home_usehow.do">서비스안내</a></li>
        		<li><a href="${initParam.root }feeinfo_home_feeinfo.do">요금안내</a></li>        		
				<li><a href="${initParam.root }customercenter_home_notice.do">고객센터</a></li>
				<li><a href="${initParam.root }search_searchForm.do">유카찾기/예약</a></li>
				<c:choose>
					<c:when test="${sessionScope.admin!=null }">
						<li><a href="admin_sharing_List.do">관리자</a></li>
					</c:when>
					<c:when test="${sessionScope.loginInfo!=null }">
						<li><a href="${initParam.root }auth_member_myPage.do?memberId=${sessionScope.loginInfo.memberId}">마이페이지</a></li>
					</c:when>
				</c:choose>
			</ul>
			<ul class="nav navbar-nav navbar-right well-lg" style="width: 300;">
				<c:choose>
					<c:when test="${sessionScope.loginInfo!=null }">
						<li class="active" >
						<a href="#">${sessionScope.loginInfo.memberName }님 로그인</a>
						<li><a href="${initParam.root }member_logout.do">Logout</a></li>
					</c:when>
					<c:when test="${sessionScope.admin!=null }">
						<li class="active">
						<a href="#">${sessionScope.admin.memberName }님 로그인</a>
						<li><a href="${initParam.root }member_logout.do">Logout</a></li>
					</c:when>
					<c:otherwise>
						<li class="active">
						<a href="#openModal">login</a></li>
						<li><a href="${initParam.root }member_register_form.do">Join</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<div id="openModal" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
		<form class="form-horizontal" action="${initParam.root }member_login.do">
  <fieldset>
    <legend>로그인</legend>
    <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 col-lg-offset-2 control-label">Id</label>
      <div class="col-lg-6">
        <input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디">
      </div>
    </div>
    <div class="form-group">
      <label for="inputPassword" class="col-lg-2 col-lg-offset-2 control-label">Password</label>
      <div class="col-lg-6">
        <input type="password" class="form-control" id="memberPassworddds" name="memberPassword" placeholder="비밀번호">
      </div>      
    </div>
    <div class="form-group" >
      <div class="col-lg-10 col-lg-offset-5">
        <button type="button" class="btn btn-primary btn-sm" id="memberLogin" >Login</button>
      	<br>
      </div>
      <div class="col-lg-10 col-lg-offset-2">
      <br>
      <a href="${initParam.root }member_register_form.do">회원가입</a>&nbsp;|
      <a href="${initParam.root }member_findMemberId_form.do" >아이디찾기</a>&nbsp;|
      <a href="${initParam.root }member_findMemberPassword_form.do"  >패스워드찾기</a>
      </div>
    </div>
  </fieldset>
</form>
	</div>
</div>
</nav>
