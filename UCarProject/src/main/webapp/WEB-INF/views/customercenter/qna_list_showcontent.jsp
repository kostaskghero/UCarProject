<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript">
	$(document).ready(function(){
		$("#qnaReply").click(function(){
			$("#qnaReplyForm").submit();
		});
		$("#qnaList").click(function(){
			location.href ="${initParam.root }auth_customercenter_home_qna_boardList.do";
		});
	});
</script>

<form class="form-horizontal" method="post" action="${initParam.root }admin_qna_reply_form.do" id="qnaReplyForm">
   <fieldset>
    <legend>1:1 상세내용</legend>
    <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 control-label">아이디</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="qnaMemberId" name="qnaMemberId" value="${requestScope.data.qvo.qnaMemberId }" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
      <label for="inputTitle" class="col-lg-2 control-label">문의유형</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="qnaCategory" name="qnaCategory" value="${requestScope.data.qvo.qnaCategory }" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
      <label for="inputTitle" class="col-lg-2 control-label">제목</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" value="${requestScope.data.qvo.qnaTitle }" readonly="readonly">
      </div>
    </div>

    <div class="form-group">
      <label for="inputContent" class="col-lg-2 control-label">내용</label>
      <div class="col-lg-5">
		<%-- <textarea cols="50" rows="10" name="qnaContent" id="qnaContent"  readonly="readonly">${requestScope.data.qvo.qnaContent }</textarea> --%>
     	<div class="jumbotron">${requestScope.data.qvo.qnaContent }</div>
      </div>
    </div>
        <c:if test="${requestScope.data.replyList.size()!=0}">
        <legend>1:1 답변</legend>
		<div class="form-group">
		<%-- 	${requestScope.data.replyList} --%>
			<c:forEach items="${requestScope.data.replyList}" var="reply">
				<div class="form-group">
					<label for="inputTitle" class="col-lg-2 control-label">제목</label>
					<div class="col-lg-5">
						<input type="text" class="form-control" id="replyTitle"
							name="replyTitle" value="${reply.qnaTitle}" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="inputTitle" class="col-lg-2 control-label">내용</label>
					<div class="col-lg-5">
						<div class="jumbotron">${reply.qnaContent}</div>
					</div>
				</div>
			</c:forEach>

		</div>
		</c:if>
		<div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <c:if test="${sessionScope.admin!=null }">
        <button type="submit" class="btn btn-primary" id ="qnaReply">답글달기</button>
        </c:if>
     	 <button type="button" class="btn btn-default"  id ="qnaList" >목록보기</button>
      </div>
    </div>
   </fieldset>
   <input type ="hidden" name = "qnaNo" value ="${requestScope.data.qvo.qnaNo}">  
   <hr>
</form>
