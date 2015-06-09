<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원등록페이지</h3>
<form action="member_register.do" method="post">
아이디 <input type="text" name="id"><br>
패스워드 <input type="password" name="password"><br>
이메일 <input type="text" name="email"><br>
전화번호 <input type="text" name="phone"><br>
생년월일<input type="text" name="birth"><br>
<input type="submit" value="회원가입">
</form>
</body>
</html>