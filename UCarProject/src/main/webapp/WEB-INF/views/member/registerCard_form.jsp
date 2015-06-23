<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	갱신기간 만료일, 면허 발급일, 유효기간, 면허생년월일(6자리) 체크해야함
	갱신기간 만료일, 면허 발급일, 카드유효기간이 현재 날짜 이전인지 이후인지 체크. 이전이면 안됨
	면허생년월일로 만 21세 이상인지 체크.
	select 로 보여주는 날짜가 동적으로 보여져야함.
	숫자로 입력해야 하는건 숫자만 입력되어 있는지 체크
 -->
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
			} else if($("#cardBirthYear").val()=="" || $("#cardBirthMonth").val()=="" || $("#cardBirthDay").val()==""){
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
			$("#cardBirth").val($("#cardBirthYear").val()+"/"+$("#cardBirthMonth").val()+"/"+$("#cardBirthDay").val());
			$("#cardNo").val($("#cardNo1").val()+"-"+$("#cardNo2").val()+"-"+$("#cardNo3").val()+"-"+$("#cardNo4").val());
		});
	});
</script>
<form method="post" action="${initParam.root }auth_member_registerCard.do" id="registerCardForm">
	<input type="hidden" name="memberId" value="${sessionScope.loginInfo.memberId }">
	<h4>결제카드</h4>
	<hr>
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
		<input type="text" name="cardNo1" id="cardNo1">-<input type="text" name="cardNo2" id="cardNo2">-<input type="text" name="cardNo3" id="cardNo3">-<input type="text" name="cardNo4" id="cardNo4">
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
		<label for="carModel" class="col-lg-2 control-label">생년월일(6자리)</label>
	</div>
		<input type="hidden" id="cardBirth" name="cardBirth" value="">
		<!-- 1930년 1월 1일부터 현재날짜까지/ 월별로 날짜 달라짐 -->
		<select id="cardBirthYear">
			<option value="">년</option>
			<c:forEach begin="1945" end="2015" step="1" var="year">
				<option value=${year }>${year }년</option>	
			</c:forEach>
		</select>
		<select id="cardBirthMonth">
			<option value="">월</option>
			<c:forEach begin="1" end="12" step="1" var="month">
				<option value=${month }>${month }월</option>	
			</c:forEach>			
		</select>
		<select id="cardBirthDay">
			<option value="">일</option>
			<c:forEach begin="1" end="31" step="1" var="day">
				<option value="${day }">${day }일</option>
			</c:forEach>
		</select>
		<br>
		<br>
		<div class = "col-md -5">
		<label for="carModel" class="col-lg-2 control-label">비밀번호(앞2자리)</label>
	</div>
		<input type="password" name="cardPassword" id="cardPassword">**<br>
		<hr>
	<input type="submit" value="등록">
</form>
    