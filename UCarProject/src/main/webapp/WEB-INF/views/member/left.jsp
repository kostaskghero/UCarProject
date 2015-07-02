<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${sessionScope.loginInfo==null }">
		<ul class="nav nav-pills nav-stacked">
			<li><a href="${initParam.root }member_register_form.do">회원가입</a></li>
			<li><a href="#openModal">로그인</a></li>
			<li><a href="${initParam.root }member_findMemberId_form.do">아이디찾기</a></li>
			<li><a href="${initParam.root }member_findMemberPassword_form.do">비밀번호찾기</a></li>
		</ul>
	</c:when>
	<c:otherwise>
		<ul class="nav nav-pills nav-stacked">
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
					회원정보 <span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="${initParam.root}auth_member_updateMember_form.do">회원정보수정</a></li>
					<li><a href="${initParam.root}auth_member_updateMemberPassword_form.do">비밀번호수정</a></li>
					<li><a href="${initParam.root}auth_member_lisenseInfo_view.do?memberId=${sessionScope.loginInfo.memberId }">운전면허정보</a></li>
					<li><a href="${initParam.root}auth_member_cardInfo_view.do?memberId=${sessionScope.loginInfo.memberId }">카드정보</a></li>
				</ul>
			</li>
			<li><a href="${initParam.root}auth_memberSharing_reservationHistory.do">예약내역</a></li>
			<li><a href="${initParam.root}auth_member_getPointListByMemberId.do">포인트내역</a></li>
			<li><a href="${initParam.root}member_logout.do">로그아웃</a></li>
			<li><a href="${initParam.root}auth_member_delete_form.do">회원탈퇴</a></li>
		</ul>
	</c:otherwise>
</c:choose>
