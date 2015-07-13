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

	$("#searchdataForm").submit(function(){
		$("#searchWord").val($("#questionlist").val());
	});
	$("#tab1").click(function(){
		location.href="${initParam.root}customercenter_home_faq.do";
	});
	$("#tab2").click(function(){
		location.href="${initParam.root}customercenter_getFaqListByCategory.do?category=예약과 결제문의";
	});
		$("#tab3").click(function(){
		location.href="${initParam.root}customercenter_getFaqListByCategory.do?category=가입문의";
	});
		$("#tab4").click(function(){
		location.href="${initParam.root}customercenter_getFaqListByCategory.do?category=차량이용";
	});
		$("#tab5").click(function(){
			location.href="${initParam.root}customercenter_getFaqListByCategory.do?category=사고";
		});
		$("#tab6").click(function(){
			location.href="${initParam.root}customercenter_getFaqListByCategory.do?category=탈퇴";
		});
		$("#tab7").click(function(){
			location.href="${initParam.root}customercenter_getFaqListByCategory.do?category=기타";
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
			<button type="button" class="btn btn-primary" id="searchBtn" >검색</button>
		</div>
	</div>
</form>
<div class="col-md-11">
	<ul class="nav nav-tabs">
		<li class="active" id="tab1"><a href="#oftenquestion"
			data-toggle="tab">자주묻는질문</a></li>
		<li id="tab2"><a href="#reserveandpaymentquestion"
			data-toggle="tab">예약과 결제문의</a></li>
		<li id="tab3"><a href="#registerquestion" data-toggle="tab">가입문의</a></li>
		<li id="tab4"><a href="#carusequestion" data-toggle="tab">차량이용</a></li>
		<li id="tab5"><a href="#accidentquestion" data-toggle="tab">사고</a></li>
		<li id="tab6"><a href="#outquestion" data-toggle="tab">탈퇴</a></li>
		<li id="tab7"><a href="#anotherquestion" data-toggle="tab">기타</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade active in" id="oftenquestion">
			<form role="form">
			<br>
				<div id="accordion">
					<c:forEach items="${requestScope.data.faqList }" var="list">
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
	<br>
	<c:if test="${sessionScope.admin!=null}">
	<div class="col-md-12 col-md-offset-11">
		<a href="${initParam.root}admin_faq_write_form.do"><img
			id="writeImg" src="${initParam.root }/img/boardimg/write_btn.jpg"
			border="0"></a>
	</div>
</c:if>
</div>



