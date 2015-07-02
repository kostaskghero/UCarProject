<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="nav nav-pills nav-stacked">
	<li><a href="${initParam.root}admin_member_list.do">회원목록</a></li>
	<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
			차량모델관리 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="${initParam.root}admin_carModelRegisterForm.do">차량모델등록</a></li>
			<li><a href="${initParam.root}admin_carModel_list.do">차량모델목록</a></li>
		</ul>
	</li>
	<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
			차량관리 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="${initParam.root}admin_carRegisterForm.do">차량등록</a></li>
			<li><a href="${initParam.root}admin_car_list.do">차량목록</a></li>
		</ul>
	</li>
	<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
			유카존관리 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="${initParam.root}admin_uCarZoneRegisterForm.do">유카존등록</a></li>
			<li><a href="${initParam.root}admin_uCarZone_list.do">유카존목록</a></li>
		</ul>
	</li>
	<li><a href="${initParam.root}admin_sharing_List.do">예약/결제/반납 내역</a></li>
	<li><a href="${initParam.root }admin_customercenter_home_qna_boardList.do?sessionId=${sessionScope.admin.memberId}">이용후기 관리</a></li>
	<li><a href="${initParam.root }admin_pointHistoryList.do">포인트 내역</a></li>
</ul>
