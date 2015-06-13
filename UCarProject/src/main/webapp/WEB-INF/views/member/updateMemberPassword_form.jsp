<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		$("#memberPasswordUpateForm").submit(function(){
			if($("#oriMemberPassword").val()!="${sessionScope.loginInfo.memberPassword}"){
				alert("기존 패스워드가 일치하지 않습니다!");
				return false;
			} else if($("#memberPassword").val()!=$("#memberPasswordCheck").val()){
				alert("새로운 패스워드가 일치하지 않습니다!");
				return false;
			} else if($("#oriMemberPassword").val()=="" || $("#memberPassword").val()=="" || $("#memberPasswordCheck").val()==""){
				alert("패스워드 입력하세요!");
				return false;
			} else if($("#memberPassword").val().length>20 || $("#memberPassword").val().length<8){
				alert("패스워드는 8자이상 20자이하");
				return false;
			}
		});
	});
</script>
패스워드변경
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" role="form" method="post" id="memberPasswordUpateForm" action="${initParam.root }auth_member_updateMemberPassword.do">
				<input type="hidden" name="memberId" value="${sessionScope.loginInfo.memberId }">
				<div class="form-group">
					<div class="col-sm-2">
						<label for="oriMemberPassword" class="control-label">기존 Password</label>
					</div>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="oriMemberPassword" name="oriMemberPassword" placeholder="기존 password 입력하세요">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2">
						<label for="memberPassword" class="control-label">새로운 Password</label>
					</div>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="memberPassword" name="memberPassword" placeholder="변경할 password 입력하세요">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2">
						<label for="memberPasswordCheck" class="control-label">새로운 Password 확인</label>
					</div>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="memberPasswordCheck" name="memberPasswordCheck" placeholder="변경할 password 를 한번 더 입력하세요">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-danger">update</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>