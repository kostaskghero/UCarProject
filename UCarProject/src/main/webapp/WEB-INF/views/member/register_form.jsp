<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
	$(document).ready(function(){
		// id 중복 체크
		$("#memberIds").keyup(function(){
			$("#idcheckViews").html("");
			$.ajax({
				type:"post",
				url:"${initParam.root}member_idCheck.do",
				data:"memberId="+$("#memberIds").val().trim(),
				success:function(data){					
					if(data.exception!=null){
						$("#idcheckViews").html(data.exception);
						$("#idCheckResults").val("");
					} else{
						$("#idcheckViews").html("아이디 사용가능");
						$("#idCheckResults").val($("#memberIds").val());
					}
				}
			});
		});
		// 공란체크는 validation 으로
		$("#memberRegisterForm").submit(function(){
			if($("#idCheckResult")==""){
				alert("사용할 수 없는 아이디입니다!");
				return false;
			} else if($("#memberPasswords").val()!=$("#memberPasswordCheck").val()){
				alert($("#memberPasswords").val());
				alert($("#memberPasswordCheck").val());
				alert("비밀번호가 일치하지 않습니다!");
				return false;
			} else if(isNaN($("#memberPhone").val())){
				alert("숫자 입력하세요!");
				return false;
			}
		});
	});
</script>
<form:form class="form-horizontal" commandName="memberVO" method="post" action="${initParam.root}member_register.do" id="memberRegisterForm">
  <fieldset>
    <legend>회원가입</legend>
    <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 control-label">Id</label>
      <div class="col-lg-6">
        <form:input path="memberId" type="text" class="form-control" id="memberIds" name="memberId" placeholder="아이디는 4자이상 10자이하" />
        <br><font color="red"><form:errors path="memberId"></form:errors></font>
      </div>
      <!-- ajax 로 처리 -->
      <div class="col-lg-4">
      	<input type="hidden" id="idCheckResults" value="">
        <span id="idcheckViews"></span>
      </div>
    </div>
    <div class="form-group">
      <label for="inputPassword" class="col-lg-2 control-label">Password</label>
      <div class="col-lg-10">
        <form:input path="memberPassword" type="password" class="form-control" id="memberPasswords" name="memberPassword" placeholder="비밀번호는 8자이상 20자이하" />
        <br><font color="red"><form:errors path="memberPassword"></form:errors></font>
      </div>      
    </div>
    <div class="form-group">
      <label for="inputPasswordCheck" class="col-lg-2 control-label">PasswordCheck</label>
      <div class="col-lg-10">
        <input type="password" class="form-control" id="memberPasswordCheck" placeholder="비밀번호를 동일하게 입력하세요">
        <br><span id="passwordCheckView"></span>
      </div>      
    </div>
    <div class="form-group">
      <label for="inputName" class="col-lg-2 control-label">Name</label>
      <div class="col-lg-10">
        <form:input path="memberName" type="text" class="form-control" id="memberName" name="memberName" placeholder="이름" />
        <br><font color="red"><form:errors path="memberName"></form:errors></font>
      </div>
    </div>
    <div class="form-group">
      <label for="inputEmail" class="col-lg-2 control-label">Email</label>
      <div class="col-lg-10">
        <form:input path="memberEmail" type="text" class="form-control" id="memberEmail" name="memberEmail" placeholder="이메일양식에 맞게 입력하세요" />
        <br><font color="red"><form:errors path="memberEmail"></form:errors></font>
      </div>
    </div>
    <div class="form-group">
      <label for="inputPhone" class="col-lg-2 control-label">Phone(-없이)</label>
      <div class="col-lg-10">
        <form:input path="memberPhone" type="text" class="form-control" id="memberPhone" name="memberPhone" placeholder="휴대폰폰번호(-없이)" value="01" />
        <br><font color="red"><form:errors path="memberPhone"></form:errors></font>
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </fieldset>
</form:form>