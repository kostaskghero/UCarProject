<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
	$(document).ready(function(){
		$("#memberUpdateForm").submit(function(){
			var email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
			if(!email_regex.test($("#memberEmail").val())){
				alert("이메일 형식에 맞게 입력하세요!");
				return false;
			} else if(isNaN($("#memberPhone").val())){
				alert("휴대폰번호는 숫자로 입력하세요!");
				return false;
			} else if($("#memberEmail").val()==""){
				alert("이메일 입력하세요!");
				return false;
			} else if($("#memberPhone").val()==""){
				alert("휴대폰번호 입력하세요!");
				return false;
			}
		});
	});
</script>
<h2>회원정보수정</h2>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form:form commandName="memberVO" class="form-horizontal" role="form" action="${initParam.root }auth_member_updateMember.do" method="post" id="memberUpdateForm">
					<div class="form-group">
						<div class="col-sm-2">
							<label for="memberId" class="control-label">ID</label>
						</div>
						<div class="col-sm-10">
							<input readonly="readonly" class="form-control input-sm" id="memberId" name="memberId" value="${sessionScope.loginInfo.memberId }" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label for="memberName" class="control-label">Name</label>
						</div>
						<div class="col-sm-10">
							<input readonly="readonly" class="form-control" id="memberName" name="memberName" value="${sessionScope.loginInfo.memberName }" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label for="memberEmail" class="control-label">Email</label>
						</div>
						<div class="col-sm-10">
							<form:input path="memberEmail" type="text" class="form-control" id="memberEmail" name="memberEmail" value="${sessionScope.loginInfo.memberEmail }" />
							<br><font color="red"><form:errors path="memberEmail"></form:errors></font>
						</div>
					</div>
					<div class="form-group has-feedback">
						<div class="col-sm-2">
							<label for="memberPhone" class="control-label">Phone</label>
						</div>
						<div class="col-sm-10">
							<form:input path="memberPhone" type="text" class="form-control" id="memberPhone" name="memberPhone" value="${sessionScope.loginInfo.memberPhone }" />
							<br><font color="red"><form:errors path="memberPhone"></form:errors></font>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-danger">Update</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>