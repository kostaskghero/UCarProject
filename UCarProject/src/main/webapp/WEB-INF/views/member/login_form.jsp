<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#memberLogin").click(function(){
			$.ajax({
				type:"post",
				url:"${initParam.root}member_login.do",
				data:"memberId="+$("#memberId").val()+"&memberPassword="+$("#memberPassword").val(),
				success:function(data){
					if(data.flag=="ok"){
						location.href="${initParam.root}home.do";
					} else{
						alert("로그인실패");
					}
				}
			});
		});
	});
</script>
<form class="form-horizontal" action="${initParam.root }member_login.do">
  <fieldset>
    <legend>로그인</legend>
    <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 control-label">Id</label>
      <div class="col-lg-6">
        <input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디">
      </div>
    </div>
    <div class="form-group">
      <label for="inputPassword" class="col-lg-2 control-label">Password</label>
      <div class="col-lg-6">
        <input type="password" class="form-control" id="memberPassword" name="memberPassword" placeholder="비밀번호">
      </div>      
    </div>
    <div class="form-group" >
      <div class="col-lg-10 col-lg-offset-2">
        <button type="button" class="btn btn-primary" id="memberLogin" >Login</button>
      </div>
    </div>
  </fieldset>
</form>