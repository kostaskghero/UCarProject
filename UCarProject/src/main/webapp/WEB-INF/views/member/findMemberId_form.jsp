<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#serchId").click(function(){	
			if($("#memberName").val()==""){
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
			$("#serchIdForm").submit();
		});
	});
</script>
<h4>아이디찾기</h4>
<hr>
<c:if test="${flag =='fail' }">
	<script>
		alert("아이디가 존재하지 않습니다!");
	</script>
</c:if>
<form action="${initParam.root}member_findMemberId.do" method="post" id="serchIdForm">
<div class="form-group">
	<label for="inputMemberName" class="col-lg-1 col-lg-offset-1 control-label">이름</label>
		<div class="col-lg-6">
			<input type="text" class="form-control" id="memberName" name="memberName" placeholder="아이디">
		</div>
		<br>
	</div>
		<div class="form-group">
			<br>
			<label for="inputMemberEmail" class="col-lg-1 col-lg-offset-1 control-label">E-mail</label>
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
		<button type="button" class="btn btn-primary" id="serchId" >검색</button>
	</div>
</form>