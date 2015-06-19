
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#faqWrite").click(function() {

			if ($("#noticeTitle").val() == "") {
				alert("제목을 입력하세요!");
				return false;
			} else if ($("#noticeContent").val() == "") {
				alert("내용을 입력하세요!");
				return false;
			} else if ($("#category").val() == "") {
				alert("분류를 선택하세요!");
				return false;
			}
			
			
			$("#faqWriteForm").submit();
		});
		$("#faqCancel").click(function() {
			location.href = "${initParam.root }customercenter_home_notice.do";
		});
	});
</script>
<c:choose>
	<c:when test="${sessionScope.admin!=null }">
		<form class="form-horizontal" method="post"
			action="${initParam.root }admin_faq_write.do" id="faqWriteForm">
			<fieldset>
				<legend>자주묻는질문 글쓰기</legend>
				<div class="form-group">
					<label for="inputCategory" class="col-lg-2 control-label">분류</label>
					<div class="col-lg-3">
						<select class="form-control" id="category" name="category">
							<option value="">전체</option>
							<c:forEach items="${requestScope.list }" var="data">
								<option value="${data }">${data }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-5">
						<input type="hidden" class="form-control" id="writer"
							name="writer" value="${sessionScope.admin.memberId }">
					</div>
				</div>
				<div class="form-group">
					<label for="inputTitle" class="col-lg-2 control-label">제목</label>
					<div class="col-lg-5">
						<input type="text" class="form-control" id="title" name="title"
							placeholder="제목을 입력하세요">
					</div>
				</div>
				<div class="form-group">
					<label for="inputContent" class="col-lg-2 control-label">내용</label>
					<div class="col-lg-5">
						<textarea cols="100" rows="50" name="content" id="content"
							placeholder="내용을 입력하세요"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="reset" class="btn btn-default" id="noticeCancel">취소</button>
						<button type="submit" class="btn btn-primary" id="faqWrite">작성</button>

					</div>
				</div>
			</fieldset>
		</form>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("로그인하세요");
			location.href = "${initParam.root }member_login_form.do";
		</script>
	</c:otherwise>
</c:choose>
