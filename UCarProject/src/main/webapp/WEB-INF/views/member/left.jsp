<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="dropdown">
  <button class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    메뉴선택
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
  <c:choose>
  <c:when test="${sessionScope.loginInfo==null }">
    <li role="presentation"><a role="menuitem" tabindex="-1" href="${initParam.root}member_login_form.do">로그인</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="${initParam.root}member_register_form.do">회원가입</a></li>
    </c:when>
    <c:otherwise>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="${initParam.root}auth_member_updateMember_form.do">회원정보수정</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="${initParam.root}auth_member_updateMemberPassword_form.do">비밀번호수정</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="${initParam.root}auth_memberSharing_reservationHistory.do">예약내역관리</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="${initParam.root}auth_member_getPointListByMemberId.do">포인트</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="${initParam.root}member_logout.do">로그아웃</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="${initParam.root}auth_member_lisenseInfo_view.do?memberId=${sessionScope.loginInfo.memberId }">운전면허정보</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="${initParam.root}auth_member_cardInfo_view.do?memberId=${sessionScope.loginInfo.memberId }">카드정보</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="${initParam.root}auth_member_delete_form.do">회원탈퇴</a></li>
    </c:otherwise>
    </c:choose>
  </ul>
</div>	

