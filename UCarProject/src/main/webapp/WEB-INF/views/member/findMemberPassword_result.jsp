<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3><label for="inputMemberPassword" class="col-lg-2  col-lg-offset-1 control-label">패스워드</label></h3>
      <div class="col-lg-4">
        <input type="text" class="form-control" id="memberPassword" name="memberPassword" value="${requestScope.vo.memberPassword }" readonly="readonly">
      </div> 
			<div class="col-lg-4 col-lg-offset-3">
			<br><br>
        <a href="#openModal" class="btn btn-primary" role="button">로그인</a>
   </div> 