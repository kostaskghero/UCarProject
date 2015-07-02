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
		$("#registerLicenseForm").submit(function(){
			if($(":radio[name=licenseType]:checked").length==0){
				alert("면허종류 선택하세요!");
				return false;
			} else if($("#licenseNo1").val()=="" || $("#licenseNo2").val()=="" || $("#licenseNo3").val()==""){
				alert("면허번호 입력하세요!");
				return false;
			} else if($("#licenseRenewalTermYear").val()=="" || $("#licenseRenewalTermMonth").val()=="" || $("#licenseRenewalTermDay").val()==""){
				alert("갱신기간 만료일 선택하세요!");
				return false;
			} else if($("#licenseIssueDateYear").val()=="" || $("#licenseIssueDateMonth").val()=="" || $("#licenseIssueDateDay").val()==""){
				alert("면허발급일 선택하세요!");
				return false;
			} else if($("#licenseBirthYear").val()=="" || $("#licenseBirthMonth").val()=="" || $("#licenseBirthDay").val()==""){
				alert("생년월일 선택하세요!");
				return false;
			} else if($(":radio[name=gender]:checked").length==0){
				alert("성별 선택하세요!");
				return false;
			} else if(isNaN($("#licenseNo1").val()) || isNaN($("#licenseNo2").val()) || isNaN($("#licenseNo3").val())){
				alert("숫자로 입력하세요!");
				return false;
			}
			$("#licenseNo").val($("#licenseLocation").val()+" "+$("#licenseNo1").val()+"-"+$("#licenseNo2").val()+"-"+$("#licenseNo3").val());
			$("#licenseRenewalTerm").val($("#licenseRenewalTermYear").val()+"/"+$("#licenseRenewalTermMonth").val()+"/"+$("#licenseRenewalTermDay").val());
			$("#licenseIssueDate").val($("#licenseIssueDateYear").val()+"/"+$("#licenseIssueDateMonth").val()+"/"+$("#licenseIssueDateDay").val());
			$("#licenseBirth").val($("#licenseBirthYear").val()+"/"+$("#licenseBirthMonth").val()+"/"+$("#licenseBirthDay").val());
		});
	});
</script>
<h4>운전면허등록</h4>
<hr>
<div class="container">
<form method="post" action="${initParam.root }auth_member_registerLicense.do" id="registerLicenseForm">
	<input type="hidden" name="memberId" value="${sessionScope.loginInfo.memberId }">
	<div class ="row">
	 <div class="col-md-12">	
		<h4>운전면허</h4>
		<hr>
		<div class = "col-md -5">
			<label for="carModel" class="col-lg-1 control-label">면허종류</label>
		</div>
		<div class = "col-md -1">
			<input type="radio" name="licenseType" id="licenseType"value="1종보통">1종보통 &nbsp;&nbsp;
			<input type="radio" name="licenseType" id="licenseType"value="2종보통">2종보통 &nbsp;&nbsp;
			<input type="radio" name="licenseType" id="licenseType"value="1종대형">1종대형 &nbsp;&nbsp;
		</div>
		<br>
	</div>
	<div class="col-md-12">	
		<div class = "col-md -5">
			<label for="carModel" class="col-lg-1 control-label">면허번호</label>
		</div>
		<input type="hidden" name="licenseNo" id="licenseNo" value="">
		<select id="licenseLocation">
			<c:forEach items="${licenseLocation }" var="location">
				<option value="${location }">${location } </option>
			</c:forEach>
		</select>
		<input type="text" name="licenseNo1" id="licenseNo1">&nbsp;&nbsp;<input type="text" name="licenseNo2" id="licenseNo2">&nbsp;&nbsp;<input type="text" name="licenseNo3" id="licenseNo3">
		*지역란 숫자선택 가능 
		</div>	
		<div class="col-md-12">	
			<br>
			<div class = "col-md -5">
			<label for="carModel" class="col-lg-1 control-label">갱신기간 만료일</label>	
				<input type="hidden" id="licenseRenewalTerm" name="licenseRenewalTerm" value="">
				<!-- 1945년 1월 1일부터 2030년 12월 31일까지/ 월별로 날짜 달라짐 -->
					<select id="licenseRenewalTermYear">
						<option value="">년</option>
						<c:forEach begin="1945" end="2030" step="1" var="year">
						<option value=${year }>${year }년</option>	
					</c:forEach>
				</select>
		<select id="licenseRenewalTermMonth">
			<option value="">월</option>
			<c:forEach begin="1" end="12" step="1" var="month">
				<option value=${month }>${month }월</option>	
			</c:forEach>			
		</select>
		<select id="licenseRenewalTermDay">
			<option value="">일</option>
			<c:forEach begin="1" end="31" step="1" var="day">
				<option value="${day }">${day }일</option>
			</c:forEach>
		</select>
		</div>
		</div>
		<div class="col-md-12">	
			<br>
			<div class = "col-md -5">
			<label for="carModel" class="col-lg-1 control-label">	면허 발급일</label>	

		<input type="hidden" id="licenseIssueDate" name="licenseIssueDate" value="">
		<!-- 1945년 1월 1일부터 현재날짜까지/ 월별로 날짜 달라짐 -->
		<select id="licenseIssueDateYear">
			<option value="">년</option>
			<c:forEach begin="1945" end="2015" step="1" var="year">
				<option value=${year }>${year }년</option>	
			</c:forEach>
		</select>
		<select id="licenseIssueDateMonth">
			<option value="">월</option>
			<c:forEach begin="1" end="12" step="1" var="month">
				<option value=${month }>${month }월</option>	
			</c:forEach>			
		</select>
		<select id="licenseIssueDateDay">
			<option value="">일</option>
			<c:forEach begin="1" end="31" step="1" var="day">
				<option value="${day }">${day }일</option>
			</c:forEach>
		</select>
		</div>
		</div>
		<div class="col-md-12">	
			<br>
			<div class = "col-md -5">
			<label for="carModel" class="col-lg-1 control-label">생년월일</label>	
	
		<input type="hidden" id="licenseBirth" name="licenseBirth" value="">
		<!-- 1930년 1월 1일부터 1994년 현재날짜까지/ 월별로 날짜 달라짐 -->
		<select id="licenseBirthYear">
			<option value="">년</option>
			<c:forEach begin="1945" end="2015" step="1" var="year">
				<option value=${year }>${year }년</option>	
			</c:forEach>
		</select>
		<select id="licenseBirthMonth">
			<option value="">월</option>
			<c:forEach begin="1" end="12" step="1" var="month">
				<option value=${month }>${month }월</option>	
			</c:forEach>			
		</select>
		<select id="licenseBirthDay">
			<option value="">일</option>
			<c:forEach begin="1" end="31" step="1" var="day">
				<option value="${day }">${day }일</option>
			</c:forEach>
		</select>
		</div>
		</div>
		<div class="col-md-12">	
		<br>
		<div class = "col-md -5">
			<label for="carModel" class="col-lg-1 control-label">성별</label>	
	
		<input type="radio" name="gender" id="gender" value="남">남
		<input type="radio" name="gender" id="gender" value="여">여
		<br>
	- 주민등록 상에 기재된 생년월일을 입력해 주세요.
	- 만 21세 미만이거나 운전면허 취득 1년 미만일 경우 승인이 불가합니다.
		</div>
		</div>
	</div>
	<hr>
	<div class="col-md-12">	
		<br>
		<div class = "col-md -12 col-md-offset-8">
	<input type="submit" value="등록">
	</div>
	</div>
</form>
	</div>
	<div class="col-md-12">	
	<br>
	<div class = "col-md -12 col-md-offset-10">
	<a href="${initParam.root }auth_member_registerCard_form.do">결제카드등록</a><br>
	</div>
	</div>
	<div class="col-md-12">	
	<div class = "col-md -12 col-md-offset-10">
	<a href="${initParam.root }auth_member_myPage.do">마이페이지</a><br>
	</div>
	</div> 

