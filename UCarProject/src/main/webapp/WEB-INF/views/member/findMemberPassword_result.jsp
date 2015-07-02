<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>비밀번호찾기결과</h4>
<hr>
<h4>
	<label for="inputMemberPassword" class="col-lg-2  col-lg-offset-1 control-label">패스워드</label>
</h4>
<div class="col-lg-4">
	<input type="text" class="form-control" id="memberPassword" name="memberPassword" value="${requestScope.vo.memberPassword }" readonly="readonly">
</div>