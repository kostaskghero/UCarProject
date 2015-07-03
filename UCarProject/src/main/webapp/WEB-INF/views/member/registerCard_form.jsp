<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.css"> 
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.js"></script> 
<script>
	$(document).ready(function(){
		$("#registerCardForm").submit(function(){
			if($(":radio[name=cardType]:checked").length==0){
				alert("카드종류 선택하세요!");
				return false;
			} else if($("#cardNo1").val()=="" || $("#cardNo2").val()=="" || $("#cardNo3").val()=="" || $("#cardNo4").val()==""){
				alert("카드번호 입력하세요!");
				return false;
			} else if($("#cardExpirationDateMonth").val()=="" || $("#cardExpirationDateYear").val()==""){
				alert("카드유효기간 선택하세요!");
				return false;
			} else if($("#cardBirth").val()==""){
				alert("생일 선택하세요!");
				return false;
			} else if($("#cardPassword").val()==""){
				alert("비밀번호 입력하세요!");
				$("#cardPassword").focus();
				return false;
			} else if(isNaN($("#cardNo1").val()) || isNaN($("#cardNo2").val()) || isNaN($("#cardNo3").val()) || isNaN($("#cardNo4").val()) || isNaN($("#cardPassword").val())){
				alert("숫자로 입력하세요!");
				return false;
			} else if($("#cardPassword").val().length>2){
				alert("비밀번호는 앞 2자리만 입력하세요!");
				return false;
			}
			$("#cardExpirationDate").val($("#cardExpirationDateYear").val()+"/"+$("#cardExpirationDateMonth").val());
			$("#cardNo").val($("#cardNo1").val()+"-"+$("#cardNo2").val()+"-"+$("#cardNo3").val()+"-"+$("#cardNo4").val());
		});
		$("#cardBirth").datetimepicker({
			maxDate: 0,
			startDate:'1980/07/03',
			ang:'ko',
			format:'Y/m/d',
			timepicker: false
		});
	});	
</script>
<h4>결제카드등록</h4>
<hr>
<form method="post" action="${initParam.root }auth_member_registerCard.do" id="registerCardForm">
	<input type="hidden" name="memberId" value="${sessionScope.loginInfo.memberId }">
	<div class = "col-md -5">
		<label for="carModel" class="col-lg-2 control-label">카드종류</label>
	</div>
	<div class = "col-md -1">
			<input type="radio" name="cardType" id="cardType"value="개인카드">개인카드&nbsp;&nbsp;
		<input type="radio" name="cardType" id="cardType"value="법인카드">법인카드 &nbsp;&nbsp;
		</div>
	<br>
	<div class = "col-md -5">
		<label for="carModel" class="col-lg-2 control-label">카드번호</label>
	</div>
		<input type="hidden" id="cardNo" name="cardNo" value="">
		<input type="text" maxlength="4" name="cardNo1" id="cardNo1">-<input type="text" maxlength="4" name="cardNo2" id="cardNo2">-<input type="text" maxlength="4" name="cardNo3" id="cardNo3">-<input type="text" maxlength="4" name="cardNo4" id="cardNo4">
		<br>
	<br>
	<div class = "col-md -5">
		<label for="carModel" class="col-lg-2 control-label">유효기간</label>
	</div>

		<input type="hidden" id="cardExpirationDate" name="cardExpirationDate" value="">
		<select id="cardExpirationDateMonth">
			<option value="">월</option>
			<c:forEach begin="1" end="12" step="1" var="month">
				<option value=${month }>${month }월</option>	
			</c:forEach>			
		</select>
		<select id="cardExpirationDateYear">
			<option value="">년</option>
			<c:forEach begin="2015" end="2034" step="1" var="year">
				<option value="${year }">${year }년</option>
			</c:forEach>
		</select>
		<br>
		<br>
		<div class = "col-md -5">
		<label for="carModel" class="col-lg-2 control-label">생년월일</label>
	</div>
		<input type="text" id="cardBirth" name="cardBirth" value="">
		<br>
		<br>
		<div class = "col-md -5">
		<label for="carModel" maxlength="2" class="col-lg-2 control-label">비밀번호(앞2자리)</label>
	</div>
		<input type="password" name="cardPassword" id="cardPassword">**<br>
		<hr>
	<div class="form-group" >
      <div class="col-lg-10 col-lg-offset-2">
        <button type="submit" class="btn btn-primary">등록</button>
      </div>
    </div>
</form>
    