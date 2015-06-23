<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#reviewWrite").click(function(){
			if($("#reviewTitle").val()==""){
				alert("제목을 입력하세요!");
				return false;
			}else if($("#reviewContent").val()==""){
				alert("내용을 입력하세요!");
				return false;
			}
			$("#reviewWriteForm").submit();
		});
		$("#reviewCancel").click(function(){
			location.href = "${initParam.root }customercenter_review_list.do";
		});
	});
</script>

<form class="form-horizontal" method="post" action="${initParam.root }auth_review_write.do" id="reviewWriteForm">
   <fieldset>
    <legend>이용후기 쓰기</legend>
    <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 control-label">아이디</label>
      <div class="col-lg-5">
      <c:choose>
		<c:when test="${sessionScope.loginInfo != null}">
        <input type="text" class="form-control" id="memberId" name="memberId" value="${sessionScope.loginInfo.memberId }" readonly="readonly">
      </c:when>
      <c:when test="${sessionScope.admin != null}">
              <input type="text" class="form-control" id="memberId" name="memberId" value="${sessionScope.admin.memberId }" readonly="readonly">
      
      </c:when>
      </c:choose>
      </div>
    </div>
    <div class="form-group">
      <label for="inputTitle" class="col-lg-2 control-label">제목</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="reviewTitle" name="reviewTitle" placeholder="제목을 입력하세요">
      </div>
    </div>
    <div class="form-group">
      <label for="inputContent" class="col-lg-2 control-label">내용</label>
      <div class="col-lg-5">
       <textarea cols="50" rows="10" name="reviewContent" id="reviewContent" placeholder="내용을 입력하세요!"></textarea>
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
         <button type="reset" class="btn btn-default"  id = "reviewCancel">취소</button>
        <button type="submit" class="btn btn-primary" id ="reviewWrite">작성</button>
     
      </div>
    </div>
  </fieldset>
</form>


