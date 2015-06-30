<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <h3><label for="inputMemberId" class="col-lg-2  col-lg-offset-1 control-label">아이디</label></h3>
      <div class="col-lg-4">
        <input type="text" class="form-control" id="memberId" name="memberId" value="${requestScope.vo.memberId}" readonly="readonly">
      </div> 
			<div class="col-lg-4 col-lg-offset-3">
			<br><br>
        <a href="${initParam.root }member_findMemberPasswordForm.do" class="btn btn-primary" role="button">비밀번호 찾기</a>
   </div> 