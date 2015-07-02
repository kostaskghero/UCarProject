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
<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
          		<label for="inputMemberId" class="col-lg-1 col-lg-offset-1 control-label">아이디</label>
				<div class="col-lg-3">
				<input readonly="readonly" class="form-control" name="memberId" value="${sessionScope.loginInfo.memberId }"><br>
				</div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
          		<label for="inputMemberId" class="col-lg-1 col-lg-offset-1 control-label">패스워드</label>
				<div class="col-lg-3">
				<input type="password" class="form-control" name="memberPassword" id="memberPassword"><br>
	</div>
          </div>
        </div>
        <div class="col-lg-9 col-lg-offset-4">
	<button type="button" class="btn btn-primary" id="carSearchBtn">탈퇴</button>
	</div>
      </div>
    </div>
</form>