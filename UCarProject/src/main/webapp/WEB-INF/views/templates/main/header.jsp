<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-default" style="height: 100px; vertical-align: middle">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand well-lg" href="${initParam.root }home.do">로고이미지</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
      <ul class="nav navbar-nav well-lg" style="font-size: 20px">
        <li><a href="${initParam.root }service_home_usehow.do">서비스안내</a></li>
        <li><a href="${initParam.root }feeinfo_home_feeinfo.do">요금안내</a></li>
        <li><a href="${initParam.root }auth_member_myPage.do">마이페이지</a></li>
        <li><a href="#">유카찾기/예약</a></li>
         <li><a href="${initParam.root }customercenter_home_notice.do">고객센터</a></li>
                 <li><a href="admin_pageView.do">관리자</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right well-lg">
        <c:choose>
         <c:when test="${sessionScope.loginInfo!=null }">
         	<li>${sessionScope.loginInfo.memberName }님 로그인</li>
            <li class="active"><a href="${initParam.root }member_logout.do">Logout</a></li>
            </c:when>
         <c:otherwise>
            <li class="active"><a href="${initParam.root }member_login_form.do">Login</a></li>
            <li><a href="${initParam.root }member_register_form.do">Join</a></li>
         </c:otherwise>
      </c:choose>
      </ul>
    </div>
  </div>
</nav>
