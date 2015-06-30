<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 로그아웃 상태이면 로그인 링크 제공
        로그인 상태이면 로그아웃 링크 제공 
        로그인과 로그아웃을 구현해본다. 
 --%>
 <br>
<%-- <c:choose>
	<c:when test="${sessionScope.mvo==null}">
	<a href="${initParam.root}member_login_form.do">로그인</a><br>
	<a href="${initParam.root}member_register_form.do">회원가입</a><br>
	</c:when>
	<c:otherwise>
	<a href="${initParam.root}member_logout.do">로그아웃</a>
	</c:otherwise>
</c:choose>
 --%>
 <h4><a href="${initParam.root}admin_member_list.do">회원목록</a></h4>
<hr>
<h4><a href="${initParam.root}admin_carModelRegisterForm.do">차량 모델 등록</a></h4><br>
<h4><a href="${initParam.root}admin_carModel_list.do">차량 모델 목록</a></h4><br>
<h4><a href="${initParam.root}admin_carRegisterForm.do">차량등록</a></h4><br>
<h4><a href="${initParam.root}admin_car_list.do">차량목록</a></h4>
<hr>
<h4><a href="${initParam.root}admin_uCarZoneRegisterForm.do">유카존 등록</a></h4><br>
<h4><a href="${initParam.root}admin_uCarZone_list.do">유카존 목록</a></h4>

<hr>
<h4><a href="${initParam.root}admin_sharing_List.do">예약/결제/반납 내역</a></h4>
<hr>
<h4><a href="${initParam.root }admin_customercenter_home_qna_boardList.do?sessionId=${sessionScope.admin.memberId}">이용후기 관리</a></h4>
<hr>
<h4><a href="${initParam.root }admin_pointHistoryList.do">포인트 내역</a></h4>
<br>





