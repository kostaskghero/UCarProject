<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${initParam.root}resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#reviewWrite").click(function(){
			obj.getById["reviewContent"].exec("UPDATE_CONTENTS_FIELD", []);
			if($("#reviewTitle").val()==""){
				alert("제목을 입력하세요!");
				return false;
			}/* else if($("#reviewContent").val()==""){
				alert("내용을 입력하세요!");
				return false;
			} */
			$("#reviewWriteForm").submit();
		});
		$("#reviewCancel").click(function(){
			location.href = "${initParam.root }customercenter_review_list.do";
		});
	});
</script>

<form class="form-horizontal" method="post"
	action="${initParam.root }auth_review_write.do" id="reviewWriteForm"  enctype="multipart/form-data">
	<fieldset>
		<legend>이용후기 쓰기</legend>
		<div class="form-group">
			<label for="inputMemberId" class="col-lg-2 control-label">아이디</label>
			<div class="col-lg-10">
				<c:choose>
					<c:when test="${sessionScope.loginInfo != null}">
						<input type="text" class="form-control" id="memberId"
							name="memberId" value="${sessionScope.loginInfo.memberId }"
							readonly="readonly">
					</c:when>
					<c:when test="${sessionScope.admin != null}">
						<input type="text" class="form-control" id="memberId"
							name="memberId" value="${sessionScope.admin.memberId }"
							readonly="readonly">

					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="form-group">
			<label for="inputTitle" class="col-lg-2 control-label">제목</label>
			<div class="col-lg-10">
				<input type="text" class="form-control" id="reviewTitle"
					name="reviewTitle" placeholder="제목을 입력하세요">
			</div>
		</div>
		<div class="form-group">
			<label for="inputContent" class="col-lg-2 control-label">내용</label>
			<div class="col-lg-10">				
				<textarea rows="24" style="width:100%;" id="reviewContent" name="reviewContent"></textarea><br>
			</div>
		</div>
		<!-- <div class="form-group">
			<label for="inputFile" class="col-lg-2 control-label">파일첨부</label>
			<div class="col-lg-5">
				<input type="file" class="form-control"  name="file[0]" id="file[0]">
				<input type="file" class="form-control" name="file[1]" id="file[1]" >
				<input type="file" class="form-control" name="file[2]" id="file[2]">
			</div>
		</div> -->
	</fieldset>

</form>
<%-- <img src="${initParam.root }img/notice.png" width="500" height="400"> --%>

<div class="form-group">
	<div class="col-lg-10 col-lg-offset-2">
		<button type="reset" class="btn btn-default" id="reviewCancel">취소</button>
		<button type="submit" class="btn btn-primary" id="reviewWrite" onclick="test()">작성</button>
	</div>
</div>
<script type="text/javascript">
    //전역변수
    var obj = [];               
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder:"reviewContent",
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
