<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>아이디찾기결과</h4>
<hr>
<h4>
	<label for="inputMemberId" class="col-lg-2  col-lg-offset-1 control-label">아이디</label>
</h4>
<div class="col-lg-4">
	<input type="text" class="form-control" id="memberId" name="memberId" value="${requestScope.vo.memberId}" readonly="readonly">
</div>