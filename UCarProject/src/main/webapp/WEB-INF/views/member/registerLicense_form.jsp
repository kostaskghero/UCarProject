<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.css"> 
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.js"></script> 
<script>
	$(document).ready(function(){
		$("#registerLicenseForm").submit(function(){
			if($(":radio[name=licenseType]:checked").length==0){
				alert("면허종류 선택하세요!");
				return false;
			} else if($("#licenseNo1").val()=="" || $("#licenseNo2").val()=="" || $("#licenseNo3").val()==""){
				alert("면허번호 입력하세요!");
				return false;
			} else if($("#licenseRenewalTerm").val()==""){
				alert("갱신기간 만료일 선택하세요!");
				return false;
			} else if($("#licenseIssueDate").val()==""){
				alert("면허발급일 선택하세요!");
				return false;
			} else if($("#licenseBirth").val()==""){
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
		});
		$("#licenseRenewalTerm").datetimepicker({
			minDate: 0,
			ang:'ko',
			format:'Y/m/d',
			timepicker: false
		});
		$("#licenseIssueDate").datetimepicker({
			maxDate: 0,
			startDate:'1960/01/01',
			ang:'ko',
			format:'Y/m/d',
			timepicker: false
		});
		$("#licenseBirth").datetimepicker({
			maxDate: 0,
			startDate:'1980/07/03',
			ang:'ko',
			format:'Y/m/d',
			timepicker: false
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
		<input type="text" name="licenseNo1" maxlength="2" id="licenseNo1">&nbsp;&nbsp;<input type="text" maxlength="6" name="licenseNo2" id="licenseNo2">&nbsp;&nbsp;<input type="text" maxlength="2" name="licenseNo3" id="licenseNo3">
		*지역란 숫자선택 가능 
		</div>	
		<div class="col-md-12">	
			<br>
			<div class = "col-md -5">
			<label for="carModel" class="col-lg-1 control-label">갱신기간 만료일</label>	
			<input type="text" id="licenseRenewalTerm" name="licenseRenewalTerm" value="">
		</div>
		</div>
		<div class="col-md-12">	
			<br>
			<div class = "col-md -5">
			<label for="carModel" class="col-lg-1 control-label">	면허 발급일</label>
		<input type="text" id="licenseIssueDate" name="licenseIssueDate" value="">
		</div>
		</div>
		<div class="col-md-12">	
			<br>
			<div class = "col-md -5">
			<label for="carModel" class="col-lg-1 control-label">생년월일</label>	
		<input type="text" id="licenseBirth" name="licenseBirth" value="">
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
	<div class="form-group" >
      <div class="col-lg-10 col-lg-offset-2">
        <button type="submit" class="btn btn-primary">등록</button>
      </div>
    </div>
</form>
</div>