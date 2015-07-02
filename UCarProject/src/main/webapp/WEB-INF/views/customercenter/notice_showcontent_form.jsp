<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript">
	$(document).ready(function(){
		$("#noticeUpdate").click(function(){
			if(confirm("수정하시겠습니까?"))
				location.href="admin_notice_update_form.do?noticeNo=${requestScope.bvo.noticeNo}"
		});
				
		$("#noticeDelete").click(function(){
			location.href ="admin_notice_delete.do?noticeNo=${requestScope.bvo.noticeNo}";
		}); noticeList
		$("#noticeList").click(function(){
			location.href ="${initParam.root }customercenter_home_notice.do";
		});
	});
</script>
<form class="form-horizontal" method="post" action="admin_notice_update.do" id="noticeWriteForm">
	 <fieldset>
    <legend>공지 사항 글 수정</legend>
     <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 control-label">아이디</label>
      <div class="col-lg-8">
        <input type="text" class="form-control" id="noticeMemberId" name="noticeMemberId" value="${requestScope.bvo.noticeMemberId }" readonly="readonly">
      </div>
    </div>
     <c:choose>
	<c:when test="${sessionScope.admin !=null }">
    <div class="form-group">
      <label for="inputTitle" class="col-lg-2 control-label">제목</label>
      <div class="col-lg-8">
        <input type="text" class="form-control" id="noticeTitle" name="noticeTitle"  value ="${requestScope.bvo.noticeTitle }" readonly="readonly">
      </div>
    </div>
    </c:when>
    </c:choose>
     <div class="form-group">
      <label for="inputContent" class="col-lg-2 control-label">내용</label>
      		<div class="col-lg-8">
				<div class="well">
			
			${requestScope.bvo.noticeContent }
	
				</div>
			</div>
    </div>
     <c:choose>
	<c:when test="${sessionScope.admin != null}">
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="button" class="btn btn-primary" id ="noticeUpdate">수정</button>
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
