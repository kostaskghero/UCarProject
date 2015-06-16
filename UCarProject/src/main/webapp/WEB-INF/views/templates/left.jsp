<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h4><a href="${initParam.root}member_find.do">회원검색</a></h4>
<%-- 로그아웃 상태이면 로그인 링크 제공
        로그인 상태이면 로그아웃 링크 제공 
        로그인과 로그아웃을 구현해본다. 
 --%>
 <br>
<c:choose>
	<c:when test="${sessionScope.mvo==null}">
	<h4><a href="${initParam.root}member_login_form.do">로그인</a></h4><br>
	<h4><a href="${initParam.root}member_register_form.do">회원가입</a></h4><br>
	</c:when>
	<c:otherwise>
	<h4><a href="${initParam.root}member_logout.do">로그아웃</a></h4>
	</c:otherwise>
</c:choose>
<h4><a href="${initParam.root}member_fileupload_form.do">파일업로드</a></h4><br>
<a href="${initParam.root}auth_member_delete_form.do">auth_member_delete_form.do(회원탈퇴)</a><br>
<a href="${initParam.root}auth_member_updateMember_form.do">auth_member_updateMember_form.do(회원정보수정폼)</a><br>
<a href="${initParam.root}auth_member_updateMemberPassword_form.do">auth_member_updateMemberPassword_form.do(비밀번호수정폼)</a><br>