<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form action="member_findMemberPassword.do" method="post">
아이디<input type="text" name="memberId" id="memberId" required="required"><br>
이   름<input type="text" name="memberName" id="memberName" required="required"><br>
E-mail<input type="email" name="memberEmail" id="memberEmail" required="required"><br>
휴대폰<input type="text" name="memberPhone" id="memberPhone" required="required"><br>
<input type="submit" value="검색">  
</form>
</body>
</html>