<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript" src="${initParam.root}resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#noticeUpdate").click(function(){
			obj.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
			if($("#noticeTitle").val()==""){
				alert("제목을 입력하세요!");
				return false;
			}else if($("#noticeContent").val()==""){
				alert("내용을 입력하세요!");
				return false;
			}
			$("#noticeUpdateForm").submit();
		});
		$("#noticeCancel").click(function(){
			location.href = "${initParam.root }customercenter_home_notice.do";
		});
	});
</script>

<c:choose>
<c:when test="${sessionScope.admin!=null }">
<form class="form-horizontal" method="post" action="${initParam.root }admin_notice_update.do" id="noticeUpdateForm" enctype="multipart/form-data">
   <fieldset>
    <legend>공지사항 글쓰기</legend>
    <div class="form-group">
      <label for="inputMemberId" class="col-lg-2 control-label">아이디</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" id="noticeMemberId" name="noticeMemberId" value="${sessionScope.admin.memberId }" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
      <label for="inputTitle" class="col-lg-2 control-label">제목</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="${bvo.noticeTitle}">
      </div>
    </div>
    <div class="form-group">
      <label for="inputContent" class="col-lg-2 control-label">내용</label>
      <div class="col-lg-10">
       <textarea rows="24" style="width:100%;"name="noticeContent" id="noticeContent" value="${bvo.noticeContent}"></textarea>
      <input type="hidden" value="${bvo.noticeNo}" name="noticeNo" id="noticeNo">
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default"  id = "noticeCancel">취소</button>
          <button type="button" class="btn btn-primary" id ="noticeUpdate">수정</button>
      </div>
    </div>
  </fieldset>
</form>
</c:when>
</c:choose>
<script type="text/javascript">
    //전역변수
    var obj = [];               
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder:"noticeContent",
        sSkinURI: "resources/editor/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }   
});
</script>  