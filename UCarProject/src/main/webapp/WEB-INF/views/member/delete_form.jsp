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
<h4>탈퇴하시겠습니까</h4>
<hr>
<form method="post" action="${initParam.root }auth_member_deleteMember.do" id="deleteForm">
	 <label for="inputMemberId" class="col-lg-2 col-lg-offset-1 control-label">아이디</label>
	<div class="col-lg-8">
		<input readonly="readonly" name="memberId" value="${sessionScope.loginInfo.memberId }"><br>
	</div>
	<br><br>
	<label for="inputMemberId" class="col-lg-2 col-lg-offset-1 control-label">패스워드</label>
	<div class="col-lg-8">
		<input type="password" name="memberPassword" id="memberPassword"><br>
	</div>
	<br><br>
	<div class="col-lg-9 col-lg-offset-5">
	<input type="submit" value="탈퇴">
	</div>
</form>