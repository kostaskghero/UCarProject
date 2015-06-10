<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#memberRegister").submit(function(){
			
		});
	});
</script>
<div class="col-lg-8">
<form class="form-horizontal">
  <fieldset>
    <legend>회원가입</legend>
    <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 control-label">Id</label>
      <div class="col-lg-6">
        <input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디는 4자이상 10자이하">
      </div>
      <!-- 버튼으로 하거나 ajax 로 처리 -->
      <div class="col-lg-4">
        <input type="button" class="btn btn-default" id="checkId" name="checkId" value="중복확인">
      </div>
    </div>
    <div class="form-group">
      <label for="inputPassword" class="col-lg-2 control-label">Password</label>
      <div class="col-lg-10">
        <input type="password" class="form-control" id="memberPassword" name="memberPassword" placeholder="비밀번호는 8자이상 20자이하">
      </div>      
    </div>
    <div class="form-group">
      <label for="inputPasswordCheck" class="col-lg-2 control-label">PasswordCheck</label>
      <div class="col-lg-10">
        <input type="password" class="form-control" id="memberPasswordCheck" placeholder="비밀번호를 동일하게 입력하세요">
      </div>      
    </div>
    <div class="form-group">
      <label for="inputName" class="col-lg-2 control-label">Name</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름">
      </div>
    </div>
    <div class="form-group">
      <label for="inputEmail" class="col-lg-2 control-label">Email</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" id="memberEmail" name="memberEmail" placeholder="이메일양식에 맞게 입력하세요">
      </div>
    </div>
    <div class="form-group">
      <label for="inputPhone" class="col-lg-2 control-label">Phone</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" id="memberPhone" name="memberPhone" placeholder="휴대폰폰번호(-없이)">
      </div>
    </div>
    <div class="form-group">
      <label for="inputBirth" class="col-lg-2 control-label">Birth</label>
      <div class="col-lg-2">
        <select class="form-control" id="birthYear">
        	<option value="">년</option>
        	<c:forEach begin="1900" end="2015" step="1" var="year">
        		<option value="${year }">${year }년</option>
        	</c:forEach>
        </select>
      </div>
      <div class="col-lg-2">
        <select class="form-control" id="birthMonth">
        	<option value="">월</option>
        	<c:forEach begin="1" end="12" step="1" var="month">
        		<option value="${month }">${month }월</option>
        	</c:forEach>
        </select>
      </div>
      <div class="col-lg-2">
        <select class="form-control" id="birthDay">
        	<option value="">일</option>
        	<c:forEach begin="1" end="31" step="1" var="day">
        		<option value="${day }">${day }일</option>
        	</c:forEach>
        </select>
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary" id="memberRegister">Submit</button>
      </div>
    </div>
  </fieldset>
</form>
</div>