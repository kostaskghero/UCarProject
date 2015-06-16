<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
<h4><a href="${initParam.root }customercenter_home_notice.do"><img src="${initParam.root }img/notice.png" ><br>공지사항</a></h4><br><br>
<h4><a href="${initParam.root }customercenter_home_fnq.do"><img src="${initParam.root }img/oftenquestion.png" ><br>F n A</a></h4><br><br>
<h4><a href="${initParam.root }customercenter_home_qna.do"><img src="${initParam.root }img/Qna.png" ><br>1:1문의</a></h4><br><br>
<h4><a href="${initParam.root }customercenter_home_qna_boardList.do?sessionId=${sessionScope.loginInfo.memberId}"><img src="#" ><br>1:1문의내용</a></h4><br><br>

</div>












