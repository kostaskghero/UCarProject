<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		$("#deleteBtn").click(function(){
			if($("#memberPassword").val()==""){
				alert("비밀번호 입력하세요!");
				$("#memberPassword").focus();
				return false;
			} else{
				$.ajax({
					type:"post",
					url:"${initParam.root}auth_member_deleteMember.do",
					data:$("#deleteForm").serialize(),
					success:function(data){					
						if(data=="ok"){
							location.href="${initParam.root}member_logout.do";
						} else if(data=="fail"){
							alert("비밀번호가 일치하지 않습니다!");
							$("#memberPassword").val("").focus();
						} else {
							location.href="${initParam.root}member_login.do";
						}
					}
				});
			}
		});
	});
</script>
<<<<<<< HEAD
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
=======
<form class="form-horizontal" method="post" action="${initParam.root }auth_member_deleteMember.do" id="deleteForm">
  <fieldset>
    <legend>회원탈퇴</legend>
    <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 control-label">Id</label>
      <div class="col-lg-6">
        <input readonly="readonly" class="form-control" name="memberId" value="${sessionScope.loginInfo.memberId }">
      </div>
    </div>
    <div class="form-group">
      <label for="inputPassword" class="col-lg-2 control-label">Password</label>
      <div class="col-lg-6">
        <input type="password" class="form-control" name="memberPassword" id="memberPassword" placeholder="비밀번호">
      </div>      
    </div>
    <div class="form-group" >
      <div class="col-lg-10 col-lg-offset-2">
        <button type="button" class="btn btn-primary" id="deleteBtn" >탈퇴</button>
      </div>
    </div>
  </fieldset>
>>>>>>> branch 'master' of https://github.com/kostaskghero/UCarProject.git
</form>
