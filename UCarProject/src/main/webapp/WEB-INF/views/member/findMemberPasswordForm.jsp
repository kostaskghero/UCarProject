<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
	$(document).ready(function(){
		$("#serchPassword").click(function(){	
			if($("#memberIdds").val()==""){
				alert("아이디를 입력하세요");
				$("#memberIdds").focus();
				return false;
			} else if($("#memberName").val()==""){
				alert("이름을 입력하세요");
				$("#memberName").focus();
				return false;
			} else if($("#memberEmail").val()==""){
				alert("이메일을 입력하세요");
				$("#memberEmail").focus();
				return false;
			} else if($("#memberPhone").val()==""){
				alert("핸드폰번호를 입력하세요");
				$("#memberPhone").focus();
				return false;
			} 
			$("#serchPasswordForm").submit();
		});
	});
</script>
<form action="member_findMemberPassword.do" method="post" id="serchPasswordForm">
<div class="form-group">
      <label for="inputMemberId" class="col-lg-1 col-lg-offset-1 control-label">아이디</label>
      <div class="col-lg-6">
        <input type="text" class="form-control" id="memberIdds" name="memberId" placeholder="아이디">
      </div>
          <br>
    </div>
<div class="form-group">
<br>
      <label for="inputMemberName" class="col-lg-1 col-lg-offset-1 control-label">이름</label>
      <div class="col-lg-6">
        <input type="text" class="form-control" id="memberName" name="memberName" placeholder="아이디">
      </div>
          <br>
    </div>
    <div class="form-group">
    <br>
      <label for="inputMemberEmail" class="col-lg-1 col-lg-offset-1 control-label">이메일</label>
      <div class="col-lg-6">
        <input type="text" class="form-control" id="memberEmail" name="memberEmail" placeholder="이메일">
      </div>
          <br>
    </div>
      <div class="form-group">
       <br>
      <label for="inputMemberPhone" class="col-lg-1 col-lg-offset-1 control-label">핸드폰</label>
      <div class="col-lg-6">
        <input type="text" class="form-control" id="memberPhone" name="memberPhone" placeholder="핸드폰">
      </div>
      <br>
    </div>
    <div class="col-lg-7 col-lg-offset-7">
         <br>
     	 <button type="button" class="btn btn-primary" id="serchPassword" >검색</button>
      </div>
<!-- <input type="submit" value="검색">   -->
</form>
