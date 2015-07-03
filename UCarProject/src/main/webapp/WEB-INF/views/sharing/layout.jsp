<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="${initParam.root }img/logo.jpg" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UCar! 필요할때 언제어디서든 차를 빌리자!</title>
<script type="text/javascript" src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="http://bootswatch.com/simplex/bootstrap.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="header"><tiles:insertAttribute name="header" /></div>
	<div class="container" id="container">
	<div id="main"><tiles:insertAttribute name="main" /></div>
	</div>
	<div id="footer" style="background-color: #F6756F;"><tiles:insertAttribute name="footer" /></div>
</body>
</html>