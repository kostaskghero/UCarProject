<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript">
	$(document).ready(function(){
		$("#noticeUpdate").click(function(){
			if($("#noticeTitle").val()==""){
				alert("제목을 입력하세요!");
				return false;
			}else if($("#noticeContent").val()==""){
				alert("내용을 입력하세요!");
				return false;
			}
			$("#noticeWriteForm").submit();
		});
		$("#noticeDelete").click(function(){
			location.href ="admin_notice_delete.do?noticeNo=${requestScope.bvo.noticeNo}";
		}); noticeList
		$("#noticeList").click(function(){
			location.href ="${initParam.root }customercenter_home_notice.do";
		});
	});
</script>
${requestScope.bvo.noticeNo}
<form class="form-horizontal" method="post" action="admin_notice_update.do" id="noticeWriteForm">
	 <fieldset>
    <legend>공지 사항 글</legend>
     <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 control-label">아이디</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="noticeMemberId" name="noticeMemberId" value="${requestScope.bvo.noticeMemberId }" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
      <label for="inputTitle" class="col-lg-2 control-label">제목</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="noticeTitle" name="noticeTitle"  value ="${requestScope.bvo.noticeTitle }" readonly="readonly">
      </div>
    </div>
     <div class="form-group">
      <label for="inputContent" class="col-lg-2 control-label">내용</label>
      <div class="col-lg-5">
          <c:choose>
	<c:when test="${sessionScope.loginInfo!=null }">
       <textarea cols="50" rows="10" name="noticeContent" id="noticeContent" >${requestScope.bvo.noticeContent }</textarea>
      	</c:when>
      	<c:otherwise>
      	<textarea cols="50" rows="10" name="noticeContent" id="noticeContent"  readonly="readonly">${requestScope.bvo.noticeContent }</textarea>
      	</c:otherwise>
    </c:choose>
      </div>
    </div>
     <c:choose>
	<c:when test="${sessionScope.loginInfo!=null }">
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="submit" class="btn btn-primary" id ="noticeUpdate">수정</button>
        <button type="reset" class="btn btn-default"  id ="noticeDelete" >삭제</button>
        <button type="reset" class="btn btn-default"  id ="noticeList" >목록보기</button>
      </div>
    </div>
       </c:when>
       <c:otherwise>
       <div class="form-group">
         <div class="col-lg-10 col-lg-offset-2">
         <button type="reset" class="btn btn-default"  id ="noticeList" >목록보기</button>
         </div>
       </div>
       </c:otherwise>
      </c:choose>
    </fieldset>
    <input type ="hidden" name = "noticeNo" value ="${requestScope.bvo.noticeNo }">
</form>
