<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#qnaReply").click(function(){
			if($("#qnaContent").val()==""){
				alert("내용을 입력하세요!");
				return false;
			}
			$("#qnaRepluForm").submit();
		});
		$("#qnaList").click(function(){
			location.href ="${initParam.root }customercenter_home_qna_boardList.do?sessionId=${sessionScope.loginInfo.memberId}";
		});
	});
</script>

<form class="form-horizontal" method="post" action="${initParam.root }admin_qna_reply_register.do" id="qnaRepluForm">
   <fieldset>
    <legend>답글달기</legend>
    <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 control-label">아이디</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="qnaMemberId" name="qnaMemberId" value="admin" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
      <label for="inputTitle" class="col-lg-2 control-label">문의유형</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="qnaCategory" name="qnaCategory" value="${requestScope.qvo.qnaCategory }" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
      <label for="inputTitle" class="col-lg-2 control-label">제목</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" value="${requestScope.qvo.qnaTitle }" readonly="readonly">
      </div>
    </div>

    <div class="form-group">
      <label for="inputContent" class="col-lg-2 control-label">내용</label>
      <div class="col-lg-5">
		<textarea cols="50" rows="10" name="qnaContent" id="qnaContent"  >${requestScope.qvo.qnaContent }</textarea>
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <c:if test="${sessionScope.admin!=null }">
        <button type="submit" class="btn btn-primary" id ="qnaReply">Reply</button>
        </c:if>
     	 <button type="reset" class="btn btn-default"  id ="qnaList" >목록보기</button>
      </div>
    </div>
   </fieldset>
   <input type ="hidden" name = "qnaNo" value ="${requestScope.qvo.qnaNo}">  
   <input type ="hidden" name = "sessionId" value ="${sessionScope.loginInfo.memberId}">  
   <input type="hidden" name="qnaRef" value="${requestScope.qvo.qnaRef }">
 <input type ="hidden" name ="qnaRestep" value = ${requestScope.qvo.qnaRestep }> 
  <input type ="hidden" name ="qnaRelevel" value = ${requestScope.qvo.qnaRelevel }> 
</form>