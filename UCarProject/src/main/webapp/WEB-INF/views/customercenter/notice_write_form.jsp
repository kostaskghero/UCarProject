<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#noticeWrite").click(function(){
			if($("#noticeTitle").val()==""){
				alert("제목을 입력하세요!");
				return false;
			}else if($("#noticeContent").val()==""){
				alert("내용을 입력하세요!");
				return false;
			}
			$("#noticeWriteForm").submit();
		});
		$("#noticeCancel").click(function(){
			location.href = "${initParam.root }customercenter_home_notice.do";
		});
	});
</script>
<c:choose>
<c:when test="${sessionScope.admin!=null }">
<form class="form-horizontal" method="post" action="${initParam.root }admin_notice_write.do" id="noticeWriteForm">
   <fieldset>
    <legend>공지사항 글쓰기</legend>
    <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 control-label">아이디</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="noticeMemberId" name="noticeMemberId" value="${sessionScope.admin.memberId }" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
      <label for="inputTitle" class="col-lg-2 control-label">제목</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" id="noticeTitle" name="noticeTitle" placeholder="제목을 입력하세요">
      </div>
    </div>
    <div class="form-group">
      <label for="inputContent" class="col-lg-2 control-label">내용</label>
      <div class="col-lg-5">
       <textarea cols="50" rows="10" name="noticeContent" id="noticeContent" placeholder="내용을 입력하세요!"></textarea>
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="submit" class="btn btn-primary" id ="noticeWrite">Submit</button>
        <button type="reset" class="btn btn-default"  id = "noticeCancel">Cancel</button>
      </div>
    </div>
  </fieldset>
</form>
</c:when>
</c:choose>
