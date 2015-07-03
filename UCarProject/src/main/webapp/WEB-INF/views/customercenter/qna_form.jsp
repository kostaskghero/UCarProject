<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#inquiretypeForm").submit(function(){
			if($("#qnaTitle").val()==""){
				alert("제목을 입력하세요!");
				return false;
			}
			else if($("#categoryType").val()==""){
				alert("문의내역 선택하세요!");
				return false;
			}else if($("#qnaContent").val()==""){
				alert("내용을 입력하세요!");
				return false;
			}
			$("#qnaCategory").val($("#categoryType").val());
		});
	});
</script>
<c:choose>
<c:when test="${sessionScope.loginInfo!=null ||sessionScope.admin!=null }">
<form class="form-horizontal" method="post" action="${initParam.root }qna_register.do" id="inquiretypeForm">
   <fieldset>
    <legend>1:1 문의 하기</legend>
    <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 control-label">아이디</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="qnamemberId" name="qnamemberId" value="${sessionScope.loginInfo.memberId }" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
      <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="memberEmail" name="memberEmail" value="${sessionScope.loginInfo.memberEmail }" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
      <label for="inputPhone" class="col-lg-2 control-label">핸드폰</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="memberPhone" name="memberPhone" value="${sessionScope.loginInfo.memberPhone }" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
      <label for="inputPhone" class="col-lg-2 control-label">제목</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" placeholder="제목을 입력하세요">
      </div>
    </div>
    <div class="form-group">
      <label for="inputInquire" class="col-lg-2 control-label">문의 유형</label>
      <input type="hidden" name="qnaCategory" id="qnaCategory" value="">
      <div class="col-lg-2">
        <select class="form-control" id="categoryType">
        	<option value="">문의유형</option>
        	<option value="예약/결제문의">예약/결제문의</option>
        		<option value="가입문의">가입문의</option>
        		<option value="차량이용/사고">차량이용/사고</option>
        		<option value="불편접수/건의">불편접수/건의</option>
        		<option value="탈퇴">탈퇴</option>
        		<option value="기타">기타</option>
        </select>
   	 </div>
    </div>
    <div class="form-group">
      <label for="inquireContext" class="col-lg-2 control-label">문의 내용</label>
      <div class="col-lg-5" >
        <textarea cols="50" rows="10" name="qnaContent" id="qnaContent"placeholder="문의내용을 입력하세요!"></textarea>
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
       
        <button type="reset" class="btn btn-default">취소</button>
         <button type="submit" class="btn btn-primary">작성</button>
      </div>
    </div>
  </fieldset>
 <%--  <input type ="hidden" name = "sessionId" value ="${sessionScope.admin.memberId}">   --%>
</form>
</c:when>
</c:choose>
