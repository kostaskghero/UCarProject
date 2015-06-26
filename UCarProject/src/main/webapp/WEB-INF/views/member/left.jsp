<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${sessionScope.loginInfo==null }">
	<h4><a href="${initParam.root}member_login_form.do">로그인</a></h4><br>
	<h4><a href="${initParam.root}member_register_form.do">회원가입</a></h4><br>
	</c:when>
	<c:otherwise>
	<h5><a href="${initParam.root}auth_member_delete_form.do">회원탈퇴</a></h5><br>
	<h5><a href="${initParam.root}auth_member_updateMember_form.do">회원정보수정</a></h5><br>
	<h5><a href="${initParam.root}auth_member_updateMemberPassword_form.do">비밀번호수정</a></h5><br>
	<h5><a href="${initParam.root}auth_memberSharing_reservationHistory.do">예약내역관리</a></h5><br>
	<h5><a href="${initParam.root}">포인트/쿠폰관리</a></h5><br>
	<h5><a href="${initParam.root}">즐겨찾는유카존관리</a></h5><br>
	<h5><a href="${initParam.root}member_logout.do">로그아웃</a></h5>
	</c:otherwise>
</c:choose>
	