<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript">
$(function() {
    $( "#accordion" ).accordion({
      collapsible: true
    });
  });
$(document).ready(function(){
	$("#faqWriteForm").click(function(){
		location.href="${initParam.root}admin_faq_write_form.do";
	});
	$("#searchdataForm").submit(function(){
		$("#searchWord").val($("#questionlist").val());
	});
	
		$("#searchBtn").click(function(){
			location.href="customercenter_searchFaqByKeyWord.do?word="+$("#word").val();
		});
		$(":input[name=faqDeleteBtn]").click(
				function() {
					if (confirm("삭제하시겠습니까?"))
						location.href = "admin_faqDelete.do?no="
								+ $(this).val();
				});
		$(":input[name=faqUpdateBtn]").click(
				function() {
					if (confirm("수정하시겠습니까?"))
						location.href = "admin_faq_update_form.do?no="
								+ $(this).val();
				});
});
</script>
    <legend class="col-md-11">자주 묻는 질문</legend>
<form class="form-horizontal" method="post"
	action="${initParam.root}customercenter_searchdata.do"
	id="searchdataForm">
	
	<div class="form-group">
		<div class="col-lg-5  col-lg-offset-2" >
			<input type="text" class="form-control" id="word" name="word"
				placeholder="검색할 내용 입력" onKeyDown="javascript:if (event.keyCode == 13) return false;">
		</div>
		<div class="col-lg-2 ">
			<button type="button" class="btn btn-primary" id="searchBtn">검색</button>
		</div>
	</div>
</form>
<div class="col-md-11">

	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade active in" id="oftenquestion">
			<form role="form">
			<br>
				<div id="accordion">
					<c:forEach items="${requestScope.faqList }" var="list">
						<h3>${list.title }</h3>
						<div>
							<p>${list.content }
							<br>
								<c:if test="${sessionScope.admin!=null}">
								<div class="col-lg-offset-10">
									<button type="button" class="btn btn-xs" name="faqUpdateBtn" value="${list.no}">수정</button>
									<button type="button" class="btn btn-xs" name="faqDeleteBtn" value="${list.no}">삭제</button>
									</div>
								</c:if></p>
						</div>
					</c:forEach>
				</div>
			</form>
		</div>
	</div>
</div>

<br>
<br>
<br>
<c:if test="${sessionScope.admin!=null}">
	<div class="col-md-12 col-lg-offset-8">
		<button type="button" class="btn" id="faqWriteForm">글쓰기</button>
	</div>
</c:if>


