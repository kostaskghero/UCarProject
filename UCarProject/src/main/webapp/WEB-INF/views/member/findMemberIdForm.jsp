<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form action="${initParam.root}member_findMemberId.do" method="post">
		이  름<input type="text" name="memberName" id="memberName" required="required"><br>
		E-mail<input type="email" name="memberEmail" id="memberEmail" required="required"><br>
		핸드폰<input type="text" name="memberPhone" id="memberPhone" required="required"><br>
		<input type="submit" value="검색">
</form>
</body>
</html>