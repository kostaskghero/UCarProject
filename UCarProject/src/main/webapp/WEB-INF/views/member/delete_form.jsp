<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		$("#deleteForm").submit(function(){
			if($("#memberPassword").val()==""){
				alert("비밀번호 입력하세요!");
				$("#memberPassword").focus();
				return false;
			} else if($("#memberPassword").val()!="${sessionScope.loginInfo.memberPassword}"){
				alert("비밀번호 다시 입력하세요!");
				$("#memberPassword").val("").focus();
				return false;
			}
		});
	});
</script>
탈퇴하시겠습니까
<form method="post" action="${initParam.root }auth_member_deleteMember.do" id="deleteForm">
	아이디<input readonly="readonly" name="memberId" value="${sessionScope.loginInfo.memberId }"><br>
	패스워드<input type="password" name="memberPassword" id="memberPassword"><br>
	<input type="submit" value="탈퇴">
</form>